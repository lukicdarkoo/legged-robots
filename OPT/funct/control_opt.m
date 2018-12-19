function u = control_opt(t, q, dq, params, c_type, step_number)
u = zeros(2, 1);

if step_number > 10; step_number = 10; end
params.t_target = params.t_target / 10 * step_number;

switch c_type
    case 'hyp_tan'
        u = htan_controller(q, dq, params);
    case 'spline'
        u = spline_controller(q, dq, params);
    case 'hyp_tan_2'
        u = htan2_controller(q, dq, params);
    case 'hyp_tan_t'
        u = htant_controller(q, dq, params, t);
    case 'linear'
        u = linear_controller(q, dq, params);
    case 'exp'
        u = experimental(q, dq, params);
end

%% saturation
if abs(u(1)) > 30; u(1) = sign(u(1)) * 30; end
if abs(u(2)) > 30; u(2) = sign(u(2)) * 30; end
end