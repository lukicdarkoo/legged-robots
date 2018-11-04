function test_kinetic_loss()
    % Question 2
    fprintf('Question 2\n');
    q_m = [pi/6, -pi/6, pi/10];
    dq_m = [1, 0.2, 0];
    
    [kinetic_m, potential_m] = eval_energy(q_m, dq_m);
    [q_p, dq_p] = impact(q_m, dq_m);
    [kinetic_p, potential_p] = eval_energy(q_p, dq_p);

    energy_loss_percent = (1 - kinetic_p / kinetic_m) * 100;
    fprintf('Energy loss = %f\n\n', energy_loss_percent);
    
    % Question 3
    fprintf('Question 2\n');
    energy_loss_vector = [];
    i = 1;
    for alpha=0:0.01:pi/4
        q_m = [alpha, -alpha, 0];
        dq_m = [1, 0.2, 0];
        
        [kinetic_m, potential_m] = eval_energy(q_m, dq_m);
        [q_p, dq_p] = impact(q_m, dq_m);
        [kinetic_p, potential_p] = eval_energy(q_p, dq_p);
        
        energy_loss_percent = (1 - kinetic_p / kinetic_m) * 100;
        energy_loss_vector(i) = energy_loss_percent;
        i = i + 1;
    end
    plot(0:0.01:pi/4, energy_loss_vector);
end