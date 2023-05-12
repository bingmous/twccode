clear, clc
load ./R100/data7_f_c_fixbf_old ctd_fixbf
tctd_fixbf = ctd_fixbf;
load ./R100/data7_f_c
ctd_fixbf = tctd_fixbf;

fs = 17;
lw = 1.5;
ms = 7;
figure(71)
cp = colormap('parula');

f_c_iter = f_c_iter * 1e6;
plot(f_c_iter, ctd_cc(:, 1) , '-s','Color',cp(1, :),...
    'MarkerFaceColor',cp(1,:),'MarkerSize',ms,'LineWidth',lw)
hold on
plot(f_c_iter, ctd_gr_big(:, 1), '-o','Color',cp(29, :),...
    'MarkerFaceColor',cp(29,:),'MarkerSize',ms,'LineWidth',lw)
hold on
plot(f_c_iter, ctd_fixbf(:, 1), '-^','Color',cp(43, :),...
    'MarkerFaceColor',cp(43,:),'MarkerSize',ms,'LineWidth',lw)
hold on
plot(f_c_iter, ctd(:, 1), '-*r',...
    'MarkerSize',ms+2,'LineWidth',lw)
hold on
plot(f_c_iter, ctd_R600(:, 1), '-x','Color',cp(57, :),...
    'MarkerSize',ms,'LineWidth',lw)
hold on
% sep = 20; x=[1 1.3]*1e9; y = 30*(1e-9*x-1) + 1100+50-sep/2; y2 = y+sep;
% plot(x, y, 'k', x, y2,'k') % separation line
ax = gca;
ax.YLim = [800 1620];
ax.YTick = 800 : 200 : 2000;
ax.XLim = [1 9] * 1e9;
ax.XTick = [1 : 2 : 9] * 1e9;
ax.FontSize = 14;
ylabel('Total Cost (J)','FontSize',fs)
xlabel('$f^{c}$ (Hz)','FontSize',fs,'Interpreter','latex')
l = legend('Cloud-only','Greedy', 'SDR-fixed' ,'JSCR', 'JSCR-optimal');
l.FontSize = 13;
% l.Orientation = 'horizontal';
l.Position = [0.66 0.68 0.1 0.1];
% l.Location = 'northeast';


set(gcf, 'Position', [50 350 600 350])

% saveas(gcf,'./pic/pt7_f_c','epsc')
% saveas(gcf,'H:\Com\Ctex\new-SDR\pt7_f_c','epsc')
% saveas(gcf,'H:\Com\Ctex\new-SDR-Infocom\pt7_f_c','epsc')

saveas(gcf,'H:\Com\Ctex\A-TWC-revision\new-SDR-Infocom-major\pt7_f_c','epsc')

