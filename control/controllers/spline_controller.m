function u = spline_controller(q, dq, params)
u = zeros(2, 1);
[pp, dpp] = spline_traj(params.sw_target, params.alfa);

y = q(2) - ppval(pp, q(1));
dy = dq(2) - ppval(dpp, q(1));

u(1) = params.kp_s * y + params.kd_s * dy;
u(2) = params.kp_t * (q(3) - params.t_target) + params.kd_t * dq(3);

end