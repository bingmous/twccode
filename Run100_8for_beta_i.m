clear, clc

% beta_i_iter = 2 : 0.5 : 7; % 2 : 0.5 : 4 // 4.5 : 0.5 : 7
beta_i_iter = 2; % 2 : 0.5 : 4 // 4.5 : 0.5 : 7
beta_i_iter = [1 1.5]; 
iter_len = length(beta_i_iter);
ctd = zeros(iter_len, 3);
ctd_fixbf = zeros(iter_len, 3);
ctd_gre = zeros(iter_len, 3);
ctd_R600 = zeros(iter_len, 3);
ctd_gr_big = zeros(iter_len, 3);
ctd_cc = zeros(1, 3);
st = tic();
for iter = 1 : iter_len
    beta_i = beta_i_iter(iter);
    [ctd(iter, 1), ctd(iter, 2), ctd(iter, 3)] = Run100_solutioin_for_beta_i(beta_i);
    
%     [ctd_fixbf(iter, 1), ctd_fixbf(iter, 2), ctd_fixbf(iter, 3)]...
%         = Run100_solutioin_for_beta_i_fixbf(beta_i);
%     [ctd_fixbf(iter, 1), ctd_fixbf(iter, 2), ctd_fixbf(iter, 3)]...
%         = Run100_solutioin_for_beta_i_fixbf_old(beta_i);
%     
%     [ctd_gr_big(iter, 1), ctd_gr_big(iter, 2), ctd_gr_big(iter, 3)]...
%         = Run100_solutioin_for_beta_i_gr_big(beta_i);
%     
%     [ctd_R600(iter, 1), ctd_R600(iter, 2), ctd_R600(iter, 3)]...
%         = Run100_solutioin_for_beta_i_R600(beta_i); % default R 600


    ts = toc(st);
    fprintf('beta_i: %d/%d Time: %f', iter, iter_len, ts);
end
%     [ctd_cc(1), ctd_cc(2), ctd_cc(3)]... % calculate about beta
%         = Run100_solutioin_for_beta_i_cc();
ts = toc(st)
% save ./R100/data8_beta_i
save ./R100/data8_beta_i_1015
