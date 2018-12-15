close all
clc
% set_path
global params
params = control_hyper_parameters();
sln = solve_eqns([0; 0; 0], [0;0;0], 20);

animate(sln);