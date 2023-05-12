function [CT, C, T] = mainf_cost_CT(o_ij_r, b_i)
% [CT, C, T] = mainf_cost_CT(o_ij_r, b_i)

load ./data/data_main_Initialize_parameters...
    C_ij_AP C_ij_CC alpha_i beta_i...
    eta_i_u eta_i_d S_ij_UL S_ij_DL S_ij_CS f_c b_ac

% -------usage cost-----------------
C_i_AP = sum(C_ij_AP .* o_ij_r, 2);
C_i_CC = sum(C_ij_CC .* (1 - o_ij_r), 2);
C_i = C_i_AP + alpha_i * C_i_CC;
C = sum(C_i);

% ---------delay cost-----------

S_ij_UL_AP = sum(S_ij_UL .* o_ij_r, 2);
S_ij_DL_AP = sum(S_ij_DL .* o_ij_r, 2);
S_ij_CS_AP = sum(S_ij_CS .* o_ij_r, 2);
S_ij_UL_CC = sum(S_ij_UL .* (1 - o_ij_r), 2);
S_ij_DL_CC = sum(S_ij_DL .* (1 - o_ij_r), 2);
S_ij_CS_CC = sum(S_ij_CS .* (1 - o_ij_r), 2);

T_i_APu = S_ij_UL_AP ./ (eta_i_u .* b_i(:, 1));
T_i_APd = S_ij_DL_AP ./ (eta_i_d .* b_i(:, 2));
T_i_APa = S_ij_CS_AP ./ b_i(:, 3);

T_i_CCu = S_ij_UL_CC ./ (eta_i_u .* b_i(:, 1));
T_i_CCd = S_ij_DL_CC ./ (eta_i_d .* b_i(:, 2));
T_i_CCc = S_ij_CS_CC ./ f_c;
T_i_CCuac = S_ij_UL_CC / b_ac;
T_i_CCdac = S_ij_DL_CC / b_ac;

T_i_AP = T_i_APu + T_i_APd + T_i_APa;
T_i_CC = T_i_CCu + T_i_CCd + T_i_CCc + T_i_CCuac + T_i_CCdac;
T_i = max(T_i_AP, T_i_CC);
T = sum(T_i);
CT = C + beta_i * T;

% save ./data/data_mainf_cost_CT CT C T C_i T_i C_i_AP C_i_CC T_i_AP...
%     T_i_CC T_i_APu T_i_APd T_i_APa T_i_CCu T_i_CCd T_i_CCc T_i_CCuac...
%     T_i_CCdac

end