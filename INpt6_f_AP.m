clear, clc
load ./R100/data6_f_AP2
fs = 17;
lw = 1.5;
ms = 7;

figure(61)
cp = colormap('parula');
f_AP_iter = f_AP_iter * 1e6;
plot(f_AP_iter,repmat(ctd_cc(1), 1, iter_len), '-s','Color',cp(1, :),...
    'MarkerFaceColor',cp(1,:),'MarkerSize',ms,'LineWidth',lw)
hold on
plot(f_AP_iter,ctd_gr_big(:, 1), '-o','Color',cp(29, :),...
    'MarkerFaceColor',cp(29,:),'MarkerSize',ms,'LineWidth',lw)
hold on
plot(f_AP_iter,ctd_fixbf(:, 1), '-^','Color',cp(43, :),...
    'MarkerFaceColor',cp(43,:),'MarkerSize',ms,'LineWidth',lw)
hold on
plot(f_AP_iter,ctd(:, 1), '-*r','MarkerSize',ms+2,'LineWidth',lw)
hold on
plot(f_AP_iter,ctd_R600(:, 1), '-x','Color',cp(57, :),...
    'MarkerSize',ms,'LineWidth',lw)
hold on
% sep = 5; x=[10 10.5]*1e9; y = 8*(1e-9*x-10) + 1080+10-sep/2; y2 = y+sep;
% plot(x, y, 'k', x, y2,'k') % separation line
ax = gca;
ax.YLim = [880 1420];
ax.YTick = [900 : 100 : 1400];
ax.XLim = [3 21] * 1e9;
ax.XTick = [3 : 2 : 21] * 1e9;
ax.XAxis.Exponent = 9;
ax.FontSize = 14;
ylabel('Total Cost (J)','FontSize',fs)
xlabel('$f^{A}$ (Hz)','FontSize',fs,'Interpreter','latex')
l = legend('Cloud-only','Greedy', 'SDR-fixed' ,'JSCR', 'JSCR-optimal');
l.FontSize = 13;
l.Position = [0.7 0.6 0.1 0.1];
% l.Location = 'east';
set(gcf, 'Position', [50 350 600 350])

% saveas(gcf,'./pic/pt6_f_AP','epsc')
% saveas(gcf,'H:\Com\Ctex\new-SDR\pt6_f_AP','epsc')
% saveas(gcf,'H:\Com\Ctex\new-SDR-Infocom\pt6_f_AP','epsc')

saveas(gcf,'H:\Com\Ctex\A-TWC-revision\new-SDR-Infocom-major\pt6_f_AP','epsc')
