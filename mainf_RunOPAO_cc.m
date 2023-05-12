function [CT, C, T] = mainf_RunOPAO_cc()
% Only Cloud processing

load ./data/data_main_Initialize_parameters N K eta_i_u eta_i_d S_ij_UL S_ij_DL...
    S_ij_CS B_UL B_DL f_c b_ac C_ij_CC alpha_i beta_i

% o_ij_cc = zeros(N, K);
% -----------------------initialize--------------------------

S_ij_UL_CC = sum(S_ij_UL, 2);
S_ij_DL_CC = sum(S_ij_DL, 2);
S_ij_CS_CC = sum(S_ij_CS, 2);

B = sdpvar(N, 2); % (b_i_u, b_i_d)

% -----------------------constraints--------------------------
c_B_UL = sum(B(:, 1));
c_B_DL = sum(B(:, 2));

constraints = [c_B_UL <= B_UL
                       c_B_DL <= B_DL
                       B>=0];
                   
% -----------------------objective--------------------------
T_i_CCU = S_ij_UL_CC ./ (eta_i_u .* B(:, 1)) +...
              S_ij_DL_CC ./ (eta_i_d .* B(:, 2)) +...
              S_ij_CS_CC ./ f_c +...
              (S_ij_UL_CC + S_ij_DL_CC) ./b_ac; 
          
% -----------------------optimize--------------------------
objective = sum(T_i_CCU);
options = sdpsettings('verbose', 0, 'solver', 'fmincon');
result = optimize(constraints, objective, options);
if result.problem == 0
%     b_i = value(B); 
    obj = value(objective);
else
    result
    disp('error');
end

C_i = alpha_i * sum(C_ij_CC, 2);
C = sum(C_i);
% T_i = value(T_i_CCU);
T = obj;
CT = C + beta_i * T;

% disp('mainf_RunOPAO_cc')


end




