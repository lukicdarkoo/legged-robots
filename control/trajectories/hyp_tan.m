function [e_q, e_dq] = hyp_tan(q, dq, sw_target, alfa)

q2_0 = - sw_target * tanh(alfa * q(1));
dq2_0 = - alfa * sw_target * (sech(alfa * q(1)))^2;

e_q = q(2) - q2_0;
e_dq = dq(2) - dq2_0;
end