function [o_ij_r, a_j_r] = mainf_SDR_op1()

% obtain offloading and caching decisions
load ./data/data_main_Initialize N K B_UL B_DL f_AP R ...
    A_i_P A_i_U A_i_D A_i_A A_i_t A_i_tbar ...
    A_0_R A_j_I A_j_Ia A_i_u A_i_d A_i_a A_i_ubar A_i_dbar ...
    M_ij_sum c_i_u c_i_d c_i_ubar c_i_dbar

X = sdpvar(K + 10, K + 10, N + 1);

% -----------------------constraints--------------------------
temp_1 = 0;
temp_2 = 0;
temp_3 = 0;
for i = 1 : N
    temp_1 = temp_1 + trace(A_i_U * X(:, :, i));
    temp_2 = temp_2 + trace(A_i_D * X(:, :, i));
    temp_3 = temp_3 + trace(A_i_A * X(:, :, i));
end
constraints = [temp_1 <= B_UL
                       temp_2 <= B_DL
                       temp_3 <= f_AP
                       trace(A_0_R * X(:, :, N + 1)) <= R
                       X >= 0
                       0 <= X(end, 1 : K, :) <= 1
                       X(end, K + 1 : end - 1, N + 1) == 0
                       X(end, end, :) == 1];
for i = 1 : N
    for j = 1 : K
        constraints = [constraints
            trace(A_j_I(:, :, j) * X(:, :, i)) == 0
            trace(A_j_Ia(:, :, j) * X(:, :, i)) - trace(A_j_Ia(:, :, j) * X(:, :, N + 1)) <= 0];
    end
    constraints = [constraints
        trace(A_i_tbar(:, :, i) * X(:, :, i)) <= -M_ij_sum(i)
        trace(A_i_u(:, :, i) * X(:, :, i)) <= 0
        trace(A_i_d(:, :, i) * X(:, :, i)) <= 0
        trace(A_i_a(:, :, i) * X(:, :, i)) <= 0
        trace(A_i_t * X(:, :, i)) <= 0
        trace(A_i_ubar(:, :, i) * X(:, :, i)) <= -c_i_u(:, i)' * c_i_ubar
        trace(A_i_dbar(:, :, i) * X(:, :, i)) <= -c_i_d(:, i)' * c_i_dbar];
end
for j = 1 : K
    constraints = [constraints 
        trace(A_j_I(:, :, j) * X(:, :, N + 1)) == 0]; % for cache decision
end

% -----------------------objective--------------------------
objective = 0;
for i = 1 : N
    objective = objective + trace(A_i_P(:, :, i) * X(:, :, i));
end

% -----------------------optimize--------------------------
options = sdpsettings('verbose', 0, 'solver', 'gurobi');
result = optimize(constraints, objective, options);
if result.problem == 0
    x = value(X);
%     obj = value(objective);
else
    yalmiperror(result.problem)
    disp('error');
end

% -------------------recover binary decisions-----------------------
o_ij = squeeze(x(end, 1 : K, 1 : end - 1))'; % delete the first dimension--squeeze
a_j = x(end, 1 : K, N + 1);
% o_ij_r = round(o_ij);
% a_j_r = round(a_j);
o_ij_r = floor(o_ij);
a_j_r = floor(a_j);

% save ./data/data_main_SDR_op1 o_ij_r a_j_r
% disp('mainf_SDR_op1')

end