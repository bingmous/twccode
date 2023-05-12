clear, clc
load ./poisson/Run100_solution
ct_sum = ct;
load ./poisson/Run100_solution_R600
ct_sum_R600 = ct;
load ./poisson/Run100_solution_cc
ct_sum_cc = ct;
load ./poisson/Run100_solution_gr_big
ct_sum_gr_big = ct;
load ./poisson/Run100_solution_fixbf
ct_sum_fixbf = ct;
load ./poisson/Run100_solution_wAO_rerun
% load ./poisson/Run100_solution_wAO_rerun
ct_sum_wAO = ct;
load ./poisson/Run100_solution_fixbf_old
ct_sum_fixbf_old = ct;
avg_times= 100;
for t = 2 : avg_times
    ct_sum(t) = ct_sum(t) + ct_sum(t - 1); 
    ct_sum_R600(t) = ct_sum_R600(t) + ct_sum_R600(t - 1); 
    ct_sum_cc(t) = ct_sum_cc(t) + ct_sum_cc(t - 1); 
    ct_sum_gr_big(t) = ct_sum_gr_big(t) + ct_sum_gr_big(t - 1); 
    ct_sum_fixbf(t) = ct_sum_fixbf(t) + ct_sum_fixbf(t - 1); 
    ct_sum_wAO(t) = ct_sum_wAO(t) + ct_sum_wAO(t - 1); 
    ct_sum_fixbf_old(t) = ct_sum_fixbf_old(t) + ct_sum_fixbf_old(t - 1); 
end
ct_sum = ct_sum ./ [1 : avg_times]';
ct_sum_R600 = ct_sum_R600 ./ [1 : avg_times]';
ct_sum_cc = ct_sum_cc ./ [1 : avg_times]';
ct_sum_gr_big = ct_sum_gr_big ./ [1 : avg_times]';
ct_sum_fixbf = ct_sum_fixbf ./ [1 : avg_times]';
ct_sum_wAO = ct_sum_wAO ./ [1 : avg_times]';
ct_sum_fixbf_old = ct_sum_fixbf_old ./ [1 : avg_times]';

lw = 1;
ms = 7;
mi = [1 20 : 20 : 100];
f1 = figure(1);
cp = colormap('parula');
% c = CreatColor(4, 'jet');
plot(ct_sum_cc,'-s','MarkerIndices',mi,'Color',cp(1,:),...
    'MarkerFaceColor',cp(1,:),'MarkerSize',ms,'LineWidth',lw)
hold on
plot(ct_sum_gr_big,'-o','MarkerIndices',mi,'Color',cp(29,:),...
    'MarkerFaceColor',cp(29,:),'MarkerSize',ms,'LineWidth',lw)
hold on
plot(ct_sum_fixbf_old,'-^','MarkerIndices',mi,'Color',cp(43,:),...
    'MarkerFaceColor',cp(43,:),'MarkerSize',ms,'LineWidth',lw)
hold on
plot(ct_sum_wAO, '--r*','MarkerIndices',mi...
    ,'MarkerSize',ms,'LineWidth',lw)
hold on
plot(ct_sum, '-*r','MarkerIndices',mi...
    ,'MarkerSize',ms,'LineWidth',lw)
hold on
plot(ct_sum_R600,'-x','MarkerIndices',mi,'Color',cp(57,:)...
    ,'MarkerSize',ms,'LineWidth',lw)
% hold on
% sep = 5; x=[0 3]; y = 1.2*x + 1050+25-sep/2; y2 = y+sep;
% plot(x, y, 'k', x, y2,'k') % separation line
fs = 17;
ax = gca;
ax.YLim = [850 1450];
ax.YTick = 850:100:1450;
% ax.YTick = 850:50:1450;
% ax.YTick = [1025 1055 1130 1160];
ax.XTick = [0 20 40 60 80 100];
ax.FontSize = 14;
l = legend('Cloud-only','Greedy', 'SDR-fixed' ,'SDR-simple','JSCR', 'JSCR-optimal');
% l.Orientation = 'horizontal';
l.FontSize = 13;
l.Position = [0.7 0.57 0.1 0.1];
% l.Location = 'east';
ylabel('Average Cost (J)','FontSize',fs)
xlabel('Realizations','FontSize',fs)

set(gcf, 'Position', [50 350 600 350])

% saveas(gcf,'./pic/pt1_total','epsc')
% saveas(gcf,'H:\Com\Ctex\new-SDR\pt1_total','epsc')
% saveas(gcf,'H:\Com\Ctex\new-SDR-Infocom\pt1_total','epsc')

% saveas(gcf,'H:\Com\Ctex\A-TWC-revision\new-SDR-Infocom-major\pt1_total','epsc')
