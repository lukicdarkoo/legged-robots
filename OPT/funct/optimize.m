function [params_opt] = optimize(params, idx, range, q0, dq0, num_steps)
%% y1 = q1, y2 = q2, y3 = q3, y4 = dq1, y5 = dq2, y6 = dq3
max = -realmax;
switch idx
    case 1
%         kp_t optimization
        for i = 1:length(range)
            i
            params.kp_t = range(i);
            sln = solve_eqns_opt(q0, dq0, num_steps, params);
            r0 = [0; 0];
            for j = 1:num_steps
                Y = sln.Y{j};
                [N, ~] = size(Y);
                q = Y(N, 1:3);
                [x0, ~, ~, ~] = kin_swf(q);
                r0 = r0 + [x0; 0];
            end
            if r0(1) > max
                max = r0(1);
                n = i;
            end
        end
        params_opt = params;
        params_opt.kp_t = range(n);
        params_opt.dist = max;
    case 2
%         kd_t optimization
        for i = 1:length(range)
            params.kd_t = range(i);
            sln = solve_eqns_opt(q0, dq0, num_steps, params);
            r0 = [0; 0];
            for j = 1:num_steps
                Y = sln.Y{j};
                [N, ~] = size(Y);
                q = Y(N, 1:3);
                [x0, ~, ~, ~] = kin_swf(q);
                r0 = r0 + [x0; 0];
            end
            if r0(1) > max
                max = r0(1);
                n = i;
            end
        end
        params_opt = params;
        params_opt.kd_t = range(n);
        params_opt.dist = max;
    case 3
%         kp_s optimization
        for i = 1:length(range)
            i
            params.kp_s = range(i);
            sln = solve_eqns_opt(q0, dq0, num_steps, params);
            r0 = [0; 0];
            for j = 1:num_steps
                Y = sln.Y{j};
                [N, ~] = size(Y);
                q = Y(N, 1:3);
                [x0, ~, ~, ~] = kin_swf(q);
                r0 = r0 + [x0; 0];
            end
            if r0(1) > max
                max = r0(1);
                n = i;
            end
        end
        params_opt = params;
        params_opt.kp_s = range(n);
        params_opt.dist = max;
    case 4
%         kd_s optimization
        for i = 1:length(range)
            i
            params.kd_s = range(i);
            sln = solve_eqns_opt(q0, dq0, num_steps, params);
            r0 = [0; 0];
            for j = 1:num_steps
                Y = sln.Y{j};
                [N, ~] = size(Y);
                q = Y(N, 1:3);
                [x0, ~, ~, ~] = kin_swf(q);
                r0 = r0 + [x0; 0];
            end
            if r0(1) > max
                max = r0(1);
                n = i;
            end
        end
        params_opt = params;
        params_opt.kd_s = range(n);
        params_opt.dist = max;
    case 5
%         sw_target optimization
        for i = 1:length(range)
            i
            params.sw_target = range(i);
            sln = solve_eqns_opt(q0, dq0, num_steps, params);
            r0 = [0; 0];
            for j = 1:num_steps
                Y = sln.Y{j};
                [N, ~] = size(Y);
                q = Y(N, 1:3);
                [x0, ~, ~, ~] = kin_swf(q);
                r0 = r0 + [x0; 0];
            end
            if r0(1) > max
                max = r0(1);
                n = i;
            end
        end
        params_opt = params;
        params_opt.sw_target = range(n);
        params_opt.dist = max;
    case 6
%         sw_delay optimization
        for i = 1:length(range)
            i
            params.sw_delay = range(i);
            sln = solve_eqns_opt(q0, dq0, num_steps, params);
            r0 = [0; 0];
            for j = 1:num_steps
                Y = sln.Y{j};
                [N, ~] = size(Y);
                q = Y(N, 1:3);
                [x0, ~, ~, ~] = kin_swf(q);
                r0 = r0 + [x0; 0];
            end
            if r0(1) > max
                max = r0(1);
                n = i;
            end
        end
        params_opt = params;
        params_opt.sw_delay = range(n);
        params_opt.dist = max;
    case 7
%         t_target optimization
        for i = 1:length(range)
            i
            params.t_target = range(i);
            sln = solve_eqns_opt(q0, dq0, num_steps, params);
            r0 = [0; 0];
            for j = 1:num_steps
                Y = sln.Y{j};
                [N, ~] = size(Y);
                q = Y(N, 1:3);
                [x0, ~, ~, ~] = kin_swf(q);
                r0 = r0 + [x0; 0];
            end
            if r0(1) > max
                max = r0(1);
                n = i;
            end
        end
        params_opt = params;
        params_opt.t_target = range(n);
        params_opt.dist = max;
end