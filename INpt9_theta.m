clear, clc

% from Run100_solution_fixbf_old to comput fixbf_old without c #ctd_fixbf,
% load ./poisson/Run100_solution_fixbf_old o b
% ctd_fixbf = zeros(1, 3);
% [ctd_fixbf(1), ctd_fixbf(2), ctd_fixbf(3)] = mainf_cost_CT_special(o, b);
% save ./R100/data9_theta ctd_fixbf -append
% intergrate the data ctd_fixbf in command window by using save ./.. append
% and don't cover this file again!

load ./R100/data9_theta_fixbf_old ctdc_fixbf % replace the fixbf algorithm data
tctdc_fixbf = ctdc_fixbf;
load ./R100/data9_theta
ctdc_fixbf = tctdc_fixbf;

% ctd = zeros(1, 3);
% ctd_R600 = zeros(1, 3);
% ctdc = zeros(iter_len, 3);
% ctdc_R600 = zeros(1, 3);
% ctdc_fixbf = zeros(iter_len, 3);
% ctd_cc = zeros(1, 3);
% order£º
% ctd_cc, ctdc_fixbf, #ctd_fixbf, ctdc, ctd, ctdc_R600, ctd_R600
fs = 17;
lw = 1.5;
ms = 7;
% --------------------------- total cost ------------------------------------
f1=figure(91);
cp = colormap('parula');

plot(theta_iter, repmat(ctd_cc(1), iter_len, 1), '-s','Color',cp(1, :),...
    'MarkerFaceColor',cp(1,:),'MarkerSize',ms,'LineWidth',lw)
hold on
plot(theta_iter, ctdc_fixbf(:, 1), '-^','Color',cp(43, :),...
    'MarkerFaceColor',cp(43,:),'MarkerSize',ms,'LineWidth',lw)
hold on
plot(theta_iter, repmat(ctd_fixbf(1), iter_len, 1), '--','Color',cp(43, :),'LineWidth',lw)
hold on
plot(theta_iter, ctdc(:, 1), '-*r',...
    'MarkerSize',ms+2,'LineWidth',lw)
hold on
plot(theta_iter, repmat(ctd(1), iter_len, 1), '--r','LineWidth',lw)
hold on
plot(theta_iter, ctdc_R600(:,  1), '-x','Color',cp(57, :),...
    'MarkerFaceColor',cp(57,:),'MarkerSize',ms,'LineWidth',lw)
hold on
plot(theta_iter, repmat(ctd_R600(1), iter_len, 1), '--','Color',cp(57, :),'LineWidth',lw)
ax = gca;
ax.XLim = [1 1.6];
ax.XTick = [1 : 0.1 : 1.6];
ax.YLim = [900 1430];
ax.YTick = [900 : 100 : 1400];
ax.FontSize = 14;
xlabel('$\theta$','FontSize',fs,'Interpreter','latex')
ylabel('Total Cost (J)','FontSize',fs)
l = legend('Cloud-only', 'SDR-fixed-C','SDR-fixed', 'JSCR-C', 'JSCR', 'JSCR-optimal-C', 'JSCR-optimal');
l.FontSize = 12;
% l.Location = 'east';
l.Position = [0.7 0.57 0.1 0.1];

set(gcf, 'Position', [50 350 600 350])

