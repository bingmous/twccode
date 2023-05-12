function [ct_m, c_m, d_m] = Run100_solutioin_for_f_c_fixbf(f_c)
% load ./data/source/data_source
load ./data/source/data_source_poisson S_ij_UL_source S_ij_DL_source
avg_times = 1;
% o = zeros(4, 10, avg_times);
% a = zeros(avg_times, 10);
% b = zeros(4, 3, avg_times);
ct = zeros(avg_times, 1);
c = zeros(avg_times, 1);
d = zeros(avg_times, 1);
st = tic;
% data_ts = zeros(avg_times, 1);
for t = 1 : avg_times
    S_ij_UL = S_ij_UL_source(:, :, t);
    S_ij_DL = S_ij_DL_source(:, :, t);
    save ./data/data_S_ij S_ij_UL S_ij_DL 
    mainf_main_Initialize_parameters()
    save ./data/data_main_Initialize_parameters f_c -append
    [o, ~, b] = mainf_RunOPAO_fixbf();
    [ct(t), c(t), d(t)] = mainf_cost_CT(o, b);
    
    ts = toc(st);
%     data_ts(t) = ts;
    fprintf('\nRun100_solutioin_for_f_c_fixbf %d/%d Time: %f\n', t, avg_times, ts);
end
ct_m = mean(ct);
c_m = mean(c);
d_m = mean(d);

% save ./data/Run100_solution_fixbf
% save ./poisson/Run100_solution_fixbf


end