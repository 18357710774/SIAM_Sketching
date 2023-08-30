% The relation between RMSE and the number s* for sub-sampling with s*-designs under different levels of Gaussian noise
clear;
p1 = pwd;
N = 10014;
L = 141; 
d = 3;

t_seq = 1:2:141;
indsel2 = 1:71;
data_type = 'Franke';

% ------- noise = 0 -----------------
noise = '0';
load([p1 '\SynResults\' data_type '_N' num2str(N) 'D' num2str(d) ...
    '_SubSampleContrast_t' num2str(L) '_noise' num2str(noise) '.mat'], ...
    'RMSE_te_subtdesigns_mean');

fig_plot = figure;
semilogy(t_seq(indsel2), RMSE_te_subtdesigns_mean(indsel2), ...
    'linestyle', ':', 'Color', [0.4, 0, 0], 'Linewidth', 1.5, ...
    'Marker', 'o', 'MarkerSize',6.5, 'MarkerEdgeColor',[0.4, 0, 0], ...
    'MarkerFaceColor',[1,0.4,0.4]);
hold on;
semilogy([t_seq(indsel2), t_seq(end)+1], RMSE_te_subtdesigns_mean(end)*ones(1,length(indsel2)+1), ...
        'LineWidth',3,'LineStyle',':', 'Color',[0 0 1]);
xlim([-1 143]);
ylim([1e-07 2]);
ylabel('RMSE');
xlabel('The value of s* in s*-designs');
set(gca,'FontSize',20,'XTick',[0 20 40 60 80 100 120 140],'YGrid','on',...
    'YMinorTick','on','YScale','log','YTick',[1e-06 0.0001 0.01 1]);
ax = gca;
ax.XTickLabelRotation = 0;
legend({'s*-designs', 'Baseline'},'FontSize',20)

savefile = [cd '/SynResults/RMSE_' data_type  '_N' num2str(N) 'D' ...
            num2str(d) '_noise' noise '.fig'];
saveas(fig_plot,savefile);
clear RMSE_te_subtdesigns_mean noise


% ------- noise = 0.001 -----------------
noise = '0.001';
load([p1 '\SynResults\' data_type '_N' num2str(N) 'D' num2str(d) ...
    '_SubSampleContrast_t' num2str(L) '_noise' num2str(noise) '.mat'], ...
    'RMSE_te_subtdesigns_mean');

fig_plot = figure;
semilogy(t_seq(indsel2), RMSE_te_subtdesigns_mean(indsel2), ...
    'linestyle', ':', 'Color', [0.4, 0, 0], 'Linewidth', 1.5, ...
    'Marker', 'o', 'MarkerSize',6.5, 'MarkerEdgeColor',[0.4, 0, 0], ...
    'MarkerFaceColor',[1,0.4,0.4]);
hold on;
semilogy([t_seq(indsel2), t_seq(end)+1], RMSE_te_subtdesigns_mean(end)*ones(1,length(indsel2)+1), ...
        'LineWidth',3,'LineStyle',':', 'Color',[0 0 1]);
xlim([-1 143]);
ylim([0.00015 1.5]);
ylabel('RMSE');
xlabel('The value of s* in s*-designs');
set(gca,'FontSize',20,'XTick',[0 20 40 60 80 100 120 140],'YGrid','on',...
    'YMinorTick','on','YScale','log','YTick',[0.001 0.01 0.1 1]);
ax = gca;
ax.XTickLabelRotation = 0;
legend({'s*-designs', 'Baseline'},'FontSize',20)

savefile = [cd '/SynResults/RMSE_' data_type  '_N' num2str(N) 'D' ...
            num2str(d) '_noise' noise '.fig'];
saveas(fig_plot,savefile);
clear RMSE_te_subtdesigns_mean noise


% ------- noise = 0.1 -----------------
noise = '0.1';
load([p1 '\SynResults\' data_type '_N' num2str(N) 'D' num2str(d) ...
    '_SubSampleContrast_t' num2str(L) '_noise' num2str(noise) '.mat'], ...
    'RMSE_te_subtdesigns_mean');

fig_plot = figure;
semilogy(t_seq(indsel2), RMSE_te_subtdesigns_mean(indsel2), ...
    'linestyle', ':', 'Color', [0.4, 0, 0], 'Linewidth', 1.5, ...
    'Marker', 'o', 'MarkerSize',6.5, 'MarkerEdgeColor',[0.4, 0, 0], ...
    'MarkerFaceColor',[1,0.4,0.4]);
hold on;
semilogy([t_seq(indsel2), t_seq(end)+1], RMSE_te_subtdesigns_mean(end)*ones(1,length(indsel2)+1), ...
        'LineWidth',3,'LineStyle',':', 'Color',[0 0 1]);
xlim([-1 143]);
ylim([0.01 1]);
ylabel('RMSE');
xlabel('The value of s* in s*-designs');
set(gca,'FontSize',20,'XTick',[0 20 40 60 80 100 120 140],'YGrid','on',...
    'YMinorTick','on','YScale','log','YTick',[0.01 0.1 1]);
ax = gca;
ax.XTickLabelRotation = 0;
legend({'s*-designs', 'Baseline'},'FontSize',20)

savefile = [cd '/SynResults/RMSE_' data_type  '_N' num2str(N) 'D' ...
            num2str(d) '_noise' noise '.fig'];
saveas(fig_plot,savefile);
clear RMSE_te_subtdesigns_mean noise


% ------- noise = 0.5 -----------------
noise = '0.5'; 
load([p1 '\SynResults\' data_type '_N' num2str(N) 'D' num2str(d) ...
    '_SubSampleContrast_t' num2str(L) '_noise' num2str(noise) '.mat'], ...
    'RMSE_te_subtdesigns_mean');

fig_plot = figure;
semilogy(t_seq(indsel2), RMSE_te_subtdesigns_mean(indsel2), ...
    'linestyle', ':', 'Color', [0.4, 0, 0], 'Linewidth', 1.5, ...
    'Marker', 'o', 'MarkerSize',6.5, 'MarkerEdgeColor',[0.4, 0, 0], ...
    'MarkerFaceColor',[1,0.4,0.4]);
hold on;
semilogy([t_seq(indsel2), t_seq(end)+1], RMSE_te_subtdesigns_mean(end)*ones(1,length(indsel2)+1), ...
        'LineWidth',3,'LineStyle',':', 'Color',[0 0 1]);
xlim([-1 143]);
ylim([0.03 0.6]);
ylabel('RMSE');
xlabel('The value of s* in s*-designs');
set(gca,'FontSize',20,'XTick',[0 20 40 60 80 100 120 140],'YGrid','on',...
    'YMinorTick','on','YScale','log','YTick',[0.05 0.1 0.2 0.5]);
ax = gca;
ax.XTickLabelRotation = 0;
legend({'s*-designs', 'Baseline'},'FontSize',20)

savefile = [cd '/SynResults/RMSE_' data_type  '_N' num2str(N) 'D' ...
            num2str(d) '_noise' noise '.fig'];
saveas(fig_plot,savefile);
clear RMSE_te_subtdesigns_mean noise
