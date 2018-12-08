close all
clc

set_path
sln = solve_eqns([0; 0; 0], [1;2;0], 50);

animate(sln);