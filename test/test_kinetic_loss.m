function test_kinetic_loss()
    q_m = [pi/6, -pi/6, pi/10];
    dq_m = [1, 0.2, 0];
    
    [kinetic_m, potential_m] = eval_energy(q_m, dq_m);
    [q_p, dq_p] = impact(q_m, dq_m);
    [kinetic_p, potential_p] = eval_energy(q_p, dq_p);

    kinetic_m
    kinetic_p
end