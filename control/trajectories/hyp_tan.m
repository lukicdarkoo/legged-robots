function [e_q, e_dq] = hyp_tan(q, dq, sw_target)

q2_0 = - sw_target * tanh(pi * q(1) / sw_target);
dq2_0 = - pi * (sech(pi * q(1) / sw_target))^2;

e_q = q(2) - q2_0;
e_dq = dq(2) - dq2_0;
% if abs(q(1)) > sw_target || abs(q(2)) > sw_target; fprintf('\nlimit excedeed: q1 = %f, q2 = %f, q20 = %f', q(1), q(2), q2_0); end
end