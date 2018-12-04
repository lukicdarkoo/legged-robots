close all
clc
% set_path
sln = solve_eqns([0; 0; 0], [0.1;0;0], 30);

animate(sln);