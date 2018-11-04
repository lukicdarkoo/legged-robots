function A_p = eval_A_p(q_p)
[m1, m2, m3, l1, l2, l3, g] = set_parameters;
q1_p = q_p(1);
q2_p = q_p(2);
q3_p = q_p(3);
m = m1; % As m1 and m2 are the same

A_p = [l1.*l2.*m.*cos(q1_p).*(-1.0./4.0),l1.*l2.*m.*cos(q2_p).*(-1.0./4.0),l3.^2.*m3.*cos(q3_p).*(1.0./4.0)];
end