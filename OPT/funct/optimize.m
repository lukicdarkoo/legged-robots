function [params_opt] = optimize(q0, dq0, params, idx, range, num_steps, c_type)

max = -realmax;
M = length(range);
for i = 1:M
    params.(idx) = range(i);
    sln = solve_eqns_opt(q0, dq0, num_steps, params, c_type);
    r0 = [0; 0];
    for j = 1:num_steps
        Y = sln.Y{j};
        [N, ~] = size(Y);
        q = Y(N, 1:3);
        [x0, ~, ~, ~] = kin_swf(q);
        r0 = r0 + [x0; 0];
    end
    fprintf('\niter: %d/%d, %s: %d, distance: %g', i, M, idx, range(i), r0(1));
    if r0(1) > max
        max = r0(1);
        n = i;
    end
end
params_opt = params;
params_opt.(idx) = range(n);
params_opt.dist = max;
end