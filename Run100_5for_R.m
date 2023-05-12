clear, clc

% R_iter = 0 : 100 : 700;
R_iter = 0;

iter_len = length(R_iter);
ctd = zeros(iter_len, 3);
ctd_fixbf = zeros(iter_len, 3);
ctd_gr_big = zeros(iter_len, 3);
st = tic();
for iter = 1 : iter_len
    R = R_iter(iter);
    [ctd(iter, 1), ctd(iter, 2), ctd(iter, 3)] = Run100_solutioin_for_R(R);
    
%     [ctd_fixbf(iter, 1), ctd_fixbf(iter, 2), ctd_fixbf(iter, 3)]...
%         = Run100_solutioin_for_R_fixbf(R);
    [ctd_fixbf(iter, 1), ctd_fixbf(iter, 2), ctd_fixbf(iter, 3)]...
        = Run100_solutioin_for_R_fixbf_old(R);
    
    [ctd_gr_big(iter, 1), ctd_gr_big(iter, 2), ctd_gr_big(iter, 3)]...
        = Run100_solutioin_for_R_gr_big(R);
    ts = toc(st);
    fprintf('R: %d/%d Time: %f', iter, iter_len, ts);
end

ctd_cc = zeros(1, 3);
ctd_R600 = zeros(1, 3);

[ctd_cc(1), ctd_cc(2), ctd_cc(3)]...
    = Run100_solutioin_for_R_cc();

[ctd_R600(1), ctd_R600(2), ctd_R600(3)]...
    = Run100_solutioin_for_R_R600();
ts = toc(st)
save ./R100/data5_R
