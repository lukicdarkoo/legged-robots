function val = optimize_dist(q0, dq0, params, num_steps, c_type)

sln = solve_eqns_opt(q0, dq0, num_steps, params, c_type);
r0 = [0; 0];
for j = 1:num_steps
    Y = sln.Y{j};
    [N, ~] = size(Y);
    q = Y(N, 1:3);
    [x0, ~, ~, ~] = kin_swf(q);
    r0 = r0 + [x0; 0];
end
val = r0(1);
    
end