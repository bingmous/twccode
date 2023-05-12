function [CT, C, T] = mainf_RunOPAO_gr_big()
% select the most task type and cache corresponding service 

load ./data/data_main_Initialize_parameters N K eta_i_u eta_i_d S_ij_UL S_ij_DL...
    S_ij_CS B_UL B_DL f_AP f_c b_ac r_j R C_ij_AP C_ij_CC alpha_i beta_i

[~, r_Index] = sort(sum(S_ij_UL), 'descend');
R_sort = 0;
r_select = 0;
for j = 1 : K
    R_sort = R_sort + r_j(r_Index(j));
    if R_sort <= R
        r_select = r_select + 1;
    else
        break
    end
end

o_ij_gr = zeros(N, K);
a_j_gr = zeros(K, 1);
if r_select ~= 0
    o_ij_gr(:, r_Index(1 : r_select)) = 1;
    a_j_gr(r_Index(1 : r_select)) = 1;
end
    
% -----------------------initialize--------------------------
S_ij_UL_AP = sum(S_ij_UL .* o_ij_gr, 2);
S_ij_DL_AP = sum(S_ij_DL .* o_ij_gr, 2);
S_ij_CS_AP = sum(S_ij_CS .* o_ij_gr, 2);
S_ij_UL_CC = sum(S_ij_UL .* (1 - o_ij_gr), 2);
S_ij_DL_CC = sum(S_ij_DL .* (1 - o_ij_gr), 2);
S_ij_CS_CC = sum(S_ij_CS .* (1 - o_ij_gr), 2);

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
              (S_ij_UL_CC + S_ij_DL_CC) ./ b_ac; 
          
% -----------------------optimize--------------------------
objective = sum(max(T_i_APU, T_i_CCU));
options = sdpsettings('verbose', 0, 'solver', 'fmincon');
result = optimize(constraints, objective, options);
if result.problem == 0
%     b_i = value(B); 
    obj = value(objective);
else
    result
    disp('error');
end

C_i = sum(C_ij_AP .* o_ij_gr, 2) + alpha_i * sum(C_ij_CC .* (1 - o_ij_gr), 2);
C = sum(C_i);
T = obj;
CT = C + beta_i * T;

% disp('mainf_RunOPAO_gr')


end




