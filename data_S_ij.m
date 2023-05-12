% temporary use in the computing process for saving one page of S_ij_UL or DL
clear
% % load ./data/data_main_Initialize N K
% N = 4; %# number of users
% K = 10; %# number of service types
% MinUL = 1; %# quantity of tasks
% MaxUL = 3;
% % MinDL = MinUL;
% % MaxDL = MaxUL;
% % S_ij_UL = randi([MinUL MaxUL], [N K]) * 8; %# N*K transmition data
% % S_ij_DL = randi([MinDL MaxDL], [N K]) * 8; %# N*K reception data
% 
% S_ij_UL = MinUL + (MaxUL - MinUL) * rand(N, K) * 8; %# N*K transmition data
% S_ij_DL = MinUL + (MaxUL - MinUL) * rand(N, K) * 8; %# N*K transmition data
% 
% % S_ij_UL = ones(N, K) * 8 * 2; %# N*K transmition data
% % S_ij_DL = ones(N, K) * 8 * 2; %# N*K reception data
% 
% % for run5_N
% 
% S_ij_UL_cell = {
%     [MinUL + (MaxUL - MinUL) * rand(N, K) * 8];
%     [MinUL + (MaxUL - MinUL) * rand(N + 4, K) * 8];
%     [MinUL + (MaxUL - MinUL) * rand(N + 8, K) * 8];
%     [MinUL + (MaxUL - MinUL) * rand(N + 12, K) * 8];
%     };
% S_ij_DL_cell = {
%     [MinUL + (MaxUL - MinUL) * rand(N, K) * 8];
%     [MinUL + (MaxUL - MinUL) * rand(N + 4, K) * 8];
%     [MinUL + (MaxUL - MinUL) * rand(N + 8, K) * 8];
%     [MinUL + (MaxUL - MinUL) * rand(N + 12, K) * 8];
%     };
% 
% disp('generate new tasks')
% 
% % figure(10)
% % plot(S_ij_UL')
% % title('upload data for N users')
% % stairs(r_j)

% save ./data/data_S_ij S_ij_UL S_ij_DL S_ij_UL_cell S_ij_DL_cell
% save ./data/data_S_ij S_ij_UL S_ij_DL
save ./data/data_S_ij


