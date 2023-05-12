clear, clc
load ./data/source/data_source_poisson
load ./poisson/Run100_solution
su_cyc = S_ij_UL_source(:, :, 1 : avg_times) .* o(:, :, 1 : avg_times) * 330;
su_cyc_i = squeeze(sum(su_cyc, 2)); % size in N * avg_times
ba = b(:, 3, 1 : avg_times);
ba_i = squeeze(ba);
% averge
su_cyc_ia = mean(su_cyc_i, 2);
ba_ia = mean(ba_i, 2);

% computing resource
cp = colormap('parula');
% fs =20;
fs =15;
lw = 1.5;
ms = 7;
figure(21)
subplot(212)
% ------------ left --------------------
yyaxis left
plot(su_cyc_ia, '-o','Color',cp(43, :),...
    'MarkerFaceColor',cp(43,:),'MarkerSize',ms,'LineWidth',lw)
ax = gca;
ax.YLim = [0 5*1e4];
ax.YTick = [0 : 5]*1e4;
% ax.FontSize = 14;
ax.FontSize = 10;
ylabel('CPU cycles','FontSize',fs)
% ------------ right --------------------
yyaxis right
b = bar(ba_ia);
b.FaceColor = cp(43, :);
ax = gca;
ax.XLim = [0.5 4.5];
ax.YLim = [2000 10000];
ax.YTick = [2: 2 : 10] * 10^3;
ax.YAxis(1).Exponent = 4;
ax.YAxis(2).Exponent = 3;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';

ylabel({'Computing Rate';'(cycles/s)'},'FontSize',fs)
xlabel('Users','FontSize',fs)

ax.Position = [0.1 0.13 0.75 0.35];
l = legend('Required CPU cycles', 'Computing Rate');
l.Location = 'northwest';
% l.FontSize = 14;
l.FontSize = 10;
l.Position = [0.2 0.38 0.1 0.1];

set(gcf, 'Position', [50 350 600 360])

% saveas(gcf,'./pic/pt3_f_i_a','epsc')
% saveas(gcf,'H:\Com\Ctex\new-SDR\pt3_f_i_a','epsc')
% saveas(gcf,'H:\Com\Ctex\new-SDR-Infocom\pt23','epsc')
saveas(gcf,'H:\Com\Ctex\A-TWC-revision\new-SDR-Infocom-major\pt23','epsc')



