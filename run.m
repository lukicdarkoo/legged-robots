close all
set_path
sln = solve_eqns([0; 0; 0], [1;0;0], 10);

animate(sln);