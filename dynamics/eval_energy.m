function [T, V] = eval_energy(q, dq)
[m1, m2, m3, l1, l2, l3, g] = set_parameters;

dq1=dq(1);
dq2=dq(2);
dq3=dq(3);
q1=q(1);
q2=q(2);
q3=q(3);

T = energy_T_tmp(dq1,dq2,dq3,l1,l2,l3,m1,m2,m3,q1,q2,q3);
V = energy_V_tmp(g,l1,l2,l3,m1,m2,m3,q1,q2,q3);

end