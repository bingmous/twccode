% TWC N for scalability of the scheme
% SDR
% gr_big
% wAO
% R600
% use this
clear, clc

% run two times with reversed order
% run this first and then run #Run100_12for_N_reversed
N_iter =[2 4 6 8 10 12 14 16 18 20]; 
N_iter = [2:2:6];
N_iter = [5 10 20 40];
N_iter = 5:5:25;
% N_iter = N_iter(end:-1:1); % run two times with reversed order
avg_times = 1;

iter_len = length(N_iter);
td = zeros(iter_len, avg_times);
K = 10;
st0 = tic();
for iter = 1 : iter_len
    N = N_iter(iter);
    S_ij_UL = random('Poisson', 8, N, K); % for easy analysis set each user has identical task distribution
    S_ij_DL = random('Poisson', 8, N, K);
    save ./data/data_S_ij S_ij_UL S_ij_DL
    mainf_main_Initialize_parameters()
    save ./data/data_main_Initialize_parameters N -append
%------------------------------------------
    R=600;
    save ./data/data_main_Initialize_parameters R -append
%------------------------------------------
%     mainf_Initialize();  % this is for wAO initialize
    for t = 1 : avg_times
        st = tic();
%         [~, ~, ~] = mainf_RunOPAO();  %SDR
%         [~, ~, ~] = mainf_RunOPAOc();  %SDR with theta constraint
%         [~, ~, ~] = mainf_RunOPAO_gr_big();  %gr_big
%         [~, ~, ~] = mainf_RunOP12();  %wAO ----
%         [~, ~, ~] = mainf_RunOPAO(); %R600 ----
        [~, ~, ~] = mainf_RunOPAOc(); %R600 ----
        ts = toc(st);
        td(iter, t) = ts;
    end
    
    ts0 = toc(st0);
    fprintf('\nN: %d/%d Time: %f\n', iter, iter_len, ts0);
end


% save ./R100/data12_N
% save ./R100/data12_Nc
% save ./R100/data12_N_gr_big
% % save ./R100/data12_N_wAO
% save ./R100/data12_N_R600
save ./R100/data12_N_R600c

