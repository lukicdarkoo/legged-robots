addpath('./funct');

q = [0; 0; 0];
dq = [1; 0; 0];
steps = 30;

% optimization range
range_1 = 100:500;
range_2 = 1:50;

%parameter to optimize
% option 1
params.kp_t = 300;
% option 2
params.kd_t = 23;
% option 3
params.kp_s = 75;
% option 4
params.kd_s = 7;
% option 5
params.sw_target = -pi/8;
% option 6
params.sw_delay = pi/8;
% option 7
params.t_target = pi/8;

params_opt = optimize(params, 1, range_1, q, dq, steps)