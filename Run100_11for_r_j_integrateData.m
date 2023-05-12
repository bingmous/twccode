% integrate Data for r_j
clear,clc
r_j_iter0 = [20 40 60 80 100 120 140 160];
r_j_iter0 = [20 30 40 60 80 90 100 120 140 150 160];
iter_len = length(r_j_iter0);

tctd = zeros(iter_len, 3);
tctd_fixbf = zeros(iter_len, 3);
tctd_R600 = zeros(iter_len, 3);
tctd_gr_big = zeros(iter_len, 3);
tctd_cc = zeros(1, 3);

load ./R100/data11_r_j_20
tctd(1, :) = ctd;
tctd_fixbf(1, :) = ctd_fixbf;
tctd_R600(1, :) = ctd_R600;
tctd_gr_big(1, :) = ctd_gr_big;
load ./R100/data11_r_j_30
tctd(2, :) = ctd;
tctd_fixbf(2, :) = ctd_fixbf;
tctd_R600(2, :) = ctd_R600;
tctd_gr_big(2, :) = ctd_gr_big;
load ./R100/data11_r_j_40
tctd(3, :) = ctd;
tctd_fixbf(3, :) = ctd_fixbf;
tctd_R600(3, :) = ctd_R600;
tctd_gr_big(3, :) = ctd_gr_big;
load ./R100/data11_r_j_60
tctd(4, :) = ctd;
tctd_fixbf(4, :) = ctd_fixbf;
tctd_R600(4, :) = ctd_R600;
tctd_gr_big(4, :) = ctd_gr_big;
load ./R100/data11_r_j_80
tctd(5, :) = ctd;
tctd_fixbf(5, :) = ctd_fixbf;
tctd_R600(5, :) = ctd_R600;
tctd_gr_big(5, :) = ctd_gr_big;
load ./R100/data11_r_j_90
tctd(6, :) = ctd;
tctd_fixbf(6, :) = ctd_fixbf;
tctd_R600(6, :) = ctd_R600;
tctd_gr_big(6, :) = ctd_gr_big;
load ./R100/data11_r_j_100
tctd(7, :) = ctd;
tctd_fixbf(7, :) = ctd_fixbf;
tctd_R600(7, :) = ctd_R600;
tctd_gr_big(7, :) = ctd_gr_big;
load ./R100/data11_r_j_120
tctd(8, :) = ctd;
tctd_fixbf(8, :) = ctd_fixbf;
tctd_R600(8, :) = ctd_R600;
tctd_gr_big(8, :) = ctd_gr_big;
load ./R100/data11_r_j_140
tctd(9, :) = ctd;
tctd_fixbf(9, :) = ctd_fixbf;
tctd_R600(9, :) = ctd_R600;
tctd_gr_big(9, :) = ctd_gr_big;
load ./R100/data11_r_j_150
tctd(10, :) = ctd;
tctd_fixbf(10, :) = ctd_fixbf;
tctd_R600(10, :) = ctd_R600;
tctd_gr_big(10, :) = ctd_gr_big;
load ./R100/data11_r_j_160
tctd(11, :) = ctd;
tctd_fixbf(11, :) = ctd_fixbf;
tctd_R600(11, :) = ctd_R600;
tctd_gr_big(11, :) = ctd_gr_big;

r_j_iter = r_j_iter0;
iter_len = length(r_j_iter0);

load ./poisson/Run100_solution_cc ct cd td
tctd_cc = mean([ct cd td]);

ctd = tctd;
ctd_fixbf = tctd_fixbf;
ctd_R600 = tctd_R600;
ctd_gr_big = tctd_gr_big;
ctd_cc = tctd_cc;
save ./R100/data11_r_j ctd  ctd_fixbf ctd_R600 ctd_gr_big ctd_cc...
    r_j_iter iter_len

%%%%%%%%%%%%%choose%%%%%%%%%%%%%
% r_j_iter = [20 30 40 60 80 90 100 120 140 150 160];
r_j_iter0 = [30 60 90 120 150];
iter_len = length(r_j_iter0);

tctd = zeros(iter_len, 3);
tctd_fixbf = zeros(iter_len, 3);
tctd_R600 = zeros(iter_len, 3);
tctd_gr_big = zeros(iter_len, 3);
tctd_cc = zeros(1, 3);

