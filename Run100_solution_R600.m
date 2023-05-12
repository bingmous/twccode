clear,clc
% change R=600 in function mainf_main_Initialzie_parameters()
% load ./data/source/data_source
load ./data/source/data_source_poisson
avg_times = 1;
o = zeros(4, 10, avg_times);
a = zeros(avg_times, 10);
b = zeros(4, 3, avg_times);
ct = zeros(avg_times, 1);
cd = zeros(avg_times, 1);
td = zeros(avg_times, 1);
st = tic;
% data_ts = zeros(avg_times, 1);
for t = 1 : avg_times
    S_ij_UL = S_ij_UL_source(:, :, t);
    S_ij_DL = S_ij_DL_source(:, :, t);
    save ./data/data_S_ij S_ij_UL S_ij_DL 
    mainf_main_Initialize_parameters()
    R = 600;
    save ./data/data_main_Initialize_parameters R -append
    [o(:, :, t), a(t, :), b(:, :, t)] = mainf_RunOPAO();
    [ct(t), cd(t), td(t)] = mainf_cost_CT(o(:, :, t), b(:, :, t));
    
    ts = toc(st);
%     data_ts(t) = ts;
    fprintf('\nRun100_solution_R600 %d/%d Time: %f\n', t, avg_times, ts);
end
% save ./data/Run100_solution_R600
% save ./poisson/Run100_solution

save ./poisson/Run100_solution_R600_debug
