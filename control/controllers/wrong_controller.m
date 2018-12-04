function u = wrong_controller(q, dq, params)
u = zeros(2, 1);
u(2) = params.kp_t * (q(3) - params.t_target) + params.kd_t * dq(3);

y = q(2) + params.sw_target;
dy = dq(2) * sin(q(1) + params.sw_delay);
u(1) = params.kp_s * y + params.kd_s * dy;
end