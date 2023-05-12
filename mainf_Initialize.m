function [] = mainf_Initialize()
% Initialize matrix before solving
load ./data/data_main_Initialize_parameters 

% ---------------------definition------------------------
M_ij = (S_ij_UL + S_ij_DL) / b_ac + S_ij_CS / f_c; % N*K
M_ij_sum = sum(M_ij, 2);

% ---------------SDR-formulation------------------------
c_i_P = [C_ij_AP - alpha_i * C_ij_CC zeros(N, 8) beta_i * ones(N, 1)]'; % (K+9)*N
c_i_U = [zeros(1, K + 1) 1 zeros(1, 7)]'; % (K+9)*1 for all users
c_i_D = [zeros(1, K + 4)  1 zeros(1, 4)]'; % (K+9)*1 for all users
c_i_A = [zeros(1, K + 6) 1 zeros(1, 2)]'; % (K+9)*1 for all users
c_0_R = [r_j zeros(1, 9)]'; % (K+9)*1 for all users
e_j = eye(K + 9, K); % (K+9)*K  K services. % It's diag(e_j(:, j)) in paper
c_i_t = [zeros(1, K) 1 0 0 1 0 0 0 1 -1]'; % (K+9)*1 for all users
c_i_tbar = [-M_ij repmat([-1 0 1 -1 0 1 0 0 -1], [N 1])]'; % (K+9)*N

F_i_u = zeros(K + 9, K + 9, N); % (K+9)*(K+9)*N
F_i_u(K + 1, K + 2, :) = -1/2 * eta_i_u; 
F_i_u(K + 2, K + 1, :) = -1/2 * eta_i_u;

F_i_d = zeros(K + 9, K + 9, N); % (K+9)*(K+9)*N
F_i_d(K + 4, K + 5, :) = -1/2 * eta_i_d; 
F_i_d(K + 5, K + 4, :) = -1/2 * eta_i_d;

F_i_a = zeros(K + 9, K + 9, N); % (K+9)*(K+9)*N % It's used in N
F_i_a(K + 7, K + 8, :) = -1/2;
F_i_a(K + 8, K + 7, :) = -1/2;

c_i_u = [S_ij_UL zeros(N, 9)]'; % (K+9)*N
c_i_d = [S_ij_DL zeros(N, 9)]';
c_i_a = [S_ij_CS zeros(N, 9)]';
c_i_dbar = [ones(1, K), zeros(1, 9)]'; % (K+9)*1
c_i_ubar = c_i_dbar;

F_i_ubar = zeros(K + 9, K + 9, N); % (K+9)*(K+9)*N
F_i_ubar(K + 2, K + 3, :) = -1/2 * eta_i_u; 
F_i_ubar(K + 3, K + 2, :) = -1/2 * eta_i_u;  

F_i_dbar = zeros(K + 9, K + 9, N); % (K+9)*(K+9)*N
F_i_dbar(K + 5, K + 6, :) = -1/2 * eta_i_d; 
F_i_dbar(K + 6, K + 5, :) = -1/2 * eta_i_d; 

% ---------------SDR-reformulation------------------------
A_i_P = zeros(K + 10, K + 10, N); % (K+10)*(K+10)*N
A_i_P(1 : end - 1, end, :) = 1/2 * c_i_P;
A_i_P(end, 1 : end - 1, :) = 1/2 * c_i_P;

A_i_U = zeros(K + 10, K + 10); % (K+10)*(K+10)*1 for all users
A_i_U(1 : end - 1, end) = 1/2 * c_i_U;
A_i_U(end, 1 : end - 1) = 1/2 * c_i_U;

A_i_D = zeros(K + 10, K + 10); % (K+10)*(K+10)*1 for all users
A_i_D(1 : end - 1, end) = 1/2 * c_i_D;
A_i_D(end, 1 : end - 1) = 1/2 * c_i_D;

A_i_A = zeros(K + 10, K + 10); % (K+10)*(K+10)*1 for all users
A_i_A(1 : end - 1, end) = 1/2 * c_i_A;
A_i_A(end, 1 : end - 1) = 1/2 * c_i_A;

A_i_t = zeros(K + 10, K + 10); % (K+10)*(K+10)*1 for all users
A_i_t(1 : end - 1, end) = 1/2 * c_i_t;
A_i_t(end, 1 : end - 1) = 1/2 * c_i_t;

A_i_tbar = zeros(K + 10, K + 10, N); % (K+10)*(K+10)*N
A_i_tbar(1 : end - 1, end, :) = 1/2 * c_i_tbar;
A_i_tbar(end, 1 : end - 1, :) = 1/2 * c_i_tbar;

A_0_R = zeros(K + 10, K + 10); % (K+10)*(K+10)*1 for all users
A_0_R(1 : end - 1, end) = 1/2 * c_0_R;
A_0_R(end, 1 : end - 1) = 1/2 * c_0_R;

A_j_I = zeros(K + 10, K + 10, K); % (K+10)*(K+10)*K for all users and K services
for j = 1 : K
    A_j_I(:, :, j) = [diag(e_j(:, j)) -1/2 * e_j(:, j); -1/2 * e_j(:, j)' 0];
end

A_j_Ia = zeros(K + 10, K + 10, K); % (K+10)*(K+10)*K for all users and K services
for j = 1 : K  % apostrophe
    A_j_Ia(:, :, j) = [diag(e_j(:, j)) zeros(K + 9, 1); zeros(1, K + 10)];
end

A_i_u = zeros(K + 10, K + 10, N); % (K+10)*(K+10)*N
A_i_u(1 : end- 1, 1 : end - 1, :) = F_i_u;
A_i_u(1 : end - 1, end, :) = 1/2 * c_i_u;
A_i_u(end, 1 : end - 1, :) = 1/2 * c_i_u;

A_i_d = zeros(K + 10, K + 10, N); % (K+10)*(K+10)*N
A_i_d(1 : end- 1, 1 : end - 1, :) = F_i_d;
A_i_d(1 : end - 1, end, :) = 1/2 * c_i_d;
A_i_d(end, 1 : end - 1, :) = 1/2 * c_i_d;

A_i_a = zeros(K + 10, K + 10, N); % (K+10)*(K+10)*N
A_i_a(1 : end- 1, 1 : end - 1, :) = F_i_a;
A_i_a(1 : end - 1, end, :) = 1/2 * c_i_a;
A_i_a(end, 1 : end - 1, :) = 1/2 * c_i_a;

A_i_ubar = zeros(K + 10, K + 10, N); % (K+10)*(K+10)*N
A_i_ubar(1 : end- 1, 1 : end - 1, :) = F_i_ubar;

A_i_dbar = zeros(K + 10, K + 10, N); % (K+10)*(K+10)*N
A_i_dbar(1 : end- 1, 1 : end - 1, :) = F_i_dbar;

% for Resource Allocation with Usage cost Constraint
c_i_c = [C_ij_AP - alpha_i * C_ij_CC zeros(N, 9)]'; % (K+9)*N

A_i_c = zeros(K + 10, K + 10, N); % (K+10)*(K+10)*N
A_i_c(1 : end - 1, end, :) = 1/2 * c_i_c;
A_i_c(end, 1 : end - 1, :) = 1/2 * c_i_c;

C_i_max = theta * sum(C_ij_CC, 2);
C_max_con = C_i_max - alpha_i * sum(C_ij_CC, 2);

save ./data/data_main_Initialize
% disp('mainf_Initialize')

end