load ./R100/data11_r_j_30
tctd(1, :) = ctd;
tctd_fixbf(1, :) = ctd_fixbf;
tctd_R600(1, :) = ctd_R600;
tctd_gr_big(1, :) = ctd_gr_big;
load ./R100/data11_r_j_60
tctd(2, :) = ctd;
tctd_fixbf(2, :) = ctd_fixbf;
tctd_R600(2, :) = ctd_R600;
tctd_gr_big(2, :) = ctd_gr_big;
load ./R100/data11_r_j_90
tctd(3, :) = ctd;
tctd_fixbf(3, :) = ctd_fixbf;
tctd_R600(3, :) = ctd_R600;
tctd_gr_big(3, :) = ctd_gr_big;
load ./R100/data11_r_j_120
tctd(4, :) = ctd;
tctd_fixbf(4, :) = ctd_fixbf;
tctd_R600(4, :) = ctd_R600;
tctd_gr_big(4, :) = ctd_gr_big;
load ./R100/data11_r_j_150
tctd(5, :) = ctd;
tctd_fixbf(5, :) = ctd_fixbf;
tctd_R600(5, :) = ctd_R600;
tctd_gr_big(5, :) = ctd_gr_big;

r_j_iter = r_j_iter0;
iter_len = length(r_j_iter0);

load ./poisson/Run100_solution_cc ct cd td
tctd_cc = mean([ct cd td]);

ctd = tctd;
ctd_fixbf = tctd_fixbf;
ctd_R600 = tctd_R600;
ctd_gr_big = tctd_gr_big;
ctd_cc = tctd_cc;
save ./R100/data11_r_j2 ctd  ctd_fixbf ctd_R600 ctd_gr_big ctd_cc...
    r_j_iter iter_len

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% r_j_iter = [20 30 40 60 80 90 100 120 140 150 160];
r_j_iter0 = [40 60 80 100 120 140 160 180];
iter_len = length(r_j_iter0);

tctd = zeros(iter_len, 3);
tctd_fixbf = zeros(iter_len, 3);
tctd_R600 = zeros(iter_len, 3);
tctd_gr_big = zeros(iter_len, 3);
tctd_cc = zeros(1, 3);

load ./R100/data11_r_j_40
tctd(1, :) = ctd;
tctd_fixbf(1, :) = ctd_fixbf;
tctd_R600(1, :) = ctd_R600;
tctd_gr_big(1, :) = ctd_gr_big;
load ./R100/data11_r_j_60
tctd(2, :) = ctd;
tctd_fixbf(2, :) = ctd_fixbf;
tctd_R600(2, :) = ctd_R600;
tctd_gr_big(2, :) = ctd_gr_big;
load ./R100/data11_r_j_80
tctd(3, :) = ctd;
tctd_fixbf(3, :) = ctd_fixbf;
tctd_R600(3, :) = ctd_R600;
tctd_gr_big(3, :) = ctd_gr_big;
load ./R100/data11_r_j_100
tctd(4, :) = ctd;
tctd_fixbf(4, :) = ctd_fixbf;
tctd_R600(4, :) = ctd_R600;
tctd_gr_big(4, :) = ctd_gr_big;
load ./R100/data11_r_j_120
tctd(5, :) = ctd;
tctd_fixbf(5, :) = ctd_fixbf;
tctd_R600(5, :) = ctd_R600;
tctd_gr_big(5, :) = ctd_gr_big;
load ./R100/data11_r_j_140
tctd(6, :) = ctd;
tctd_fixbf(6, :) = ctd_fixbf;
tctd_R600(6, :) = ctd_R600;
tctd_gr_big(6, :) = ctd_gr_big;
load ./R100/data11_r_j_160
tctd(7, :) = ctd;
tctd_fixbf(7, :) = ctd_fixbf;
tctd_R600(7, :) = ctd_R600;
tctd_gr_big(7, :) = ctd_gr_big;
load ./R100/data11_r_j_180
tctd(8, :) = ctd;
tctd_fixbf(8, :) = ctd_fixbf;
tctd_R600(8, :) = ctd_R600;
tctd_gr_big(8, :) = ctd_gr_big;

r_j_iter = r_j_iter0;
iter_len = length(r_j_iter0);

load ./poisson/Run100_solution_cc ct cd td
tctd_cc = mean([ct cd td]);

ctd = tctd;
ctd_fixbf = tctd_fixbf;
ctd_R600 = tctd_R600;
ctd_gr_big = tctd_gr_big;
ctd_cc = tctd_cc;


disp("completed")

save ./R100/data11_r_j3 ctd  ctd_fixbf ctd_R600 ctd_gr_big ctd_cc...
    r_j_iter iter_len





