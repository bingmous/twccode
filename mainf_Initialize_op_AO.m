function [] = mainf_Initialize_op_AO(b_i)
load ./data/data_main_Initialize_parameters N K eta_i_u eta_i_d S_ij_UL S_ij_DL S_ij_CS...
    f_c b_ac C_ij_AP C_ij_CC alpha_i beta_i r_j R...
    theta

T_ij_u = S_ij_UL ./ repmat((eta_i_u .* b_i(1 : N, 1)), [1 K]);
T_ij_d = S_ij_DL ./ repmat((eta_i_d .* b_i(1 : N, 2)), [1 K]);
T_ij_a = S_ij_CS ./ repmat((b_i(1 : N, 3)), [1 K]);
T_ij_c = S_ij_CS ./ f_c;
T_ij_uac = S_ij_UL ./ b_ac;
T_ij_dac = S_ij_DL ./ b_ac;

T_ij_uda = T_ij_u + T_ij_d + T_ij_a;
T_ij_udc = T_ij_u + T_ij_d + T_ij_c + T_ij_uac + T_ij_dac;

T_i_udc = sum(T_ij_u + T_ij_d + T_ij_c + T_ij_uac + T_ij_dac, 2);

% ------------initialize-------------------------
c_i_P = [C_ij_AP - alpha_i * C_ij_CC beta_i * ones(N, 1)]';
c_i_uda = [T_ij_uda ones(N, 1) * (-1)]';
c_i_udc= [-T_ij_udc ones(N, 1) * (-1)]';
e_j = eye(K + 1, K);
c_0_R = [r_j 0]';

% ---------------SDR-reformulation------------------------
A_i_P = zeros(K + 2, K + 2, N); % (K+2)*(K+2)*N
A_i_P(1 : end - 1, end, :) = 1/2 * c_i_P;
A_i_P(end, 1 : end - 1, :) = 1/2 * c_i_P;

A_i_UDA = zeros(K + 2, K + 2, N); % (K+2)*(K+2)*N
A_i_UDA(1 : end - 1, end, :) = 1/2 * c_i_uda;
A_i_UDA(end, 1 : end - 1, :) = 1/2 * c_i_uda;

A_i_UDC = zeros(K + 2, K + 2, N); % (K+2)*(K+2)*N
A_i_UDC(1 : end - 1, end, :) = 1/2 * c_i_udc;
A_i_UDC(end, 1 : end - 1, :) = 1/2 * c_i_udc;

A_0_R = zeros(K + 2, K + 2); % (K+2)*(K+2)*N
A_0_R(1 : end - 1, end) = 1/2 * c_0_R;
A_0_R(end, 1 : end - 1) = 1/2 * c_0_R;

A_j_I = zeros(K + 2, K + 2, K); % (K+2)*(K+2)*K for all users and K services
for j = 1 : K
    A_j_I(:, :, j) = [diag(e_j(:, j)) -1/2 * e_j(:, j); -1/2 * e_j(:, j)' 0];
end

A_j_Ia = zeros(K + 2, K + 2, K);
for j = 1 : K  % apostrophe
    A_j_Ia(:, :, j) = [diag(e_j(:, j)) zeros(K + 1, 1); zeros(1, K + 2)];
end

% for Resource Allocation with Usage cost Constraint
c_i_c = [C_ij_AP - alpha_i * C_ij_CC zeros(N, 1)]'; % (K+1)*N

A_i_c = zeros(K + 2, K + 2, N); % (K+2)*(K+2)*N
A_i_c(1 : end - 1, end, :) = 1/2 * c_i_c;
A_i_c(end, 1 : end - 1, :) = 1/2 * c_i_c;

C_i_max = theta * sum(C_ij_CC, 2);
C_max_con = C_i_max - alpha_i * sum(C_ij_CC, 2);

save ./data/data_mainf_Initialize_op_AO

% disp('mainf_Initialzie_op_AO')

end