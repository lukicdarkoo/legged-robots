function [e_q, e_dq] = exp_traj(q, dq, sw_target)
k = 1.28087807105;
q2_0 = - k * sw_target * tanh(pi * q(1) / sw_target / 3);
dq2_0 = - k * pi / 3 * (sech(pi * q(1) / sw_target / 3))^2;

e_q = q(2) - q2_0;
e_dq = dq(2) - dq2_0;
end