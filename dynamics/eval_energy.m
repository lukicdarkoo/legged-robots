function [T, V] = eval_energy(q, dq)
[m1, m2, m3, l1, l2, l3, g] = set_parameters;

%Kinetic Energy
T1 = 0.5 * m1 * (l1 / 2 * dq(1))^2;
T2 = 0.5 * m2 * (l1 * dq(1) + l2 / 2 *dq(2))^2;
T3 = 0.5 * m3 * (l1 * dq(1) + l3 / 2 *dq(3))^2;
T = T1 + T2 + T3;

%Potential Energy
V1 = g * m1 * l1 / 2 * cos(q(1));
V2 = g * m2 * l2 / 2 * cos(q(2));
V3 = g * m3 * (l3 / 2 * cos(q(3)) + l1 * cos(q(1)));
V = V1 + V2 + V3;

end