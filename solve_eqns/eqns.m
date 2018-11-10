function dy = eqns(t, y)
% n this is the dimension of the ODE, note that n is 2*DOF, why? 
% y1 = q1, y2 = q2, y3 = q3, y4 = dq1, y5 = dq2, y6 = dq3

y1 = y(1:3);
y2 = y(4:6);

u = control(y1, y2); % for the moment we set the control outputs to zero

n = 6;   
dy = zeros(n, 1);

% write down the equations for dy:


C = eval_C(y1, y2);
M = eval_M(y1);
G = eval_G(y1);
B = eval_B();

dy(1:3) = y2;
dy(4:6) = M \ (B * u - G - C * y2);

end