% % --------------------------- usage cost ------------------------------------
% f2=figure(92);
% cp = colormap('parula');
% 
% plot(theta_iter, repmat(ctd_cc(2), iter_len, 1), '-s','Color',cp(1, :),...
%     'MarkerFaceColor',cp(1,:),'MarkerSize',ms,'LineWidth',lw)
% hold on
% plot(theta_iter, ctdc_fixbf(:, 2), '-^','Color',cp(43, :),...
%     'MarkerFaceColor',cp(43,:),'MarkerSize',ms,'LineWidth',lw)
% hold on
% plot(theta_iter, repmat(ctd_fixbf(2), iter_len, 1), '--','Color',cp(43, :),'LineWidth',lw)
% hold on
% plot(theta_iter, ctdc(:, 2), '-*r',...
%     'MarkerSize',ms+2,'LineWidth',lw)
% hold on
% plot(theta_iter, repmat(ctd(2), iter_len, 1), '--r','LineWidth',lw)
% hold on
% plot(theta_iter, ctdc_R600(:,  2), '-+','Color',cp(57, :),...
%     'MarkerFaceColor',cp(57,:),'MarkerSize',ms,'LineWidth',lw)
% hold on
% plot(theta_iter, repmat(ctd_R600(2), iter_len, 1), '--','Color',cp(57, :),'LineWidth',lw)
% ax = gca;
% ax.XLim = [1 1.6];
% ax.XTick = [1 : 0.1 : 1.6];
% % ax.YLim = [900 1430];
% % ax.YTick = [900 : 100 : 1400];
% ax.FontSize = 14;
% xlabel('Budget factor','FontSize',fs)
% ylabel('Total cost (J)','FontSize',fs)
% % l = legend('Cloud-only', 'SDR-fixed-C','SDR-fixed', 'JSCR-C', 'JSCR', 'JSCR-optimal-C', 'JSCR-optimal');
% l.FontSize = 12;
% % l.Location = 'east';
% l.Position = [0.7 0.57 0.1 0.1];
% 
% set(gcf, 'Position', [50 350 600 350])

% --------------------------- delay cost ------------------------------------
f3=figure(93);
cp = colormap('parula');

plot(theta_iter, repmat(ctd_cc(3), iter_len, 1), '-s','Color',cp(1, :),...
    'MarkerFaceColor',cp(1,:),'MarkerSize',ms,'LineWidth',lw)
hold on
plot(theta_iter, ctdc_fixbf(:, 3), '-^','Color',cp(43, :),...
    'MarkerFaceColor',cp(43,:),'MarkerSize',ms,'LineWidth',lw)
hold on
plot(theta_iter, repmat(ctd_fixbf(3), iter_len, 1), '-.','Color',cp(43, :),'LineWidth',lw)
hold on
plot(theta_iter, ctdc(:, 3), '-*r',...
    'MarkerSize',ms+2,'LineWidth',lw)
hold on
plot(theta_iter, repmat(ctd(3), iter_len, 1), '--r','LineWidth',lw)
hold on
plot(theta_iter, ctdc_R600(:,  3), '-x','Color',cp(57, :),...
    'MarkerFaceColor',cp(57,:),'MarkerSize',ms+2,'LineWidth',lw)
hold on
plot(theta_iter, repmat(ctd_R600(3), iter_len, 1), ':','Color',cp(57, :),'LineWidth',lw)
ax = gca;
ax.XLim = [1 1.6];
ax.XTick = [1 : 0.1 : 1.6];
ax.YLim = [70 220];
ax.YTick = [70 : 30 : 220];
% ax.YAxis.Exponent = 1;
ax.FontSize = 14;
xlabel('$\theta_i$','FontSize',fs,'Interpreter','latex')
ylabel('Delay Cost (s)','FontSize',fs)
l = legend('Cloud-only', 'SDR-fixed-C','SDR-fixed', 'JSCR-C', 'JSCR', 'JSCR-optimal-C', 'JSCR-optimal');
l.FontSize = 12;
% l.Location = 'east';
l.Position = [0.7 0.56 0.1 0.1];

set(gcf, 'Position', [50 350 600 350])



% saveas(gcf,'./pic/pt9_theta','epsc')
% saveas(gcf,'H:\Com\Ctex\new-SDR\pt9_theta','epsc')
% saveas(gcf,'H:\Com\Ctex\new-SDR-Infocom\pt9_theta','epsc')

saveas(f1,'H:\Com\Ctex\A-TWC-revision\new-SDR-Infocom-major\pt9_theta','epsc')
saveas(f3,'H:\Com\Ctex\A-TWC-revision\new-SDR-Infocom-major\pt9_theta2','epsc')
