function u = control_opt(t, q, dq, params, c_type)
u = zeros(2, 1);

switch c_type
    case 'hyp_tan'
        u = htan_controller(q, dq, params);
    case 'spline'
        u = spline_controller(q, dq, params);
    case 'hyp_tan_2'
        u = htan2_controller(q, dq, params);
    case 'hyp_tan_t'
        u = htant_controller(q, dq, params, t);
end

end