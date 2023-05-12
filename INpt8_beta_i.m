clear, clc
% load ./R100/data8_beta_i
load ./R100/data8_beta_i_add1015
beta_i_iter = [1 : 0.5 : 6];
iter_len = length(beta_i_iter);
ctd = ctd(1 : iter_len, :);

fs = 17;
lw = 1.5;
ms = 7;

figure(81)
cp = colormap('parula');
yyaxis left
plot(beta_i_iter, ctd(:, 3), '-*r',...
    'MarkerSize',ms+2,'LineWidth',lw)
ax = gca;
ax.YLim = [90 210];
ax.YTick = [90 : 20 : 220];
% ax.XLim = [2 5];
% ax.XTick = [2 : 0.5 : 5];
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
ax.FontSize = 14;
xlabel('$\beta_i$ (J/s)','FontSize',fs,'Interpreter','latex')
ylabel('Delay Cost (s)','FontSize',fs)

yyaxis right
plot(beta_i_iter, ctd(:, 2), '-.x','Color',cp(57, :),...
    'MarkerFaceColor',cp(57, :),'MarkerSize',ms+2,'LineWidth',lw)
ax = gca;
ax.YLim = [360 510];
ax.YTick = [360 : 30 : 510];
ylabel('Computation Cost (J)','FontSize',fs)
l = legend('Delay cost','Computation cost');
l.FontSize = 13;
l.Location = 'east';

set(gcf, 'Position', [50 350 600 350])
% saveas(gca,'H:\Com\Ctex\new-SDR\pt8_beta_i','epsc')
% saveas(gca,'H:\Com\Ctex\new-SDR-Infocom\pt8_beta_i','epsc')

saveas(gcf,'H:\Com\Ctex\A-TWC-revision\new-SDR-Infocom-major\pt8_beta_i','epsc')

% % -------------------total cost for replace pt1-----------------------------------
% clear, clc
% load ./R100/data8_beta_i_fixbf_old
% ctd_fixbf_old = ctd_fixbf;
% load ./R100/data8_beta_i
% beta_i_iter = [2 : 0.5 : 7];
% iter_len = length(beta_i_iter);
% ctd = ctd(1 : iter_len, :);
% ctd_fixbf = ctd_fixbf(1 : iter_len, :);
% ctd_gr_big = ctd_gr_big(1 : iter_len, :);
% ctd = ctd(1 : iter_len, :);
% ctd_R600 = ctd_R600(1 : iter_len, :);
% % ctd_fixbf_old = ctd_fixbf_old(1 : iter_len, :);
% figure(82);
% cp = colormap('parula');
% fs = 17;
% lw = 1.5;
% ms = 7;
% 
% plot(beta_i_iter, ctd_cc(2) + beta_i_iter * ctd_cc(3) ,'-s','Color',cp(1,:),...
%     'MarkerFaceColor',cp(1,:),'MarkerSize',ms,'LineWidth',lw)
% plot(beta_i_iter, ctd_gr_big(:, 1),'-o','Color',cp(29,:),...
%     'MarkerFaceColor',cp(29,:),'MarkerSize',ms,'LineWidth',lw)
% hold on
% % plot(ct_sum_wAO, '--r*','MarkerIndices',mi...
% %     ,'MarkerSize',ms+2,'LineWidth',lw)
% % hold on
% % plot(beta_i_iter, ctd_fixbf_old(:, 1),'-^','Color',cp(43,:),...
% %     'MarkerFaceColor',cp(43,:),'MarkerSize',ms,'LineWidth',lw)
% % hold on
% plot(beta_i_iter, ctd(:, 1), '-*r','MarkerSize',ms+2,'LineWidth',lw)
% hold on
% plot(beta_i_iter, ctd_R600(:, 1),'-+','Color',cp(57,:),'MarkerSize',ms,'LineWidth',lw)
% 
% xlabel('$\beta_i$', 'Interpreter', 'latex')
% ylabel('Computation cost (J)')
% ax = gca;
% % ax.YLim = [360 520];
% % ax.YTick = [360 : 20 : 520];
% % ax.XLim = [2 6];
% % ax.XTick = [2 : 6];
% % l = legend('Cloud-only','Greedy','SDR-simple', 'SDR-fixed' ,'JSCR', 'JSCR-optimal');
% % l = legend('Cloud-only','Greedy', 'SDR-fixed' ,'JSCR', 'JSCR-optimal');
% l.FontSize = 12;
% l.Location = 'east';
% set(gcf, 'Position', [50 350 600 400])








