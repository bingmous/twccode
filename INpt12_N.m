clear, clc
load ./R100/data12_N
td1 = td;
load ./R100/data12_Nc
td1c = td;
load ./R100/data12_N_wAO
td_wAO = td;
load ./R100/data12_N_gr_big
td_gr_big = td;
load ./R100/data12_N_R600
td_R600 = td;
load ./R100/data12_N_R600c
td_R600c = td;

% load ./R100/data12_N_cost
% ctd1 = ctd;
% load ./R100/data12_N_costc
% ctd1c = ctd;
% load ./R100/data12_N_costc_theta11
% ctd1c_theta11 = ctd;
% load ./R100/data12_N_costc_theta10
% ctd1c_theta10 = ctd;


load ./R100/data12_N_cost_BUL125125
ctd1 = ctd;
load ./R100/data12_N_cost_R600_BUL125125
ctd1_R600 = ctd;
load ./R100/data12_N_costc_theta14_BUL125125
ctd1c_theta14_BUL125 = ctd;
load ./R100/data12_N_costc_theta12_BUL125125
ctd1c_theta12_BUL125 = ctd;
load ./R100/data12_N_costc_theta10_BUL125125
ctd1c_theta10_BUL125 = ctd;


% load ./R100/data12_N_cost_wAO
% ctd_wAO = ctd;
% load ./R100/data12_N_cost_gr_big
% ctd_gr_big = ctd;
% load ./R100/data12_N_cost_R600
% ctd_R600 = ctd;
% load ./R100/data12_N_cost_R600c
% ctd_R600c = ctd;

fs = 17;
lw = 1.5;
ms = 7;

% -------------------------run time-----------------------------
f1 = figure(111);
cp = colormap('parula');

plot(N_iter, td_R600c, '--x','Color',cp(1, :),'MarkerSize',ms,'LineWidth',lw)
hold on
plot(N_iter, td_R600, '--xr','MarkerSize',ms,'LineWidth',lw)
hold on
plot(N_iter, td1c,'-s','Color',cp(1, :),'MarkerFaceColor',cp(1,:),'MarkerSize',ms,'LineWidth',lw)
hold on
plot(N_iter, td1,'-*r','MarkerSize',ms,'LineWidth',lw)
hold on
% plot(N_iter,td_wAO, '-^','Color',cp(43, :),...
%     'MarkerFaceColor',cp(43,:),'MarkerSize',ms,'LineWidth',lw)
% hold on
plot(N_iter, td_gr_big, '-o','Color',cp(29, :),...
    'MarkerFaceColor',cp(29,:),'MarkerSize',ms,'LineWidth',lw)
hold on

ax = gca;
% ax.YLim = [880 1420];
% ax.YTick = [900 : 100 : 1400];
% ax.XLim = [3 21] * 1e9;
% ax.XTick = [3 : 2 : 21] * 1e9;
% ax.XAxis.Exponent = 9;
ax.FontSize = 14;
ylabel('Average Run Time (s)','FontSize',fs)
xlabel('$N$','FontSize',fs,'Interpreter','latex')

% l = legend('JSCR-optimal','JSCR-C','JSCR', 'SDR-simple' ,'Greedy');
% l = legend('JSCR-optimal','JSCR-C','JSCR','Greedy');
l = legend('JSCR-optimal-C','JSCR-optimal','JSCR-C','JSCR','Greedy');

l.FontSize = 13;
l.Location = 'northwest';
% l.Position = [0.7 0.6 0.1 0.1];
set(gcf, 'Position', [50 350 600 350])

% -------------------------total cost-----------------------------
f2 = figure(112);
cp = colormap('parula');

% plot(N_iter, ctd_R600c(:, 1), '--+','Color',cp(57, :),'MarkerSize',ms,'LineWidth',lw)
% hold on
% plot(N_iter, ctd_R600(:, 1), '--+r','MarkerSize',ms,'LineWidth',lw)
% hold on
% plot(N_iter, ctd1c(:, 1),'-s','Color',cp(1, :),'MarkerFaceColor',cp(1,:),'MarkerSize',ms,'LineWidth',lw)
% hold on
% plot(N_iter, ctd1c_theta11(:, 1),'--s','Color',cp(1, :),'MarkerFaceColor',cp(1,:),'MarkerSize',ms,'LineWidth',lw)
% hold on
% plot(N_iter, ctd1c_theta10(:, 1),'--x','Color',cp(1, :),'MarkerFaceColor',cp(1,:),'MarkerSize',ms,'LineWidth',lw)
% hold on

plot(N_iter, ctd1c_theta10_BUL125(:, 1),'-s','Color',cp(57, :),'MarkerFaceColor',cp(57,:),'MarkerSize',ms,'LineWidth',lw)
hold on
plot(N_iter, ctd1c_theta12_BUL125(:, 1),'-o','Color',cp(43, :),'MarkerFaceColor',cp(43,:),'MarkerSize',ms,'LineWidth',lw)
hold on
plot(N_iter, ctd1c_theta14_BUL125(:, 1),'-^','Color',cp(1, :),'MarkerFaceColor',cp(1,:),'MarkerSize',ms,'LineWidth',lw)
hold on

plot(N_iter, ctd1(:, 1),'-*r','MarkerSize',ms,'LineWidth',lw)
hold on
plot(N_iter, ctd1_R600(:, 1),'--xr','MarkerSize',ms,'LineWidth',lw)
hold on
% plot(N_iter, ctd_wAO(:, 1), '-^','Color',cp(43, :),...
%     'MarkerFaceColor',cp(43,:),'MarkerSize',ms,'LineWidth',lw)
% hold on
% plot(N_iter, ctd_gr_big(:, 1), '-o','Color',cp(29, :),...
%     'MarkerFaceColor',cp(29,:),'MarkerSize',ms,'LineWidth',lw)
% hold on


ax = gca;
% ax.YLim = [880 1420];
% ax.YTick = [900 : 100 : 1400];
% ax.XLim = [3 21] * 1e9;
% ax.XTick = [3 : 2 : 21] * 1e9;
% ax.YAxis.Exponent = 9;
ax.YAxis.Exponent = 3;
ax.FontSize = 14;
ylabel('Total Cost (J)','FontSize',fs)
xlabel('$N$','FontSize',fs,'Interpreter','latex')

% l = legend('JSCR-optimal','JSCR-C','JSCR', 'SDR-simple' ,'Greedy');
% l = legend('JSCR-optimal','JSCR-C','JSCR','Greedy');
% l = legend('JSCR-optimal-C','JSCR-optimal','JSCR-C','JSCR','Greedy');
l = legend({'JSCR-C, $\theta_i$=1.0','JSCR-C, $\theta_i$=1.2','JSCR-C, $\theta_i$=1.4','JSCR','JSCR-optimal'},'Interpreter','latex');
l.FontSize = 13;
l.Location = 'northwest';
% l.Position = [0.7 0.6 0.1 0.1];
set(gcf, 'Position', [50 350 600 350])





% saveas(gcf,'./pic/pt6_f_AP','epsc')
% saveas(gcf,'H:\Com\Ctex\new-SDR\pt6_f_AP','epsc')
% saveas(gcf,'H:\Com\Ctex\new-SDR-Infocom\pt6_f_AP','epsc')

saveas(f1,'H:\Com\Ctex\A-TWC-revision\new-SDR-Infocom-major\pt12_N','epsc')
saveas(f2,'H:\Com\Ctex\A-TWC-revision\new-SDR-Infocom-major\pt12_N2','epsc')

