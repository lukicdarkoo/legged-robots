function A_m = eval_A_m(q_m)
[m1, m2, m3, l1, l2, l3, g] = set_parameters;
q1_m = q_m(1);
q2_m = q_m(2);
q3_m = q_m(3);
m = m1; % As m1 and m2 are the same

t2 = q1_m-q2_m;
t3 = cos(t2);
t4 = l2.^2;
t5 = q2_m-q3_m;
t6 = cos(t5);
t7 = l1.^2;
t8 = l3.^2;
A_m = reshape([m.*t7.*(-1.0./4.0)+l1.*l2.*m.*t3.*(1.0./2.0),m.*t7.*(-1.0./4.0),0.0,m.*t4.*(-3.0./2.0)-m3.*t4+l1.*l2.*m.*t3.*(3.0./4.0)-l2.*l3.*m3.*t6.*(1.0./2.0),0.0,0.0,m3.*t8.*(-1.0./4.0)-l2.*l3.*m3.*t6.*(1.0./2.0),0.0,m3.*t8.*(-1.0./4.0)],[3,3]);
end