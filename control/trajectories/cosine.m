function [e_q, e_dq] = cosine(q, dq, q_max, h)
syms x;

[~, ~, ~, l1, l2, ~, ~] = set_parameters();
% q(1)
% l2
% q_max
% h
X = vpasolve(l2 / h * (1 - cos( pi * x / l2 / sin(q_max))) + 1e-5 == l2 * sin(pi/2 - q(1)) - (l2^2 - (x - l2 * cos(pi/2 - q(1)))^2)^(0.5), x, 2 * l2 * sign(q(1)))
Z = l2 / h * (1 - cos( pi * X / l2 / sin(q_max)))

% c = -l2:0.01:l2;
% for k = 1:length(c)
%     y(k) = (l2 * sin(pi/2 - q(1)) - (l2^2 - (c(k) - l2 * cos(pi/2 - q(1)))^2)^(0.5));
%     if ~isreal(y(k))
%         y(k) = NaN;
%     end
% end
% plot(c, y); axis equal; hold on
% plot(c, l2 / h * (1 - cos( pi * c / l2 / sin(q_max))));   
[x_h, z_h, ~, ~] = kin_hip(q, dq);
q_opt = atan((z_h - Z) / (x_h - X));
e_q = q_opt - q(2);

dz = pi * h / sin(q_max) * sin(pi * X / l2 / sin(q_max));
e_dq = dz / l2 - dq(2);
end