function u = experimental(q, dq, params)
u = zeros(2, 1);
[y, dy] = linear(q, dq, params.sw_target);
u(1) = params.kp_s * y + params.kd_s * dy;
u(2) = params.kp_t * (q(3) - params.t_target) + params.kd_t * dq(3);
% u(2) = params.kp_t * (q(3) - params.t_target - exp(-50 * (q(2) - 0.5)^2) / 1) + params.kd_t * (dq(3) + (q(2) - 0.5) * 4 * exp(-50 * (q(2) - 0.5)^2));

end
