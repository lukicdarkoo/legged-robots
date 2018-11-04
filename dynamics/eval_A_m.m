function A_m = eval_A_m(q_m)
[m1, m2, m3, l1, l2, l3, g] = set_parameters;
q1_m = q_m(1);
q2_m = q_m(2);
q3_m = q_m(3);
m = m1; % As m1 and m2 are the same

t2 = cos(q1_m);
t3 = abs(l1.*t2.*(1.0./2.0)-l2.*cos(q2_m));
t4 = abs(l1.*sin(q1_m).*(1.0./2.0)-l2.*sin(q2_m));
A_m = [l1.*m.*t2.*sqrt(t3.^2+t4.^2).*(-1.0./2.0),0.0,l3.^2.*m3.*cos(q3_m).*(1.0./4.0)];
end