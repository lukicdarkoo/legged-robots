function A_p = eval_A_p(q_p)
[m1, m2, m3, l1, l2, l3, g] = set_parameters;
A_p = [l1.*l2.*m.*cos(q1_p).*(-1.0./4.0),l1.*l2.*m.*cos(q2_p).*(-1.0./4.0),l3.^2.*m3.*cos(q3_p).*(1.0./4.0)];
end