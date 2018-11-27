function u = control(t, q, dq, q0, dq0, step_number)
u = zeros(2, 1);

kp_t = 300;
kd_t = 40;
kp_s = 300;
kd_s = 10;


u(2) = kp_t * (q(3) - pi/12) + kd_t * dq(3);



y = q(2) + pi/15;
dy = dq(2) * sin(q(1) + pi/16);
u(1) = kp_s * y + kd_s * dy;

end