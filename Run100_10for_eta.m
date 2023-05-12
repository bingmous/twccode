% TWC eta for mobility of mobile users
clear, clc
 
eta_iter =[1:0.5:4];
% eta_iter =[1:4];
% eta_iter =3;
iter_len = length(eta_iter);
ctd = zeros(iter_len, 3);
ctd_fixbf = zeros(iter_len, 3);
ctd_R600 = zeros(iter_len, 3);
ctd_gr_big = zeros(iter_len, 3);
ctd_cc = zeros(iter_len, 3);

ctd_sim = zeros(iter_len, 3);
st = tic();
for iter = 1 : iter_len
    eta_i_u = eta_iter(iter);
    [ctd(iter, 1), ctd(iter, 2), ctd(iter, 3)] = Run100_solutioin_for_eta(eta_i_u);
    
    [ctd_fixbf(iter, 1), ctd_fixbf(iter, 2), ctd_fixbf(iter, 3)]...
        = Run100_solutioin_for_eta_fixbf_old(eta_i_u);
    
    [ctd_gr_big(iter, 1), ctd_gr_big(iter, 2), ctd_gr_big(iter, 3)]...
        = Run100_solutioin_for_eta_gr_big(eta_i_u);
    
    [ctd_R600(iter, 1), ctd_R600(iter, 2), ctd_R600(iter, 3)]...
        = Run100_solutioin_for_eta_R600(eta_i_u); % default R 600

    [ctd_cc(iter, 1), ctd_cc(iter, 2), ctd_cc(iter, 3)]...
        = Run100_solutioin_for_eta_cc(eta_i_u);
    
%     add simple
    [ctd_sim(iter, 1), ctd_sim(iter, 2), ctd_sim(iter, 3)] = Run100_solutioin_for_eta_sim(eta_i_u);


    ts = toc(st);
    fprintf('eta: %d/%d Time: %f', iter, iter_len, ts);
end

ts = toc(st)
% save ./R100/data10_eta
