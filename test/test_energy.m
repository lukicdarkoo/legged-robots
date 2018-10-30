function test_energy()
k = 1;
    for i = -1:0.01:1

    q(1) = asin(i);
    q(2) = acos(i);
    q(3) = abs(q(1) - q(2))

    dq(1) = 1 / sqrt(1 - i^2);
    dq(2) = - 1 / sqrt(1 - i^2);
    dq(3) = (q(1) - q(2)) / abs(q(1) - q(2)) * (dq(1) -dq(2));
    
    energy(k) = eval_energy(q, dq);
    visualize(q)
    pause        
    k = k +1;
    end
     
plot(energy)
end