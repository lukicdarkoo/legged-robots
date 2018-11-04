function A_p = eval_A_p(q_p)
[m1, m2, m3, l1, l2, l3, g] = set_parameters;
q1_p = q_p(1);
q2_p = q_p(2);
q3_p = q_p(3);
m = m1; % As m1 and m2 are the same

t2 = l2.^2;
t3 = q2_p-q3_p;
t4 = cos(t3);
t5 = l3.^2;
A_p = reshape([l1.*l2.*m.*cos(q1_p-q2_p).*(1.0./4.0),0.0,0.0,m.*t2.*(-3.0./4.0)-m3.*t2-l2.*l3.*m3.*t4.*(1.0./2.0),m.*t2.*(-1.0./4.0),0.0,m3.*t5.*(-1.0./4.0)-l2.*l3.*m3.*t4.*(1.0./2.0),0.0,m3.*t5.*(-1.0./4.0)],[3,3]);
end