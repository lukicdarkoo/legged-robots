function A_p = eval_A_p(q_p)
    
    [m, ~, m3, l1, l2, l3, ~] = set_parameters();
    
    q1_p = q_p(1); 
    q2_p = q_p(2);
    q3_p = q_p(3);

    A_p = Ap_tmp(l1,l2,l3,m,m3,q1_p,q2_p,q3_p);
end