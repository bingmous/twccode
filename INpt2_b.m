clear, clc
load ./data/source/data_source_poisson
load ./poisson/Run100_solution
su = S_ij_UL_source(:, :, 1 : avg_times) ;
sd = S_ij_DL_source(:, :, 1 : avg_times) ;
su_i = squeeze(sum(su, 2)); % size in N * avg_times
sd_i = squeeze(sum(sd, 2));
% extract
bu = b(:, 1, 1 : avg_times);
bd = b(:, 2, 1 : avg_times);
bu_i = squeeze(bu);
bd_i = squeeze(bd);
% averge
sd_ia = mean(sd_i, 2);
su_ia = mean(su_i, 2);
bu_ia = mean(bu_i, 2);
bd_ia = mean(bd_i, 2);


lw = 1.5;
% fs = 20;
fs = 15;
ms = 7;
figure(21)
cp = colormap('parula');
subplot(211)
% ------------ left --------------------
yyaxis left
x = 1 : 4;
p(1) = plot(x - 0.125, su_ia, '-^','Color',cp(1, :),...
    'MarkerFaceColor',cp(1,:),'MarkerSize',ms,'LineWidth', lw);
hold on
p(2) = plot(x + 0.125, sd_ia, '-v','Color',cp(57, :),...
    'MarkerFaceColor',cp(57,:),'MarkerSize',ms,'LineWidth', lw);
ax = gca; % axis
ax.YLim = [0 310];
% ax.FontSize = 14;
ax.FontSize = 10;
ylabel('Data Size (Mb)','FontSize',fs)
% ------------ right --------------------
yyaxis right
b_ia = [bu_ia bd_ia];
b = bar(b_ia);
b(1).FaceColor = cp(1, :);
b(2).FaceColor = cp(57, :);
ax = gca; % axis
ax.YLim = [2 10];
ax.XTick = 100;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
ax.YAxis(1).Exponent = 2;
ax.YAxis(2).Exponent = 0;
% xlabel('Users','FontSize',fs)
ylabel({'Bandwidth';'(MHz)'},'FontSize',fs)
ax.Position = [0.1 0.55 0.75 0.36];
l = legend(ax, [p b], 'Uplink Data', 'Downlink Data',...
    'Uplink Bandwidth', 'Downlink Bandwidth');
% l.FontSize = 14;
l.FontSize = 10;
l.Position = [0.19 0.76 0.1 0.1];
% l.Location = 'northwest';

set(gcf, 'Position', [50 350 600 350])

% % saveas(gcf,'./pic/pt2_b','epsc')
% % saveas(gcf,'H:\Com\Ctex\new-SDR\pt2_b','epsc')

