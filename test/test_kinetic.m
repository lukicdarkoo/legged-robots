function test_energy()
    k = 1;
    kinetic = [];
    potential = [];
    for alpha = 0:0.01:pi/4
        q(1) = alpha;
        q(2) = - alpha;
        q(3) = 0;

        dq = [ 1, 0.2, 0 ];
        
        if alpha >= pi/4 - 0.1
            
            q = q_p;
            dq = dq_p;
        end

        [q_p, dq_p] = impact(q, dq);
        
        [T, V] = eval_energy(q, dq);
        kinetic(k) = T;
        potential(k) = V;
        
        visualize(q)
        pause(0.01)
        k = k + 1;
    end
    figure()
    plot(kinetic);
    hold on;
    plot(potential);
    legend('Kinetic energy', 'Potential energy')
end