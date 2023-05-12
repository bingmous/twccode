function [o_ij_r, a_j_r] = mainf_SDR_op_AO1()
% obtain o_ij_r a_j_r again after solving op2
load ./data/data_mainf_Initialize_op_AO

X = sdpvar(K + 2, K + 2, N + 1);

% -----------------------constraints--------------------------
constraints = [X >=0
                       0 <= X(end, 1 : K, :) <= 1
                       X(end, K + 1, N + 1) == 0
                       X(end, end, :) == 1
                       trace(A_0_R * X(:, :, N + 1)) <= R];
for i = 1 : N
    for j = 1 : K
        constraints = [constraints
            trace(A_j_Ia(:, :, j) * X(:, :, i)) - trace(A_j_Ia(:, :, j) * X(:, :, N + 1)) <= 0
            trace(A_j_I(:, :, j) * X(:, :, i)) == 0];
    end
    constraints =[constraints
        trace(A_i_UDA(:, :, i) * X(:, :, i)) <= 0
        trace(A_i_UDC(:, :, i) * X(:, :, i)) <= -T_i_udc(i)];
end

for j = 1 : K
    constraints = [constraints
        trace(A_j_I(:, :, j) * X(:, :, N + 1)) == 0];
end

% -----------------------objective--------------------------
objective = 0;
for i = 1 : N
    objective = objective + trace(A_i_P(:, :, i) * X(:, :, i));
end

% -----------------------optimize--------------------------
% options = sdpsettings('verbose', 0, 'solver', 'bmibnb'); % slowest
% options = sdpsettings('verbose', 0, 'solver', 'sedumi'); % slower
options = sdpsettings('verbose', 0, 'solver', 'gurobi'); % fast
% options = sdpsettings('verbose', 2);
result = optimize(constraints, objective, options);
% result = optimize(constraints, objective);
if result.problem == 0
    x = value(X);
    obj = value(objective);
%     result
else
    result
%     result.info
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
% disp('mainf_SDR_op_AO1')

end
