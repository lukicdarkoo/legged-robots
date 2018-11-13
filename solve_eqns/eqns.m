function dy = eqns(t, y)
% n this is the dimension of the ODE, note that n is 2*DOF, why? 
% y1 = q1, y2 = q2, y3 = q3, y4 = dq1, y5 = dq2, y6 = dq3

q = y(1:3);
dq = y(4:6);

u = control(q, dq); % for the moment we set the control outputs to zero

n = 6;   
dy = zeros(n, 1);

% write down the equations for dy:


C = eval_C(q, dq);
M = eval_M(q);
G = eval_G(q);
B = eval_B();

dy(1:3) = dq;
dy(4:6) = M \ (B * u - G - C * dq);

end