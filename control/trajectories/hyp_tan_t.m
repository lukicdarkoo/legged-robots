function [e_q, e_dq] = hyp_tan_t(q, dq, sw_target, f, t)

q2_0 = - sw_target * tanh(tan(pi * f * t));
dq2_0 = - pi * sw_target * f * (sec(pi * f *t))^2 * (sech(tan(pi * f * t)))^2;

e_q = q(2) - q2_0;
e_dq = dq(2) - dq2_0;

fprintf('time: %3.3g     q2_0: %3.3g\n', t, q2_0);
end