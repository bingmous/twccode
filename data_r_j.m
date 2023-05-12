% generate r_j
clear
N = 4; %# number of users
K = 10; %# number of service types
Min_r_j = 20;
Max_r_j = 100;

Min_r_j = 40;
Max_r_j = 80;
r_j = randi([Min_r_j Max_r_j], [1 K]); %# required storage for each service

% r_j = linspace(Min_r_j,Max_r_j, K);
% r_j = round(r_j);

% r_j = ones(1, K) * 30;
% figure(900)
% plot(r_j)

% figure(1)
% stairs(r_j);
disp('generate new services')
% r_j_sort = sort(r_j);
% figure(2)
% stairs(r_j_sort)
% title('service storage space')
sum(r_j)
save ./data/data_r_j r_j

