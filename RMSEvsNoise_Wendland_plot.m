clear;
p1 = pwd;
N = 10014;
L = 141; 
d = 3;

RMSE_te_subsetfir_mean_noiseVary = zeros(7, 71);
RMSE_te_subsetrand_mean_noiseVary = zeros(7, 71);
RMSE_te_subtdesigns_mean_noiseVary = zeros(7, 71);

noises = {'0','0.0001','0.001','0.01','0.1','0.3','0.5'};
noise_num = length(noises);

data_type = 'Wendland';

for i = 1:noise_num
    load([p1 '\SynResults\' data_type '_N' num2str(N) 'D' num2str(d) ...
        '_SubSampleContrast_t' num2str(L) '_noise' noises{i} '.mat'], ...
        'RMSE_te_subtdesigns_mean', 'RMSE_te_subsetfir_mean',...
        'RMSE_te_subsetrand_mean');
    RMSE_te_subsetfir_mean_noiseVary(i, :) = RMSE_te_subsetfir_mean;
    RMSE_te_subsetrand_mean_noiseVary(i, :) = RMSE_te_subsetrand_mean;
    RMSE_te_subtdesigns_mean_noiseVary(i, :) = RMSE_te_subtdesigns_mean;
    clear RMSE_te_subtdesigns_mean RMSE_te_subsetfir_mean RMSE_te_subsetrand_mean
end

% ---------- s*=9 (SR=0.48%) -------------
t_ind = 5;
fig_plot = figure;
plot(1:7, RMSE_te_subsetfir_mean_noiseVary(:, t_ind), 's', ...
'color', [0, 0.5, 0], 'Linewidth', 1.2, 'linestyle', '-.',...
'MarkerEdgeColor', [0, 0.5, 0], ...
'MarkerFaceColor',[0.47,0.67,0.19],...
'MarkerSize',13);
hold on;
plot(1:7, RMSE_te_subsetrand_mean_noiseVary(:, t_ind), 'd', ...
'color', [0, 0.45, 0.74], 'Linewidth', 1.2, 'linestyle', '--',...
'MarkerEdgeColor',[0, 0.45, 0.74], ...
'MarkerFaceColor',[0,0.8,1],...
'MarkerSize',13);
hold on;
plot(1:7, RMSE_te_subtdesigns_mean_noiseVary(:, t_ind), 'o', ...
'color', [0.4, 0, 0], 'Linewidth', 1.5, 'linestyle', ':',...
'MarkerEdgeColor',[0.4, 0, 0], ...
'MarkerFaceColor',[1,0.4,0.4],...
'MarkerSize',11);
xlabel('The value of \delta in noise');
ylabel('RMSE')
xlim([0.85 7.15]);
ylim([0.18 0.5]);
set(gca,'FontSize',20,'XTick',[1 2 3 4 5 6 7],'XTickLabel',...
    {'0','10^{-4}','10^{-3}','10^{-2}','0.1','0.3','0.5'},'YGrid','on');
ax = gca;
ax.XTickLabelRotation = 0;
legend({'First', 'Random', 's*-designs'}, 'FontSize',20, ...
       'Position',[0.182738087681076 0.524603179925019 0.285714279913477 0.247619040594215])

savefile = [p1 '/SynResults/RMSE_' data_type  '_N' num2str(N) 'D' num2str(d) ...
            't' num2str(t_ind) '.fig'];
saveas(fig_plot, savefile);


% ---------- s*=25 (SR=3.28%) -------------
t_ind = 13;
fig_plot = figure;
semilogy(1:7, RMSE_te_subsetfir_mean_noiseVary(:, t_ind), 's', ...
'color', [0, 0.5, 0], 'Linewidth', 1.2, 'linestyle', '-.',...
'MarkerEdgeColor', [0, 0.5, 0], ...
'MarkerFaceColor',[0.47,0.67,0.19],...
'MarkerSize',13);
hold on;
semilogy(1:7, RMSE_te_subsetrand_mean_noiseVary(:, t_ind), 'd', ...
'color', [0, 0.45, 0.74], 'Linewidth', 1.2, 'linestyle', '--',...
'MarkerEdgeColor',[0, 0.45, 0.74], ...
'MarkerFaceColor',[0,0.8,1],...
'MarkerSize',13);
hold on;
semilogy(1:7, RMSE_te_subtdesigns_mean_noiseVary(:, t_ind), 'o', ...
'color', [0.4, 0, 0], 'Linewidth', 1.5, 'linestyle', ':',...
'MarkerEdgeColor',[0.4, 0, 0], ...
'MarkerFaceColor',[1,0.4,0.4],...
'MarkerSize',11);
xlabel('The value of \delta in noise');
ylabel('RMSE')
xlim([0.85 7.15]);
ylim([0.0007 1]);
set(gca,'FontSize',20,'XTick',[1 2 3 4 5 6 7],'XTickLabel',...
    {'0','10^{-4}','10^{-3}','10^{-2}','0.1','0.3','0.5'},'YGrid','on',...
    'YTick',[0.001 0.01 0.1 1], 'YMinorTick','on','YScale','log');
