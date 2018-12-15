function u = htant_controller(q, dq, params, t)
global t_i
u = zeros(2, 1);

% f = params.f * tanh(params.alfa * t_i);
f = params.f;
% fprintf('%g  ', f);

[y, dy] = hyp_tan_t(q, dq, params.sw_target, f, t);
u(1) = params.kp_s * y + params.kd_s * dy;
u(2) = params.kp_t * (q(3) - params.t_target) + params.kd_t * dq(3);
end