clear;
clc;

p1 = pwd;
addpath(genpath(p1))

if ~exist([cd '\SynResults'], 'dir')
	mkdir([cd '\SynResults']);
end

% Fig for Motivation - Symmetric spherical points
L1 = 5; 
x1 = SD(L1);

L2 = 13;
x2 = SD(L2);

L3 = 29;
x3 = SD(L3);

figure(1);
surf_jet;
show_s2_sphere(1000, [0, 0.4, 1])
hold on;
show_s2_points(x1',[1, 0, 0], 0.06)
hold on;
show_s2_points(x2', [0, 0.5, 0], 0.045)
hold on;
show_s2_points(x3', [0.9, 0.9, 0], 0.035)

view(165,-10);
light('Position', [10 100 10]);

savefile = [p1 '/SynResults/S2_points_symmetric_t_design.fig'];
saveas(1, savefile)
close;



% Fig for Motivation - Spherical points
L1 = 5; 
x1 = SF(L1);

L2 = 13;
x2 = SF(L2);

L3 = 29;
x3 = SF(L3);

figure(1);
surf_jet;
show_s2_sphere(1000, [0, 0.4, 1])
hold on;
show_s2_points(x1',[1, 0, 0], 0.06)
hold on;
show_s2_points(x2', [0, 0.5, 0], 0.045)
hold on;
show_s2_points(x3', [0.9, 0.9, 0], 0.035)

view(165,-10);
light('Position', [10 100 10]);

savefile = [p1 '/SynResults/S2_points_t_design.fig'];
saveas(1, savefile)



