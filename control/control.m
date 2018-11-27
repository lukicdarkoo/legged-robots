function u = control(t, q, dq, q0, dq0, step_number)
u = zeros(2, 1);

kp_t = 300;
kd_t = 23;
kp_s = 75;
kd_s = 7;

sw_target = -pi/8;
sw_delay = pi/8;
t_target = pi/8;

% u(2) = kp_t * (q(3) - t_target) + kd_t * dq(3);
% 
% y = q(2) - sw_target;
% dy = dq(2) * sin(q(1) + sw_delay);
% u(1) = kp_s * y + kd_s * dy;


y = (q(2) - sw_target) * 0.5 * (cos(q(1) - sw_delay) + 1);
dy = -(0.5 * (cos(q(1) - sw_delay) + 1) + (q(2) - sw_target) * (sin(q(1) - sw_delay) / 2));
u(1) = kp_s * y + kd_s * dy;


u(2) = kp_t * (q(3) - t_target) + kd_t * dq(3);

end