function u = cos_controller(q, dq, params)
u = zeros(2, 1);
d = 1;
y = (q(2) + params.sw_target) * 0.5 * (cos(q(1) - params.sw_delay)^d + 1);
dy = 0.5 * (cos(q(1) - params.sw_delay)^d  + 1 + (-params.sw_target - q(2)) * d * cos(q(1) - params.sw_delay)^(d - 1) * (sin(q(1) - params.sw_delay)));

u(1) = params.kp_s * y + params.kd_s * dy;

u(2) = params.kp_t * (q(3) - params.t_target) + params.kd_t * dq(3);
end