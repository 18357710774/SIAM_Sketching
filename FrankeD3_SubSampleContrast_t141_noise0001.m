clear; 
clc;

p1 = pwd;
addpath(genpath(p1))

if ~exist([p1 '\SynResults'], 'dir')
	mkdir([p1 '\SynResults']);
end

L = 141; 
d = 3;
ExNum = 30;
noise = 0.001;
M = 10;

% set the value of lambda and sigma
lambda = 2.3842e-7;
sigma = 0.1292;

% generate data
x = SD(L);
N = size(x, 1);
y0 = Franke_fun(x);

% point for evaluation
Nev = 10000;
[~, xev] = SP(Nev);
yev = Franke_fun(xev);

% compute the kernel matrix
KerPara.KernelType = 4; 
KerPara.para = sigma;
Ktr = KernelComputation(x, x, KerPara);
Kte = KernelComputation(xev, x, KerPara);

% set the number of t in t-designs
t_seq = 1:2:141;
tNum = length(t_seq);
N_subset_vec = zeros(1, tNum);

RMSE_tr_subsetfir = zeros(ExNum, tNum);
RMSE_tr_subsetrand = zeros(ExNum, tNum);
RMSE_tr_subtdesigns = zeros(ExNum, tNum);
RMSE_te_subsetfir = zeros(ExNum, tNum);
RMSE_te_subsetrand = zeros(ExNum, tNum);
RMSE_te_subtdesigns = zeros(ExNum, tNum);

alpha_subsetfir = cell(ExNum, tNum);
alpha_subsetrand = cell(ExNum, tNum);
alpha_subtdesigns = cell(ExNum, tNum);

hat_y_subsetfir = cell(ExNum, tNum);
hat_y_subsetrand = cell(ExNum, tNum);
hat_y_subtdesigns = cell(ExNum, tNum);
hat_yev_subsetfir = cell(ExNum, tNum);
hat_yev_subsetrand = cell(ExNum, tNum);
hat_yev_subtdesigns = cell(ExNum, tNum);

ind_subsetrand = cell(ExNum, tNum);
y_cell = cell(ExNum, tNum);

kk = 0;

