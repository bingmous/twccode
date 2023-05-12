% generate S_ij_UL S_ij_DL
clear,clc
% 
avg_times = 100;

N = 4;
K = 10;

% Min_r_j = 20;
% Max_r_j = 100;

% r_j_source = randi([Min_r_j Max_r_j], [times K]); %# required storage for each service

MinUL = 8; %# quantity of tasks
MaxUL = 24;
% lam = 2;

% d_i = [MinUL + (MaxUL - MinUL) * rand(N, 1)];
d_i = [8 12 18 24];
S_ij_UL_source = zeros(N, K, avg_times);
S_ij_DL_source = zeros(N, K, avg_times);
for i = 1 : N
    S_ij_UL_source(i, :, :) = random('Poisson', d_i(i), 1, K, avg_times);
    S_ij_DL_source(i, :, :) = random('Poisson', d_i(i), 1, K, avg_times);
end

% S_ij_UL_source = random('Poisson', lam, N, K, avg_times) * 8; %# N*K transmition data
% S_ij_DL_source = random('Poisson', lam, N, K, avg_times) * 8; %# N*K transmition data
S_ij_UL_cell_source = {[zeros(N, K, avg_times)];
    [zeros(N + 4, K, avg_times)];
    [zeros(N + 8, K, avg_times)];
    [zeros(N + 12, K, avg_times)]};
S_ij_DL_cell_source = {[zeros(N, K, avg_times)];
    [zeros(N + 4, K, avg_times)];
    [zeros(N + 8, K, avg_times)];
    [zeros(N + 12, K, avg_times)]};
% for i = 1 : N
%     S_ij_UL_source(i, :, :) = random('Poisson', d_i(i), 1, K, avg_times) * 8;
%     S_ij_DL_source(i, :, :) = random('Poisson', d_i(i), 1, K, avg_times) * 8;
% end
% 
% for i = 1 : N
%     S_ij_UL_source(i, :, :) = random('Poisson', d_i(i), 1, K, avg_times) * 8;
%     S_ij_DL_source(i, :, :) = random('Poisson', d_i(i), 1, K, avg_times) * 8;
% end
% 
% for i = 1 : N
%     S_ij_UL_source(i, :, :) = random('Poisson', d_i(i), 1, K, avg_times) * 8;
%     S_ij_DL_source(i, :, :) = random('Poisson', d_i(i), 1, K, avg_times) * 8;
% end
% 
% for i = 1 : N
%     S_ij_UL_source(i, :, :) = random('Poisson', d_i(i), 1, K, avg_times) * 8;
%     S_ij_DL_source(i, :, :) = random('Poisson', d_i(i), 1, K, avg_times) * 8;
% end

% S_ij_UL_cell_source = {
%     [random('Poisson', lam, N, K, avg_times) * 8];
%     [random('Poisson', lam, N + 4, K, avg_times) * 8];
%     [random('Poisson', lam, N + 8, K, avg_times) * 8];
%     [random('Poisson', lam, N + 12, K, avg_times) * 8]};
% S_ij_DL_cell_source = {
%     [MinUL + (MaxUL - MinUL) * random('Poisson', lam, N, K, avg_times) * 8];
%     [MinUL + (MaxUL - MinUL) * random('Poisson', lam, N + 4, K, avg_times) * 8];
%     [MinUL + (MaxUL - MinUL) * random('Poisson', lam, N + 8, K, avg_times) * 8];
%     [MinUL + (MaxUL - MinUL) * random('Poisson', lam, N + 12, K, avg_times) * 8]};

% save ./data/source/data_source_poisson S_ij_UL_source S_ij_DL_source...
%     S_ij_UL_cell_source S_ij_DL_cell_source


