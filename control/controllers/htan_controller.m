function u = htan_controller(q, dq, params)
u = zeros(2, 1);
[y, dy] = hyp_tan(q, dq, params.sw_target);
u(1) = params.kp_s * y + params.kd_s * dy;
u(2) = params.kp_t * (q(3) - params.t_target) + params.kd_t * dq(3);
end