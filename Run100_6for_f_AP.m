clear, clc
 
% f_AP_iter =[3 : 2 : 21]*1e3;
f_AP_iter =[21]*1e3;
iter_len = length(f_AP_iter);
ctd = zeros(iter_len, 3);
ctd_fixbf = zeros(iter_len, 3);
ctd_R600 = zeros(iter_len, 3);
ctd_gr_big = zeros(iter_len, 3);
st = tic();
for iter = 1 : iter_len
    f_AP = f_AP_iter(iter);
    [ctd(iter, 1), ctd(iter, 2), ctd(iter, 3)] = Run100_solutioin_for_f_AP(f_AP);
    
    [ctd_fixbf(iter, 1), ctd_fixbf(iter, 2), ctd_fixbf(iter, 3)]...
        = Run100_solutioin_for_f_AP_fixbf_old(f_AP);
    
    [ctd_gr_big(iter, 1), ctd_gr_big(iter, 2), ctd_gr_big(iter, 3)]...
        = Run100_solutioin_for_f_AP_gr_big(f_AP);
    
    [ctd_R600(iter, 1), ctd_R600(iter, 2), ctd_R600(iter, 3)]...
    = Run100_solutioin_for_f_AP_R600(f_AP); % default R 600
    ts = toc(st);
    fprintf('f_AP: %d/%d Time: %f', iter, iter_len, ts);
end

ctd_cc = zeros(1, 3);

[ctd_cc(1), ctd_cc(2), ctd_cc(3)]...
    = Run100_solutioin_for_f_AP_cc();

ts = toc(st)
save ./R100/data6_f_AP
