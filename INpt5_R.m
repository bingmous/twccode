clear, clc
load ./R100/data5_R_fixbf_old ctd_fixbf
tctd_fixbf = ctd_fixbf;
load ./R100/data5_R
ctd_fixbf = tctd_fixbf;

fs = 17;
lw = 1.5;
ms = 7;
figure(51)
cp = colormap('parula');
plot(R_iter, repmat(ctd_cc(1), 1, iter_len), '-s','Color',cp(1, :),...
    'MarkerFaceColor',cp(1,:),'MarkerSize',ms,'LineWidth',lw)
hold on
plot(R_iter, ctd_gr_big(:, 1), '-o','Color',cp(29, :),...
    'MarkerFaceColor',cp(29,:),'MarkerSize',ms,'LineWidth',lw)
hold on
plot(R_iter,ctd_fixbf(:, 1), '-^','Color',cp(43, :),...
    'MarkerFaceColor',cp(43,:),'MarkerSize',ms,'LineWidth',lw)
hold on
plot(R_iter, ctd(:, 1), '*-r',...
    'MarkerSize',ms+2,'LineWidth',lw)
hold on
plot(R_iter, repmat(ctd_R600(1), 1, iter_len), '--','Color',cp(57, :),...
    'LineWidth',lw)
ax = gca;
ax.YLim = [850 1450];
ax.YTick = [850 : 100 : 1450];
ax.FontSize = 14;
ylabel('Total Cost (J)','FontSize',fs)
xlabel('$R$ (GB)','FontSize',fs,'Interpreter','latex')
l = legend('Cloud-only','Greedy', 'SDR-fixed' ,'JSCR', 'JSCR-optimal');
l.Position = [0.5 0.5 0.1 0.3];
% l.Location = 'best';
l.FontSize = 12;

set(gcf, 'Position', [50 350 600 350])

% saveas(gcf,'./pic/pt5_R','epsc')
% saveas(gcf,'H:\Com\Ctex\new-SDR\pt5_R','epsc')
% saveas(gcf,'H:\Com\Ctex\new-SDR-Infocom\pt5_R','epsc')

saveas(gcf,'H:\Com\Ctex\A-TWC-revision\new-SDR-Infocom-major\pt5_R','epsc')

