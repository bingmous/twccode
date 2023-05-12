% TWC r_j for requirement of service
clear, clc
 
% r_j_iter =[20:20:120]; % for easy analysis set each service is identical size
r_j_iter = 20;
iter_len = length(r_j_iter);
ctd = zeros(iter_len, 3);
ctd_fixbf = zeros(iter_len, 3);
ctd_R600 = zeros(iter_len, 3);
ctd_gr_big = zeros(iter_len, 3);
ctd_cc = zeros(1, 3);
st = tic();
for iter = 1 : iter_len
    r_j = repmat(r_j_iter(iter), 1, 10); % K=10
    [ctd(iter, 1), ctd(iter, 2), ctd(iter, 3)] = Run100_solutioin_for_r_j(r_j);
    
    [ctd_fixbf(iter, 1), ctd_fixbf(iter, 2), ctd_fixbf(iter, 3)]...
        = Run100_solutioin_for_r_j_fixbf_old(r_j);
    
    [ctd_gr_big(iter, 1), ctd_gr_big(iter, 2), ctd_gr_big(iter, 3)]...
        = Run100_solutioin_for_r_j_gr_big(r_j);
    
    [ctd_R600(iter, 1), ctd_R600(iter, 2), ctd_R600(iter, 3)]...
    = Run100_solutioin_for_r_j_R600(r_j); % default R 600


    ts = toc(st);
    fprintf('eta: %d/%d Time: %f', iter, iter_len, ts);
end
%     [ctd_cc(1), ctd_cc(2), ctd_cc(3)]...
%     = Run100_solutioin_for_r_j_cc(r_j); %no need to run, use single  run result if run 100avg



ts = toc(st)
save ./R100/data11_r_j
