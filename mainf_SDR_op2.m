function [b_i] = mainf_SDR_op2(o_ij_r)
% obtain transmission and computing resource allocation decisions

load ./data/data_main_Initialize_parameters N eta_i_u eta_i_d S_ij_UL S_ij_DL...
    S_ij_CS B_UL B_DL f_AP f_c b_ac

% -----------------------initialize--------------------------
S_ij_UL_AP = sum(S_ij_UL .* o_ij_r, 2);
S_ij_DL_AP = sum(S_ij_DL .* o_ij_r, 2);
S_ij_CS_AP = sum(S_ij_CS .* o_ij_r, 2);
S_ij_UL_CC = sum(S_ij_UL .* (1 - o_ij_r), 2);
S_ij_DL_CC = sum(S_ij_DL .* (1 - o_ij_r), 2);
S_ij_CS_CC = sum(S_ij_CS .* (1 - o_ij_r), 2);

B = sdpvar(N, 3); % (b_i_u, b_i_d, f_i_a)

% -----------------------constraints--------------------------
c_B_UL = sum(B(:, 1));
c_B_DL = sum(B(:, 2));
c_B_CS = sum(B(:, 3));
constraints = [c_B_UL <= B_UL
                       c_B_DL <= B_DL
                       c_B_CS <= f_AP
                       B>=0];
                   
% -----------------------objective--------------------------
T_i_APU = S_ij_UL_AP ./ (eta_i_u .* B(:, 1)) +...
              S_ij_DL_AP ./ (eta_i_d .* B(:, 2)) +...
              S_ij_CS_AP ./ B(:, 3);
T_i_CCU = S_ij_UL_CC ./ (eta_i_u .* B(:, 1)) +...
              S_ij_DL_CC ./ (eta_i_d .* B(:, 2)) +...
              S_ij_CS_CC ./ f_c +...
              (S_ij_UL_CC + S_ij_DL_CC) ./b_ac; 
          
objective = sum(max(T_i_APU, T_i_CCU));

% -----------------------optimize--------------------------
options = sdpsettings('verbose', 0, 'solver', 'fmincon');
result = optimize(constraints, objective, options);
if result.problem == 0
    b_i = value(B); 
%     obj = value(objective);
%     result
else
    result
    disp('error');
end

% save ./data/data_main_SDR_op2 b_i o_ij_r a_j_r 
% disp('mainf_SDR_op2')

end





