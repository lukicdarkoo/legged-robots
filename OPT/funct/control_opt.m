function u = control_opt(q, dq, params)
u = zeros(2, 1);

% u(2) = kp_t * (q(3) - t_target) + kd_t * dq(3);
% 
% y = q(2) - sw_target;
% dy = dq(2) * sin(q(1) + sw_delay);
% u(1) = kp_s * y + kd_s * dy;

y = (q(2) - params.sw_target) * 0.5 * (cos(q(1) - params.sw_delay) + 1);
dy = -(0.5 * (cos(q(1) - params.sw_delay) + 1) + (q(2) - params.sw_target) * (sin(q(1) - params.sw_delay) / 2));

u(1) = params.kp_s * y + params.kd_s * dy;
u(2) = params.kp_t * (q(3) - params.t_target) + params.kd_t * dq(3);

end