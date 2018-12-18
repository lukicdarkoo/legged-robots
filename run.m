close all
% set_path
global U
U = [];
sln = solve_eqns([0; 0; 0], [0;0;0], 20);
animate(sln);
analyze(sln);