for t = t_seq
    kk = kk+1;
    x_subtdesigns = SD(t);
    N_subset = size(x_subtdesigns, 1);   
    N_subset_vec(kk) = N_subset;
    
    x_subsetfir = x(1:N_subset, :);
    
    K_DB_subsetfir = Ktr(:, 1:N_subset);
    K_BB_subsetfir = Ktr(1:N_subset, 1:N_subset);
    Kte_DB_subsetfir = Kte(:, 1:N_subset);
    F_subsetfir = pinv(K_DB_subsetfir'*K_DB_subsetfir + lambda*N*K_BB_subsetfir)*K_DB_subsetfir';  
        
    K_DB_subtdesigns = KernelComputation(x, x_subtdesigns, KerPara);
    K_BB_subtdesigns = KernelComputation(x_subtdesigns, x_subtdesigns, KerPara);
    Kte_DB_subtdesigns = KernelComputation(xev, x_subtdesigns, KerPara);  
    F_subtdesigns = pinv(K_DB_subtdesigns'*K_DB_subtdesigns + lambda*N*K_BB_subtdesigns)*K_DB_subtdesigns';  
    
    for Ex = 1:ExNum
        rng(Ex);
       %% generate noisy output    
        e = noise * randn(N, 1);
        e = sign(e).* min(abs(e), M);
        y = y0 + e;
        y_cell{Ex, kk} = y;
        
       %% select the first m samples
        [hat_y_subsetfirtmp, alpha_subsetfir{Ex, kk}] = KRRApprox(K_DB_subsetfir, K_BB_subsetfir, y, lambda, F_subsetfir);
        hat_yev_subsetfirtmp = Kte_DB_subsetfir * alpha_subsetfir{Ex, kk};
        RMSE_tr_subsetfir(Ex, kk) = sqrt(mean((y - hat_y_subsetfirtmp).^2));
        RMSE_te_subsetfir(Ex, kk) = sqrt(mean((yev - hat_yev_subsetfirtmp).^2));
        hat_y_subsetfir{Ex, kk} = hat_y_subsetfirtmp;
        hat_yev_subsetfir{Ex, kk} = hat_yev_subsetfirtmp;
       
       %% randomly select m samples
        indrand = randperm(N);
        indsel = indrand(1:N_subset);
        ind_subsetrand{Ex, kk} = indsel;
        x_subsetrand = x(indsel, :);
        K_DB_subsetrand = Ktr(:, indsel);
        K_BB_subsetrand = Ktr(indsel, indsel);  
        Kte_DB_subsetrand = Kte(:, indsel);
        
        [hat_y_subsetrandtmp, alpha_subsetrand{Ex, kk}] = KRRApprox(K_DB_subsetrand, K_BB_subsetrand, y, lambda);
        hat_yev_subsetrandtmp = Kte_DB_subsetrand * alpha_subsetrand{Ex, kk};
        RMSE_tr_subsetrand(Ex, kk) = sqrt(mean((y - hat_y_subsetrandtmp).^2));
        RMSE_te_subsetrand(Ex, kk) = sqrt(mean((yev - hat_yev_subsetrandtmp).^2));
        hat_y_subsetrand{Ex, kk} = hat_y_subsetrandtmp;
        hat_yev_subsetrand{Ex, kk} = hat_yev_subsetrandtmp;

        %% t-designs samples
        [hat_y_subtdesignstmp, alpha_subtdesigns{Ex, kk}] = KRRApprox(K_DB_subtdesigns, K_BB_subtdesigns, y, lambda, F_subtdesigns);
        hat_yev_subtdesignstmp = Kte_DB_subtdesigns * alpha_subtdesigns{Ex, kk};
        RMSE_tr_subtdesigns(Ex, kk) = sqrt(mean((y - hat_y_subtdesignstmp).^2));
        RMSE_te_subtdesigns(Ex, kk) = sqrt(mean((yev - hat_yev_subtdesignstmp).^2)); 
        hat_y_subtdesigns{Ex, kk} = hat_y_subtdesignstmp;
        hat_yev_subtdesigns{Ex, kk} = hat_yev_subtdesignstmp;

        disp(['t# ' num2str(t) '  SubSetSamples# ' num2str(N_subset)  '  Ex# ' num2str(Ex) ...
            ':  RMSE_te_subsetfir = ' num2str(RMSE_te_subsetfir(Ex, kk)) ...
            '   RMSE_te_subsetrand = ' num2str(RMSE_te_subsetrand(Ex, kk)) ...
            '   RMSE_te_subtdesigns = ' num2str(RMSE_te_subtdesigns(Ex, kk))] );  
    end
end

RMSE_te_subsetfir_mean = mean(RMSE_te_subsetfir, 1);
RMSE_te_subsetrand_mean = mean(RMSE_te_subsetrand, 1);
RMSE_te_subtdesigns_mean = mean(RMSE_te_subtdesigns, 1);

RMSE_tr_subsetfir_mean = mean(RMSE_tr_subsetfir, 1);
RMSE_tr_subsetrand_mean = mean(RMSE_tr_subsetrand, 1);
RMSE_tr_subtdesigns_mean = mean(RMSE_tr_subtdesigns, 1);


save([p1 '\SynResults\Franke_N' num2str(N) 'D' num2str(d) ...
    '_SubSampleContrast_t' num2str(L) '_noise' num2str(noise) '.mat'],...
    'ExNum', 'KerPara', 'N', 'L', 'd',  'noise', 'lambda', 'sigma', 'y_cell',...
     't_seq', 'x', 'y0', 'xev', 'yev', 'N_subset_vec', ...
     'RMSE_te_subsetfir', 'RMSE_te_subsetrand', 'RMSE_te_subtdesigns', ...
     'RMSE_tr_subsetfir', 'RMSE_tr_subsetrand', 'RMSE_tr_subtdesigns', ...
     'RMSE_te_subsetfir_mean', 'RMSE_te_subsetrand_mean', 'RMSE_te_subtdesigns_mean', ...
     'RMSE_tr_subsetfir_mean', 'RMSE_tr_subsetrand_mean', 'RMSE_tr_subtdesigns_mean', ...
     'alpha_subsetfir', 'alpha_subsetrand', 'alpha_subtdesigns', ...
     'hat_y_subsetfir', 'hat_y_subsetrand', 'hat_y_subtdesigns', ...
     'hat_yev_subsetfir', 'hat_yev_subsetrand', 'hat_yev_subtdesigns', 'ind_subsetrand');