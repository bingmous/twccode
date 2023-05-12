clear, clc

% f_c_iter = (1 : 2 : 9)*10^3;
f_c_iter = (1)*10^3;
iter_len = length(f_c_iter);
ctd = zeros(iter_len, 3);
ctd_fixbf = zeros(iter_len, 3);
ctd_gre = zeros(iter_len, 3);
ctd_R600 = zeros(iter_len, 3);
ctd_gr_big = zeros(iter_len, 3);
ctd_cc = zeros(iter_len, 3);
st = tic();
for iter = 1 : iter_len
    f_c = f_c_iter(iter);
    [ctd(iter, 1), ctd(iter, 2), ctd(iter, 3)] = Run100_solutioin_for_f_c(f_c);
    
%     [ctd_fixbf(iter, 1), ctd_fixbf(iter, 2), ctd_fixbf(iter, 3)]...
%         = Run100_solutioin_for_f_c_fixbf(f_c);

    [ctd_fixbf(iter, 1), ctd_fixbf(iter, 2), ctd_fixbf(iter, 3)]...
        = Run100_solutioin_for_f_c_fixbf_old(f_c);
    
    [ctd_gr_big(iter, 1), ctd_gr_big(iter, 2), ctd_gr_big(iter, 3)]...
        = Run100_solutioin_for_f_c_gr_big(f_c);
    
    [ctd_R600(iter, 1), ctd_R600(iter, 2), ctd_R600(iter, 3)]...
        = Run100_solutioin_for_f_c_R600(f_c); % default R 600

    [ctd_cc(iter, 1), ctd_cc(iter, 2), ctd_cc(iter, 3)]...
        = Run100_solutioin_for_f_c_cc(f_c);
    ts = toc(st);
    fprintf('f_c: %d/%d Time: %f', iter, iter_len, ts);
end

ts = toc(st)
save ./R100/data7_f_c
