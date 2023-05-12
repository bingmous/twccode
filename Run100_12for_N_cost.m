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
N_iter = 5:5:25;
% N_iter = 25;
% N_iter = 8;
% N_iter = N_iter(end:-1:1); % run two times with reversed order
avg_times = 1;

iter_len = length(N_iter);
ctd = zeros(iter_len, 3, avg_times);
K = 10;
st0 = tic();
for iter = 1 : iter_len
    N = N_iter(iter);
    if N == 5
        load ./data/source/data_source_poisson_5 S_ij_UL_source S_ij_DL_source
    end
    if N == 10
        load ./data/source/data_source_poisson_10 S_ij_UL_source S_ij_DL_source
    end
    if N == 15
        load ./data/source/data_source_poisson_15 S_ij_UL_source S_ij_DL_source
    end
    if N == 20
        load ./data/source/data_source_poisson_20 S_ij_UL_source S_ij_DL_source
    end
    if N == 25
        load ./data/source/data_source_poisson_25 S_ij_UL_source S_ij_DL_source
    end


    for t = 1 : avg_times
        S_ij_UL = S_ij_UL_source(:, :, t);
        S_ij_DL = S_ij_DL_source(:, :, t);
        save ./data/data_S_ij S_ij_UL S_ij_DL
        mainf_main_Initialize_parameters()
        save ./data/data_main_Initialize_parameters N -append

% -----------------------SDR-----------------------
%         [o,~,b] = mainf_RunOPAO();  
%         [ctd(iter, 1, t),ctd(iter, 2, t),ctd(iter, 3, t)] = mainf_cost_CT(o, b);

% ----------------------- SDR with theta constraint-----------------------
%         [o,~,b] = mainf_RunOPAOc();  
%         [ctd(iter, 1, t),ctd(iter, 2, t),ctd(iter, 3, t)] = mainf_cost_CT(o, b);

% ------------------------gr_big-----------------------
%         [ctd(iter, 1, t),ctd(iter, 2, t),ctd(iter, 3, t)] = mainf_RunOPAO_gr_big();  
        
% ----------------------- wAO-----------------------
%         mainf_Initialize();  % this is for wAO initialize
%         [o,~,b] = mainf_RunOP12();  
%         [ctd(iter, 1, t),ctd(iter, 2, t),ctd(iter, 3, t)] = mainf_cost_CT(o, b);

% ----------------------- R600-----------------------
% [ctd(iter, 1, t),ctd(iter, 2, t),ctd(iter, 3, t)] = mainf_RunOPAO_cc();
%         R=600;
%         save ./data/data_main_Initialize_parameters R -append
%         [o,~,b] = mainf_RunOPAO(); 
%         [ctd(iter, 1, t),ctd(iter, 2, t),ctd(iter, 3, t)] = mainf_cost_CT(o, b);
% ----------------------- R600c-----------------------
% [ctd(iter, 1, t),ctd(iter, 2, t),ctd(iter, 3, t)] = mainf_RunOPAO_cc();
        R=600;
        save ./data/data_main_Initialize_parameters R -append
        [o,~,b] = mainf_RunOPAOc(); 
        [ctd(iter, 1, t),ctd(iter, 2, t),ctd(iter, 3, t)] = mainf_cost_CT(o, b);
    end
    
    ts0 = toc(st0);
    fprintf('\nN: %d/%d Time: %f\n', iter, iter_len, ts0);
end

% ctdm = mean(ctd, 3);
% save ./R100/data12_N_cost
% save ./R100/data12_N_costc
% save ./R100/data12_N_cost_R600
save ./R100/data12_N_cost_R600c


% save ./R100/data12_N_cost
% save ./R100/data12_N_costc
% save ./R100/data12_N_cost_gr_big
% save ./R100/data12_N_cost_wAO
% save ./R100/data12_N_cost_R600


%cost
%wAO
%R600
