% clear,clc
% load ./data/source/data_source_poisson S_ij_UL_source S_ij_DL_source
% S_ij_UL_source1 = S_ij_UL_source;
% S_ij_DL_source1 = S_ij_DL_source;
% 
% K = 10;
% S_ij_UL_source = repmat(S_ij_UL_source1, 1 , 1);
% S_ij_DL_source = repmat(S_ij_DL_source1, 1 , 1);
% save ./data/source/data_source_poisson_4 S_ij_UL_source S_ij_DL_source
% 
% S_ij_UL_source = repmat(S_ij_UL_source1, 2 , 1);
% S_ij_DL_source = repmat(S_ij_DL_source1, 2 , 1);
% save ./data/source/data_source_poisson_8 S_ij_UL_source S_ij_DL_source
% 
% S_ij_UL_source = repmat(S_ij_UL_source1, 3 , 1);
% S_ij_DL_source = repmat(S_ij_DL_source1, 3 , 1);
% save ./data/source/data_source_poisson_12 S_ij_UL_source S_ij_DL_source
% 
% S_ij_UL_source = repmat(S_ij_UL_source1, 4 , 1);
% S_ij_DL_source = repmat(S_ij_DL_source1, 4 , 1);
% save ./data/source/data_source_poisson_16 S_ij_UL_source S_ij_DL_source
% 
% S_ij_UL_source = repmat(S_ij_UL_source1, 5 , 1);
% S_ij_DL_source = repmat(S_ij_DL_source1, 5 , 1);
% save ./data/source/data_source_poisson_20 S_ij_UL_source S_ij_DL_source
%--------------------------------------------------------------------------
clear,clc

d = 15;
K = 10;
avg_times = 100;
S_ij_UL_source = random('Poisson', d, 5, K, avg_times);
S_ij_DL_source = random('Poisson', d, 5, K, avg_times);
save ./data/source/data_source_poisson_5 S_ij_UL_source S_ij_DL_source

S_ij_UL_source = random('Poisson', d,10, K, avg_times);
S_ij_DL_source = random('Poisson', d, 10, K, avg_times);
save ./data/source/data_source_poisson_10 S_ij_UL_source S_ij_DL_source

S_ij_UL_source = random('Poisson', d, 15, K, avg_times);
S_ij_DL_source = random('Poisson', d, 15, K, avg_times);
save ./data/source/data_source_poisson_15 S_ij_UL_source S_ij_DL_source

S_ij_UL_source = random('Poisson', d, 20, K, avg_times);
S_ij_DL_source = random('Poisson', d, 20, K, avg_times);
save ./data/source/data_source_poisson_20 S_ij_UL_source S_ij_DL_source

S_ij_UL_source = random('Poisson', d, 25, K, avg_times);
S_ij_DL_source = random('Poisson', d, 25, K, avg_times);
save ./data/source/data_source_poisson_25 S_ij_UL_source S_ij_DL_source

