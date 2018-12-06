function [dist, time, energy, step_deviation, step_size] = optimize_dist(q0, dq0, params, num_steps, c_type)
global E
E = zeros(2, 1);
sln = solve_eqns_opt(q0, dq0, num_steps, params, c_type);
r0 = [0; 0];
step_sizes = zeros(num_steps, 1);

for j = 1:num_steps
    Y = sln.Y{j};
    [N, ~] = size(Y);
    q = Y(N, 1:3);
    [x0, ~, ~, ~] = kin_swf(q);
    r0 = r0 + [x0; 0];
    step_sizes(j) = x0;
end
energy = sum(E);
dist = r0(1);
time = sln.T{end}(end);
step_deviation = std(step_sizes);
step_size = mean(step_sizes);
end