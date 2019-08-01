close all
clear all
set_path
clearvars U
global U
U = [];
%% zero condition
% sln = solve_eqns([0; 0; 0], [0;0;0], 70);

%% already running
sln = solve_eqns([-0.1476; 0.1618; 0.1251], [1.8343;0.3485;0.5153], 30);
animate(sln);
analyze(sln);