ax = gca;
ax.XTickLabelRotation = 0;
legend({'First', 'Random', 's*-designs'}, 'FontSize',20, ...
       'Position',[0.200619372961974 0.51907481248928 0.285714279913477 0.247619040594215])

savefile = [p1 '/SynResults/RMSE_' data_type  '_N' num2str(N) 'D' num2str(d) ...
            't' num2str(t_ind) '.fig'];
saveas(fig_plot, savefile);


% ---------- s*=41 (SR=8.63%) -------------
t_ind = 21;
fig_plot = figure;
semilogy(1:7, RMSE_te_subsetfir_mean_noiseVary(:, t_ind), 's', ...
'color', [0, 0.5, 0], 'Linewidth', 1.2, 'linestyle', '-.',...
'MarkerEdgeColor', [0, 0.5, 0], ...
'MarkerFaceColor',[0.47,0.67,0.19],...
'MarkerSize',13);
hold on;
semilogy(1:7, RMSE_te_subsetrand_mean_noiseVary(:, t_ind), 'd', ...
'color', [0, 0.45, 0.74], 'Linewidth', 1.2, 'linestyle', '--',...
'MarkerEdgeColor',[0, 0.45, 0.74], ...
'MarkerFaceColor',[0,0.8,1],...
'MarkerSize',13);
hold on;
semilogy(1:7, RMSE_te_subtdesigns_mean_noiseVary(:, t_ind), 'o', ...
'color', [0.4, 0, 0], 'Linewidth', 1.5, 'linestyle', ':',...
'MarkerEdgeColor',[0.4, 0, 0], ...
'MarkerFaceColor',[1,0.4,0.4],...
'MarkerSize',11);
xlabel('The value of \delta in noise');
ylabel('RMSE')
xlim([0.85 7.15]);
ylim([2e-05 1]);
set(gca,'FontSize',20,'XTick',[1 2 3 4 5 6 7],'XTickLabel',...
    {'0','10^{-4}','10^{-3}','10^{-2}','0.1','0.3','0.5'},'YGrid','on',...
    'YTick',[0.0001 0.01 1],'YMinorTick','on','YScale','log');
ax = gca;
ax.XTickLabelRotation = 0;
legend({'First', 'Random', 's*-designs'}, 'FontSize',20, ...
       'Position',[0.202380956744862 0.519841275163118 0.285714279913477 0.247619040594215])

savefile = [p1 '/SynResults/RMSE_' data_type  '_N' num2str(N) 'D' num2str(d) ...
            't' num2str(t_ind) '.fig'];
saveas(fig_plot, savefile);


% ---------- s*=57 (SR=16.54%) -------------
t_ind = 29;
fig_plot = figure;
semilogy(1:7, RMSE_te_subsetfir_mean_noiseVary(:, t_ind), 's', ...
'color', [0, 0.5, 0], 'Linewidth', 1.2, 'linestyle', '-.',...
'MarkerEdgeColor', [0, 0.5, 0], ...
'MarkerFaceColor',[0.47,0.67,0.19],...
'MarkerSize',13);
hold on;
semilogy(1:7, RMSE_te_subsetrand_mean_noiseVary(:, t_ind), 'd', ...
'color', [0, 0.45, 0.74], 'Linewidth', 1.2, 'linestyle', '--',...
'MarkerEdgeColor',[0, 0.45, 0.74], ...
'MarkerFaceColor',[0,0.8,1],...
'MarkerSize',13);
hold on;
semilogy(1:7, RMSE_te_subtdesigns_mean_noiseVary(:, t_ind), 'o', ...
'color', [0.4, 0, 0], 'Linewidth', 1.5, 'linestyle', ':',...
'MarkerEdgeColor',[0.4, 0, 0], ...
'MarkerFaceColor',[1,0.4,0.4],...
'MarkerSize',11);
xlabel('The value of \delta in noise');
ylabel('RMSE')
xlim([0.85 7.15]);
ylim([3e-06 1]);
set(gca,'FontSize',20,'XTick',[1 2 3 4 5 6 7],'XTickLabel',...
    {'0','10^{-4}','10^{-3}','10^{-2}','0.1','0.3','0.5'},'YGrid','on',...
    'YMinorTick','on','YScale','log');
ax = gca;
ax.XTickLabelRotation = 0;
legend({'First', 'Random', 's*-designs'}, 'FontSize',20, ...
       'Position',[0.200595242459148 0.52460317992502 0.285714279913477 0.247619040594215])

savefile = [p1 '/SynResults/RMSE_' data_type  '_N' num2str(N) 'D' num2str(d) ...
            't' num2str(t_ind) '.fig'];
saveas(fig_plot, savefile);
