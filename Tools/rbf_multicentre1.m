function [y, y_dif] = rbf_multicentre(xyz, k, delta, xc, w)
% Y = rbf_multicentre(xyz,k,delta,xc,w)
% is a linear combination of RBF functions on sphere with centres xc and
% weigts w.
%
% Inputs:
% xyz -- points to evaluate, size(xyz,1)=Num. Points, size(xyz,2)=3
% k -- type of Wendland; smoothness = k + 3/2
% delta -- Scaling factor delta > 0 (Default delta = 1)
% xc -- set of centres of the Wendland functions;
% size(xc) = [Num. centres, Dim. sphere +1]
% w -- set of weights; row vector
if nargin < 3
    delta = 1;
end
if nargin < 4
    xc = [1 0 0; -1 0 0; 0 1 0; 0 -1 0; 0 0 1; 0 0 -1];
end
if nargin < 5
    w = ones(size(xc, 1),1);
end

% r = xyz' * xc; % n.points X n.center
r = pdist2(xyz, xc, 'euclidean');  % n.points X n.center

Y = Wendland_r(r, k, delta);
y = Y * w;

Y_tmp = zeros(size(xyz,1),1);
for i_c = 1:size(xc,1)
    rep_xc = repmat(xc(i_c,:),[size(xyz,1) 1]);
    r = sqrt(sum((xyz - rep_xc).^2,2));
    [Y_i,~,~] = Wendland_r(r,k,delta);
    Y_tmp = Y_tmp + w(i_c).*Y_i;
end
y1 = Y_tmp;
y_dif = max(abs(y-y1));