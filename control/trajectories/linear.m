function [e_q, e_dq] = linear(q, dq, sw_target)

q2_0 = -q(1);
dq2_0 =  - dq(1);

if abs(q2_0) > sw_target
    q2_0 = sign(q2_0) * sw_target;
    dq2_0 = 0;
end
e_q = q(2) - q2_0;
e_dq = dq(2) - dq2_0;

end