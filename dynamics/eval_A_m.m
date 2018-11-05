function A_m = eval_A_m(q_m)

    [m, ~, m3, l1, l2, l3, ~] = set_parameters();

    q1_m = q_m(1); 
    q2_m = q_m(2);
    q3_m = q_m(3);
   
    A_m = Am_tmp(l1,l2,l3,m,m3,q1_m,q2_m,q3_m);
end