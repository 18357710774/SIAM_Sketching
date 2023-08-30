clear;
p1 = pwd;
addpath(genpath(p1));

N = 10014;
L = 141; 
d = 3;
data_type = 'Franke';
t_sel_ind = 5;

load([p1 '\SynResults\' data_type '_N' num2str(N) 'D' num2str(d) ...
    '_SubSampleContrast_t' num2str(L) '_noise0.5.mat']);

noise = '05';
% GroudTruth 
[~,fig_rbf] = pltfunc_rbf_2(yev', xev', 0:0.4:2, '',2);
savefile_rbf = [p1 '/SynResults/' data_type  'N' num2str(N) 'd' num2str(d) 'Groudtruth.png'];
print(fig_rbf,'-dpng','-r300', savefile_rbf);
savefile_rbf1 = [p1 '/SynResults/' data_type  'N' num2str(N) 'd' num2str(d) 'Groudtruth.fig'];
saveas(fig_rbf,savefile_rbf1);

% GroudTruth + Noise
y0_noisy = y_cell{1,1};
[~,fig_rbf_noisy] = pltfunc_rbf_2(y0_noisy', x', -1:3, '', 2);
savefile_rbf_noisy = [p1 '/SynResults/' data_type  'N' num2str(N) 'd' num2str(d) 'GroudtruthAddNoise' noise '.png'];
print(fig_rbf_noisy,'-dpng','-r300',savefile_rbf_noisy);
savefile_rbf_noisy1 = [p1 '/SynResults/' data_type  'N' num2str(N) 'd' num2str(d) 'GroudtruthAddNoise' noise '.fig'];
saveas(fig_rbf_noisy,savefile_rbf_noisy1);

for t = t_sel_ind
    % Recovery - t-design
    hat_yev_tdesigns = hat_yev_subtdesigns{1, t};
    [~,fig_recovery] = pltfunc_rbf_2(hat_yev_tdesigns', xev', 0.3:0.4:2,'',4);
    savefile_recovery = [p1 '/SynResults/' data_type  'N' num2str(N) 'd' num2str(d) 'Noise' noise 'TdesignsRecov_t' num2str(t) '.png'];
    print(fig_recovery,'-dpng','-r300', savefile_recovery);
    savefile_recovery1 = [p1 '/SynResults/' data_type  'N' num2str(N) 'd' num2str(d) 'Noise' noise 'TdesignsRecov_t' num2str(t) '.fig'];
    saveas(fig_recovery,savefile_recovery1);

    % error - Rand
    [~,fig_err] = pltfunc_rbf_2((yev-hat_yev_tdesigns)', xev', -0.1:0.1:0.25, '', 6);
    savefile_err = [p1 '/SynResults/' data_type  'N' num2str(N) 'd' num2str(d) 'Noise' noise 'TdesignsErr_t' num2str(t) '.png'];
    print(fig_err,'-dpng','-r300',savefile_err);
    savefile_err1 = [p1 '/SynResults/' data_type  'N' num2str(N) 'd' num2str(d) 'Noise' noise 'TdesignsErr_t' num2str(t) '.fig'];
    saveas(fig_err,savefile_err1);
end
