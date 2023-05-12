clear, clc
load ./data/source/data_source_poisson
load ./data/data_r_j
load ./poisson/Run100_solution
r_times = sum(a .* repmat(r_j, [avg_times 1]), 2);
R_i = a .* repmat(r_j, [avg_times 1]);


f1 = figure(4);
cp = colormap('parula');
tend = 100;
b = bar(R_i(1 : tend, :), 1, 'stacked');
hold on
plot(0 : avg_times + 1,ones(1, avg_times + 2) * 300, '--k', 'LineWidth',1)

in = 1;
for bi = 1 : 7 : 64
    b(in).FaceColor = cp(bi, :);
    in = in + 1;
end

ax = gca;
ax.YLim = [0 350];
ax.YTick = [0 : 100 : 400];
ax.XLim = [0 tend + 1];
ax.XTick = [0 : 20 : 100];
ax.FontSize = 14;
fs = 17;
lw = 1.2;
ylabel('Cached Service (GB)','FontSize', fs)
xlabel('Realizations','FontSize', fs)
l = legend('j=1', 'j=2', 'j=3', 'j=4',...
    'j=5', 'j=6', 'j=7', 'j=8','j=9', 'j=10');
% l.Location = 'bestoutside';
ax.Position = [0.12 0.16 0.72 0.76];
l.Position = [0.865 0.16 0.1 0.76];
l.FontSize = 14;
annotation('textarrow',[.6 .55], [.87 .83],'String','Storage Capacity',...
    'FontSize',11)
set(gcf, 'Position', [50 430 610 350])

f2 = figure(43);
cp = colormap('parula');
sd  = 200; % size data
tend = 10;
userth = 1;
x1 = 1 : tend * 2;
ao = zeros(2 * tend, 10);
for te = 1 : tend
    ao(2 * te - 1, :) = a(te, :);
    ao(2 * te, :) = o(userth, :, te);
end
le = find(ao<=0);
ao(le) = ao(le) - 1;
s = scatter(x1, ao(:, 1), 's', 'filled');
s.SizeData = sd; s.MarkerFaceColor = cp(1, :); hold on
s = scatter(x1, ao(:, 2)*2, 's', 'filled');
s.SizeData = sd; s.MarkerFaceColor = cp(8, :); hold on
s = scatter(x1, ao(:, 3)*3, 's', 'filled');
s.SizeData = sd; s.MarkerFaceColor = cp(15, :); hold on
s = scatter(x1, ao(:, 4)*4, 's', 'filled');
s.SizeData = sd; s.MarkerFaceColor = cp(22, :); hold on
s = scatter(x1, ao(:, 5)*5, 's', 'filled');
s.SizeData = sd; s.MarkerFaceColor = cp(29, :); hold on
s = scatter(x1, ao(:, 6)*6, 's', 'filled');
s.SizeData = sd; s.MarkerFaceColor = cp(36, :); hold on
s = scatter(x1, ao(:, 7)*7, 's', 'filled');
s.SizeData = sd; s.MarkerFaceColor = cp(43, :); hold on
s = scatter(x1, ao(:, 8)*8, 's', 'filled');
s.SizeData = sd; s.MarkerFaceColor = cp(50, :); hold on
s = scatter(x1, ao(:, 9)*9, 's', 'filled');
s.SizeData = sd; s.MarkerFaceColor = cp(57, :); hold on
s = scatter(x1, ao(:, 10)*10, 's', 'filled');
s.SizeData = sd; s.MarkerFaceColor = cp(64, :); hold on

l = legend('j=1', 'j=2', 'j=3', 'j=4',...
    'j=5', 'j=6', 'j=7', 'j=8','j=9', 'j=10');
l.Location = 'bestoutside';
l.FontSize = 14;
box on

ax = gca;
ax.XLim = [0.5 tend * 2 + 0.5];
ax.XTick = 1.5 : 2 : 2 * tend + 0.5;
ax.XTickLabel = 1 : tend;
ax.YLim = [0 12];
ax.YTick = 1:10;
ax.FontSize = 14;
ax.Position = [0.12 0.16 0.72 0.76];
l.Position = [0.865 0.16 0.1 0.76];
xlabel('Realizations','FontSize', fs)
ylabel('Service','FontSize', fs)
annotation('rectangle',[0.482 0.180 .032 .65])
annotation('rectangle',[0.519 0.180 .032 .65])
annotation('textarrow',[0.433 0.483], [.87 .83],'String','Caching Decisions',...
    'FontSize', 11)
annotation('textarrow',[0.603 0.553], [.87 .83],'String','Offloading Decisions',...
    'FontSize', 11)

set(gcf, 'Position', [50 50 600 350])

% % saveas(f1,'H:\Com\Ctex\new-SDR\pt4_a_j1','epsc')
% % saveas(f2,'H:\Com\Ctex\new-SDR\pt4_a_j2','epsc')
% saveas(f1,'H:\Com\Ctex\new-SDR-Infocom\pt4_a_j1','epsc')
% saveas(f2,'H:\Com\Ctex\new-SDR-Infocom\pt4_a_j2','epsc')

% saveas(f1,'H:\Com\Ctex\A-TWC-revision\new-SDR-Infocom-major\pt4_a_j1','epsc')
% saveas(f2,'H:\Com\Ctex\A-TWC-revision\new-SDR-Infocom-major\pt4_a_j2','epsc')


