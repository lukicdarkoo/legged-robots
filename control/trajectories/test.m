clc 
close all
syms x1;

[~, ~, ~, ~, l2, ~, ~] = set_parameters();

h = 1/15;
q_max  = pi/6;
m = pi/3;

% x = -2*l2 : 0.001 : 2*l2;
% 
% a = -m : 0.001 : m;
% plot(x, l2 * h * (1 - cos( pi * x / l2 / sin(q_max)))); hold on;
% for i = 1:length(a)
%     for k = 1:length(x)
%         y(k) = (l2 * sin(pi/2 - a(i)) - (l2^2 - (x(k) - l2 * cos(pi/2 - a(i)))^2)^(0.5));
%         if ~isreal(y(k))
%             y(k) = NaN;
%         end
%     end
%     plot(x, y); axis equal; hold on
%     X(i) = vpasolve(l2 * h * (1 - cos( pi * x1 / l2 / sin(q_max))) == l2 * sin(pi/2 - a(i)) - (l2^2 - (x1 - l2 * cos(pi/2 - a(i)))^2)^(0.5), x1, 2* l2 * sin(a(i)));
%     Y(i) = l2 * h * (1 - cos( pi * X(i) / l2 / sin(q_max)));
%     fprintf('ok: %g; %g \n',X(i), Y(i));
%     pause(0.00001)
% end


pos0 = [0 0];
alfa = -pi/6;
p0 = [-2 * l2 * cos(alfa) + pos0(1); l2 * (1 - sin(alfa)) + pos0(2)];
p1 = [-l2 * cos(alfa) + pos0(1); l2 * (1 - sin(alfa)) + pos0(2)];
p2 = [ pos0(1); pos0(2)];
p3 = [l2 * cos(alfa) + pos0(1); l2 * (1 - sin(alfa)) + pos0(2)];
p4 = [2 * l2 * cos(alfa) + pos0(1); l2 * (1 - sin(alfa)) + pos0(2)];

p = [ p0 p1 p2 p3 p4 ];
x = -2 * l2 * cos(alfa):0.001:2 * l2 * cos(alfa);
pp = spline(x, p, pos(1));
% pp = spline(x, p)
yy = ppval(pp, linspace(-2 * l2 * cos(alfa), 2 * l2 * cos(alfa),101));
plot(yy(1, :), yy(2,:)); axis equal; hold on
scatter(p(1,:), p(2,:))
% error = (pos(2) - pp(2));


