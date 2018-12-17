%% Read the README_ASSIGN4.pdf to see what results you need to analyze here. 
function sln = analyze(sln)
%% retrieve variables
[m1, m2, m3, l1, l2, ~, g] = set_parameters();

steps = length(sln.T);
[time, sol, t_e, y_e] = deal([]);
for s = 1:steps
    time = [time sln.T{s}'];
    sol = [sol sln.Y{s}'];
    t_e = [t_e sln.TE{s}'];
    y_e = [y_e sln.YE{s}'];
end

%% angles vs time
figure();
subplot(2, 1, 1);
    plot(time, sol(1:3,:));
    title('angles vs time');
    xlabel('time');
    ylabel('rad');
    legend('q1', 'q2', 'q3');
subplot(2, 1, 2)
    plot(time, sol(4:6,:));
    title('angular velocities vs time');
    xlabel('time');
    ylabel('rad/s');
    legend('dq1', 'dq2', 'dq3');

%% velocity of the robot vs time
v_h = l1 .* sol(4,:) .* cos(sol(1,:));
figure();
plot(time, v_h);
title('hip linear velocity vs time');
xlabel('time');
ylabel('m/s');
legend('v');

%% step lenght vs step number
figure();
d_s = l2 .* sin(y_e(2,:)) + l1 .* sin(y_e(1,:));
stem(1:steps, d_s);
title('step lenght vs step');
xlabel('step');
ylabel('m');
legend('step lenght');

%% displacement in each step vs step number
figure()
d_h = l2 .* sin(y_e(2,:));
stem(1:steps, d_h);
title('displacement vs step');
xlabel('step');
ylabel('m');
legend('displacement');

%% step frequency vs step number
temp = circshift(t_e, 1);
temp(1) = 0;
t_s = t_e - temp;
figure();
subplot(1, 2, 1);
    stem(1:steps, t_s);
    title('step time vs step');
    xlabel('step');
    ylabel('s');
    legend('step time');
subplot(1, 2, 2);
    stem(1:steps, 1 ./ t_s);
    title('step frequency vs step');
    xlabel('step');
    ylabel('Hz');
    legend('step frequency');

%% torques vs time
global U
figure();
plot(U(3,:), U(1:2,:));
title('torques vs time');
xlabel('time');
ylabel('Nm');
legend('u1', 'u2');

%% cost of transport
E1 = sum(U(1, U(1,:)>0));
E2 = sum(U(2, U(2,:)>0));
E = [E1 E2];
M = m1 + m2 + m3;
figure();
subplot(1, 2, 1);
    stem(1, E1); hold on
    stem(2, E2);
    title('total energy');
    xlabel('u');
    ylabel('J');
    legend('E1', 'E2');
subplot(1, 2, 2);
    stem(sum(E)/(M*g*sum(d_h)));
    title('cost of transport');
    legend('CoT');

%% q vs dq for all three angles.
figure();
subplot(3, 1, 1);
    plot(sol(1,:), sol(4,:));
    title('dq1 vs q1');
    xlabel('rad');
    ylabel('rad/s');
    legend('dq1');
subplot(3, 1, 2);
    plot(sol(2,:), sol(5,:));
    title('dq2 vs q2');
    xlabel('rad');
    ylabel('rad/s');
    legend('dq2');
subplot(3, 1, 3);
    plot(sol(3,:), sol(6,:));
    title('dq3 vs q3');
    xlabel('rad');
    ylabel('rad/s');
    legend('dq3');
end