% pt82 = figure(82);
% plot(beta_i_iter, repmat(ctd_cc(3), iter_len, 1), '-sy')
% hold on
% plot(beta_i_iter, ctd_fixbf(:, 3), '-^c')
% hold on
% plot(beta_i_iter, ctd_gr_big(:, 3), '-og')
% hold on
% plot(beta_i_iter, ctd(:, 3), '-*r')
% hold on
% plot(beta_i_iter, ctd_R600(:, 3), '--k')
% xlabel('$\beta_i$', 'Interpreter', 'latex')
% ylabel('Delay cost (s)')
% ax = gca;
% ax.YLim = [80 220];
% ax.YTick = [80 : 20 : 220];
% ax.XLim = [2 6];
% ax.XTick = [2 : 6];
% l = legend('cc', 'fixbf', 'gr-big', 'AO', 'R600');
% l.FontSize = 12;
% l.Location = 'east';
% set(gcf, 'Position', [50 350 600 400])
% % % saveas(gcf,'./pic/pt8_beta_i','epsc')
% saveas(pt81,'H:\Com\Ctex\new-SDR\pt8_beta_i1','epsc')
% saveas(pt82,'H:\Com\Ctex\new-SDR\pt8_beta_i2','epsc')




% load ./R100/data8_beta_i_fixbf_old
% figure(81)
% hold on
% plot(beta_i_iter, ctd_fixbf(:, 2), '--^c')
% figure(82)
% hold on
% plot(beta_i_iter, ctd_fixbf(:, 3), '--^c')

% figure(85)
% yyaxis left
% plot(ctd(1 : 6, 3), '-*r')
% ylabel('Average delay cost (s)')
% ax = gca;
% ax.YLim = [80 180];
% ax.YTick = [80 : 20 : 180];
% 
% yyaxis right
% plot(ctd(1 : 6, 2), '--ob')
% ylabel('Average usage cost (J)')
% xlabel('$\beta_i$ (J/s)', 'Interpreter', 'latex')
% ax = gca;
% ax.YLim = [395 540];
% ax.YTick = [380 : 40 : 540];
% ax.XTick = [1 : 6];
% ax.YAxis(1).Color = 'k';
% ax.YAxis(2).Color = 'k';
% l = legend('Average usage cost', 'Average delay cost');
% l.FontSize = 12;
% l.Location = 'east';
% 
% set(gcf, 'Position', [50 350 600 400])
% 
% % saveas(gcf,'./pic/pt8_beta_i','epsc')
% saveas(gcf,'H:\Com\Ctex\new-SDR-1.4-2\pt8_beta_i','epsc')




% % 
% figure(84)
% plot(beta_i_iter, ctd(:, 1))
% hold on
% plot(beta_i_iter, ctd_fixbf(:, 1))
% hold on
% % plot(ctd_gre(:, 1))
% % hold on
% hold on
% plot(beta_i_iter, ctd_gr_big(:, 1))
% hold on
% plot(beta_i_iter, ctd_R600(:, 1))
% hold on
% plot(beta_i_iter, repmat(ctd_cc(1), iter_len, 1))
% 
% % legend('ctd', 'fixbf', 'gre', 'R600')
% legend('ctd', 'fixbf','gr-big', 'R600', 'ctd-cc')

% figure(83)
% subplot(211)
% plot(beta_i_iter, ctd(:, 2))
% hold on
% plot(beta_i_iter, ctd_fixbf(:, 2))
% hold on
% plot(beta_i_iter, ctd_gr_big(:, 2))  % no relationship
% hold on
% plot(beta_i_iter, ctd_R600(:, 2))
% hold on
% plot(beta_i_iter, repmat(ctd_cc(2), iter_len, 1))
% title('usage cost')
% legend('ctd','fixbf','gr-big', 'R600', 'cc')
% 
% subplot(212)
% plot(beta_i_iter, ctd(:, 3))
% hold on
% plot(beta_i_iter, ctd_fixbf(:, 3))
% hold on
% plot(beta_i_iter, ctd_gr_big(:, 3))
% hold on
% plot(beta_i_iter, ctd_R600(:, 3))
% hold on
% plot(beta_i_iter, repmat(ctd_cc(3), iter_len, 1))
% 

