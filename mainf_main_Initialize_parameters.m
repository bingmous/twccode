function [] = mainf_main_Initialize_parameters()
% function of main_Initialize_parameters
% ----------system parameters--------------------
N = 4; %# number of users
K = 10; %# number of service types
B_UL = 20; %# uplink bandwidth
% B_UL = 125; %# uplink bandwidth
B_DL = B_UL; %# downlink bandwidth

f_AP = 20*10^3; %# GHz computing capacity of CAP
% f_AP = 5*10^3*25; %# GHz computing capacity of CAP
R = 300; %# storage capacity
alpha_i = 1; %# weight on usage cost of Cloud
beta_i = 5; %# weight on delay
eta_i_u = 3; %# spectral efficiency
eta_i_d = eta_i_u;
b_ac = 15 ; %# bandwidth between CAP and Cloud
f_c = 5 * 10^3; %# GHz computing capacity of Cloud

lambda_AP = 1; % J/Mb
lambda_CC = 0.6; % in the extend part

% extend
theta = 1.2;

load ./data/data_r_j r_j %# required storage for each service
load ./data/data_S_ij S_ij_UL S_ij_DL % N*K transmition and reception data

S_ij_CS = 330 * S_ij_UL; %# N*K required CPU cycles

C_ij_AP = lambda_AP * S_ij_UL;
C_ij_CC = lambda_CC * S_ij_UL; 



save ./data/data_main_Initialize_parameters
% disp('main_Initialize_parameters')

end
