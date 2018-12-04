function [pp, dpp] = spline_traj(m, alfa)
% computes the deviation from the optimal trajectory of the swing foot
p0 = [-2*m; m];
p1 = [-m; m];
p2 = [-m/2; m/2] + alfa * [m/2; m/2];
p3 = [0; 0];
p4 = [m/2; -m/2] + alfa * [-m/2; -m/2];
p5 = [m; -m];
p6 = [2*m; -m];

p = [p0 p1 p2 p3 p4 p5 p6];

pp = spline(p(1, :), p(2, :));
dpp = fnder(pp, 1);
end