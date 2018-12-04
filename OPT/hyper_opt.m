addpath('./funct');

q = [0; 0; 0];
dq = [0.1; 0; 0];
steps = 30;

% optimization ranges
range_1 = 100:400;
range_2 = 1:50;
range_3 = -pi/3:0.005:0;
range_4 = 0:0.005:pi/3;

%parameter to optimize
% option 1
params.kp_t = 311;
% option 2
params.kd_t = 36;
% option 3
params.kp_s = 202;
% option 4
params.kd_s = 5;
% option 5
params.sw_target = pi/8;
% option 6
params.sw_delay = 0;
% option 7
params.t_target = pi/10;
% option 8
params.alfa = 5;

opt_par = {'kp_t', 'kd_t', 'kp_s', 'kd_s', 'sw_target', 'sw_delay', 't_target', 'alfa'};
controllers = {'hyp_tan', 'spline'};

params_opt = optimize(q, dq, params, opt_par{1}, range_1, steps, controllers{1})