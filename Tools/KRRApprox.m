function [hat_y, alpha] = KRRApprox(K_DB, K_BB, out_data, lambda, F)
%
%
% This function performs the Spectral Cutoff regression using the Simple Kernel. 
%
% in_data - Input to the functio to be regressed.  N (points) x D (dimensional)
% out_data - Ouput of the function to be regressed. N x 1 (points)
% test_data - Input of testing set. n (points) x D (dimensions) 
% test_y - Output of testing set. n  x 1 (points)
% lambda - Regularization Parameter. (Carefully choose this)
% ���lambda������һ������������ʾҪ����lambda�Ĳ���ѡ��


if nargin < 4
    lambda = 1; % 
end

%% Compute alpha
if nargin < 5
    N = size(K_DB, 1);
    F = pinv(K_DB'*K_DB + lambda*N*K_BB)*K_DB';  
end
alpha = F * out_data;

%% Compute MSE
hat_y = K_DB*alpha;      


