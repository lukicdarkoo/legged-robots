function u = control_opt(q, dq, params, c_type)
u = zeros(2, 1);

switch c_type
    case 'hyp_tan'
        u = htan_controller(q, dq, params);
    case 'spline'
        u = spline_controller(q, dq, params);
    case 'hyp_tan_2'
        u = htan2_controller(q, dq, params);
end

end