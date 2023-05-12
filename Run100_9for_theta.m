clear, clc

theta_iter = 1;
% theta_iter = 1 : 0.1 : 1.6;
iter_len = length(theta_iter);
ctd = zeros(1, 3);
ctd_R600 = zeros(1, 3);
ctdc = zeros(iter_len, 3);
% ctd_fixbf = zeros(iter_len, 3);
ctdc_R600 = zeros(1, 3);
ctdc_fixbf = zeros(iter_len, 3);
% ctd_gr_big = zeros(iter_len, 3);
ctd_cc = zeros(1, 3);
st = tic();
for iter = 1 : iter_len
    theta = theta_iter(iter);
    [ctdc(iter, 1), ctdc(iter, 2), ctdc(iter, 3)] = Run100_solutioin_for_thetac(theta);
    
%     [ctdc_fixbf(iter, 1), ctdc_fixbf(iter, 2), ctdc_fixbf(iter, 3)]...
%         = Run100_solutioin_for_thetac_fixbf(theta); %no use
    [ctdc_fixbf(iter, 1), ctdc_fixbf(iter, 2), ctdc_fixbf(iter, 3)]...
        = Run100_solutioin_for_thetac_fixbf_old(theta);
    
    
    [ctdc_R600(iter, 1), ctdc_R600(iter, 2), ctdc_R600(iter, 3)]...
        = Run100_solutioin_for_thetac_R600(theta); % default R 600


    ts = toc(st);
    fprintf('theta: %d/%d Time: %f', iter, iter_len, ts);
end
    [ctd_cc(1), ctd_cc(2), ctd_cc(3)]...
        = Run100_solutioin_for_theta_cc();
    
    [ctd(1), ctd(2), ctd(3)] = Run100_solutioin_for_theta();
    
    [ctd_R600(1), ctd_R600(2), ctd_R600(3)]...
        = Run100_solutioin_for_theta_R600(); % default R 600
ts = toc(st)

save ./R100/data9_theta

% add data Run100_solution_fixbf_old
% load ./poisson/Run100_solution_fixbf_old o b
% ctd_fixbf = zeros(1, 3);
% [ctd_fixbf(1), ctd_fixbf(2), ctd_fixbf(3)] = mainf_cost_CT_special(o, b);
% save ./R100/data9_theta ctd_fixbf -append

