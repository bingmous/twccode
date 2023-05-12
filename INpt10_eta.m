clear, clc
load ./R100/data10_eta

% ctd = zeros(iter_len, 3);
% ctd_fixbf = zeros(iter_len, 3);
% ctd_R600 = zeros(iter_len, 3);
% ctd_gr_big = zeros(iter_len, 3);
% ctd_cc = zeros(iter_len, 3);
% order:
% ctd_cc, ctd_gr_big, ctd_fixbf, ctd, ctd_R600
fs = 17;
lw = 1.5;
ms = 7;

% % -------------------------total cost-----------------------------
% f1 = figure(101);
% cp = colormap('parula');
% 
% plot(eta_iter,ctd_cc(:, 1), '-s','Color',cp(1, :),...
%     'MarkerFaceColor',cp(1,:),'MarkerSize',ms,'LineWidth',lw)
% hold on
% plot(eta_iter,ctd_gr_big(:, 1), '-o','Color',cp(29, :),...
%     'MarkerFaceColor',cp(29,:),'MarkerSize',ms,'LineWidth',lw)
% hold on
% plot(eta_iter,ctd_fixbf(:, 1), '-^','Color',cp(43, :),...
%     'MarkerFaceColor',cp(43,:),'MarkerSize',ms,'LineWidth',lw)
% hold on
% plot(eta_iter,ctd(:, 1), '-*r','MarkerSize',ms+2,'LineWidth',lw)
% hold on
% plot(eta_iter,ctd_R600(:, 1), '-+','Color',cp(57, :),...
%     'MarkerSize',ms,'LineWidth',lw)
% % hold on
% % sep = 5; x=[10 10.5]*1e9; y = 8*(1e-9*x-10) + 1080+10-sep/2; y2 = y+sep;
% % plot(x, y, 'k', x, y2,'k') % separation line
% ax = gca;
% % ax.YLim = [880 1420];
% % ax.YTick = [900 : 100 : 1400];
% % ax.XLim = [3 21] * 1e9;
% % ax.XTick = [3 : 2 : 21] * 1e9;
% % ax.XAxis.Exponent = 9;
% ax.FontSize = 14;
% ylabel('Total cost (J)','FontSize',fs)
% xlabel('Computing capacity of AP (Hz)','FontSize',fs)
% l = legend('Cloud-only','Greedy', 'SDR-fixed' ,'JSCR', 'JSCR-optimal');
% l.FontSize = 13;
% l.Position = [0.7 0.6 0.1 0.1];
% % l.Location = 'east';
% set(gcf, 'Position', [50 350 600 350])
% 
% % -------------------------usage cost-----------------------------
% f2 = figure(102);
% cp = colormap('parula');
% 
% plot(eta_iter,ctd_cc(:, 2), '-s','Color',cp(1, :),...
%     'MarkerFaceColor',cp(1,:),'MarkerSize',ms,'LineWidth',lw)
% hold on
% plot(eta_iter,ctd_gr_big(:, 2), '-o','Color',cp(29, :),...
%     'MarkerFaceColor',cp(29,:),'MarkerSize',ms,'LineWidth',lw)
% hold on
% plot(eta_iter,ctd_fixbf(:, 2), '-^','Color',cp(43, :),...
%     'MarkerFaceColor',cp(43,:),'MarkerSize',ms,'LineWidth',lw)
% hold on
% plot(eta_iter,ctd(:, 2), '-*r','MarkerSize',ms+2,'LineWidth',lw)
% hold on
% plot(eta_iter,ctd_R600(:, 2), '-+','Color',cp(57, :),...
%     'MarkerSize',ms,'LineWidth',lw)
% % hold on
% % sep = 5; x=[10 10.5]*1e9; y = 8*(1e-9*x-10) + 1080+10-sep/2; y2 = y+sep;
% % plot(x, y, 'k', x, y2,'k') % separation line
% ax = gca;
% % ax.YLim = [880 1420];
% % ax.YTick = [900 : 100 : 1400];
% % ax.XLim = [3 21] * 1e9;
% % ax.XTick = [3 : 2 : 21] * 1e9;
% % ax.XAxis.Exponent = 9;
% ax.FontSize = 14;
% ylabel('Total cost (J)','FontSize',fs)
% xlabel('Computing capacity of AP (Hz)','FontSize',fs)
% l = legend('Cloud-only','Greedy', 'SDR-fixed' ,'JSCR', 'JSCR-optimal');
% l.FontSize = 13;
% l.Position = [0.7 0.6 0.1 0.1];
% % l.Location = 'east';
% set(gcf, 'Position', [50 350 600 350])

% -------------------------delay cost-----------------------------
f3 = figure(103);
cp = colormap('parula');

plot(eta_iter,ctd_cc(:, 3), '-s','Color',cp(1, :),'MarkerFaceColor',cp(1,:),'MarkerSize',ms,'LineWidth',lw)
hold on
plot(eta_iter,ctd_gr_big(:, 3), '-o','Color',cp(29, :),'MarkerFaceColor',cp(29,:),'MarkerSize',ms,'LineWidth',lw)
hold on
plot(eta_iter,ctd_fixbf(:, 3),'-^','Color',cp(43, :),'MarkerFaceColor',cp(43,:),'MarkerSize',ms,'LineWidth',lw)
hold on
plot(eta_iter,ctd(:, 3), '-*r','MarkerSize',ms+2,'LineWidth',lw)
hold on
plot(eta_iter,ctd_R600(:, 3), '-x','Color',cp(57, :),'MarkerSize',ms,'LineWidth',lw)
% hold on
% sep = 5; x=[10 10.5]*1e9; y = 8*(1e-9*x-10) + 1080+10-sep/2; y2 = y+sep;
% plot(x, y, 'k', x, y2,'k') % separation line
ax = gca;
ax.YLim = [70 240];
ax.YTick = [80:40:240];
% ax.XLim = [3 21] * 1e9;
% ax.XTick = [1 : 4];
% ax.XAxis.Exponent = 9;
ax.FontSize = 14;
ylabel('Delay Cost (s)','FontSize',fs)
xlabel('$\eta_i$ (b/s/Hz)','FontSize',fs,'Interpreter','latex')
l = legend('Cloud-only','Greedy', 'SDR-fixed' ,'JSCR', 'JSCR-optimal');
l.FontSize = 13;
l.Position = [0.7 0.48 0.1 0.1];
% l.Location = 'east';
set(gcf, 'Position', [50 350 600 350])



% saveas(gcf,'./pic/pt6_f_AP','epsc')
% saveas(gcf,'H:\Com\Ctex\new-SDR\pt6_f_AP','epsc')
% saveas(gcf,'H:\Com\Ctex\new-SDR-Infocom\pt6_f_AP','epsc')
saveas(f3,'H:\Com\Ctex\A-TWC-revision\new-SDR-Infocom-major\pt10_eta','epsc')
