clear, clc
% %r_j_iter0 = [20 30 40 60 80 90 100 120 140 150 160];
% load ./R100/data11_r_j

% % r_j_iter0 = [30 60 90 120 150];
% load ./R100/data11_r_j2

% r_j_iter0 = [40 60 80 100 120 140 160 180];
load ./R100/data11_r_j3

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
% 
% -------------------------total cost-----------------------------
f1 = figure(111);
cp = colormap('parula');

plot(r_j_iter, repmat(ctd_cc(1), 1, length(r_j_iter)), '-s','Color',cp(1, :),...
    'MarkerFaceColor',cp(1,:),'MarkerSize',ms,'LineWidth',lw)
hold on
plot(r_j_iter,ctd_gr_big(:, 1), '-o','Color',cp(29, :),...
    'MarkerFaceColor',cp(29,:),'MarkerSize',ms,'LineWidth',lw)
hold on
plot(r_j_iter,ctd_fixbf(:, 1), '-^','Color',cp(43, :),...
    'MarkerFaceColor',cp(43,:),'MarkerSize',ms,'LineWidth',lw)
hold on
plot(r_j_iter,ctd(:, 1), '-*r','MarkerSize',ms+2,'LineWidth',lw)
hold on
plot(r_j_iter,ctd_R600(:, 1), '-x','Color',cp(57, :),...
    'MarkerSize',ms,'LineWidth',lw)
% hold on
% sep = 5; x=[10 10.5]*1e9; y = 8*(1e-9*x-10) + 1080+10-sep/2; y2 = y+sep;
% plot(x, y, 'k', x, y2,'k') % separation line
ax = gca;
ax.YLim = [890 1420];
% ax.YTick = [70 : 30 : 220];
% ax.YAxis.Exponent = 2;
% ax.XLim = [30 180];
% ax.XTick = [30 : 30 : 180];
% ax.XAxis.Exponent = 2;
ax.FontSize = 14;
ylabel('Total Cost (J)','FontSize',fs)
xlabel('$r_j$ (GB)','FontSize',fs,'Interpreter','latex')

l = legend('Cloud-only','Greedy', 'SDR-fixed' ,'JSCR', 'JSCR-optimal');
l.FontSize = 13;
l.Position = [0.22 0.65 0.1 0.1];
% l.Location = 'east';
set(gcf, 'Position', [50 350 600 350])



% saveas(gcf,'./pic/pt6_f_AP','epsc')
% saveas(gcf,'H:\Com\Ctex\new-SDR\pt6_f_AP','epsc')
% saveas(gcf,'H:\Com\Ctex\new-SDR-Infocom\pt6_f_AP','epsc')

saveas(f1,'H:\Com\Ctex\A-TWC-revision\new-SDR-Infocom-major\pt11_r_j','epsc')


% % -------------------------usage cost-----------------------------
% pt102 = figure(112);
% cp = colormap('parula');
% 
% plot(r_j_iter, repmat(ctd_cc(2), 1, length(r_j_iter)), '-s','Color',cp(1, :),...
%     'MarkerFaceColor',cp(1,:),'MarkerSize',ms,'LineWidth',lw)
% hold on
% plot(r_j_iter,ctd_gr_big(:, 2), '-o','Color',cp(29, :),...
%     'MarkerFaceColor',cp(29,:),'MarkerSize',ms,'LineWidth',lw)
% hold on
% plot(r_j_iter,ctd_fixbf(:, 2), '-^','Color',cp(43, :),...
%     'MarkerFaceColor',cp(43,:),'MarkerSize',ms,'LineWidth',lw)
% hold on
% plot(r_j_iter,ctd(:, 2), '-*r','MarkerSize',ms+2,'LineWidth',lw)
% hold on
% plot(r_j_iter,ctd_R600(:, 2), '-+','Color',cp(57, :),...
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

% % -------------------------delay cost-----------------------------
% f3 = figure(1131);
% cp = colormap('parula');
% 
% plot(r_j_iter, repmat(ctd_cc(3), 1, length(r_j_iter)), '-s','Color',cp(1, :),...
%     'MarkerFaceColor',cp(1,:),'MarkerSize',ms,'LineWidth',lw)
% hold on
% plot(r_j_iter,ctd_gr_big(:, 3), '-o','Color',cp(29, :),...
%     'MarkerFaceColor',cp(29,:),'MarkerSize',ms,'LineWidth',lw)
% hold on
% plot(r_j_iter,ctd_fixbf(:, 3), '-^','Color',cp(43, :),...
%     'MarkerFaceColor',cp(43,:),'MarkerSize',ms,'LineWidth',lw)
% hold on
% plot(r_j_iter,ctd(:, 3), '-*r','MarkerSize',ms+2,'LineWidth',lw)
% hold on
% plot(r_j_iter,ctd_R600(:, 3), '-+','Color',cp(57, :),...
%     'MarkerSize',ms,'LineWidth',lw)
% % hold on
% % sep = 5; x=[10 10.5]*1e9; y = 8*(1e-9*x-10) + 1080+10-sep/2; y2 = y+sep;
% % plot(x, y, 'k', x, y2,'k') % separation line
% ax = gca;
% % ax.YLim = [70 220];
% % ax.YTick = [70 : 30 : 220];
% % ax.YAxis.Exponent = 2;
% % ax.XLim = [30 180];
% % ax.XTick = [30 : 30 : 180];
% % ax.XAxis.Exponent = 2;
% ax.FontSize = 14;
% ylabel('Delay cost (s)','FontSize',fs)
% xlabel('Required space of service (GB)','FontSize',fs)
% l = legend('Cloud-only','Greedy', 'SDR-fixed' ,'JSCR', 'JSCR-optimal');
% l.FontSize = 13;
% l.Position = [0.22 0.6 0.1 0.1];
% % l.Location = 'east';
% set(gcf, 'Position', [50 350 600 350])



