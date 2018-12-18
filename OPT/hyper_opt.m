addpath('./funct');

q = [0; 0; 0];
dq = [0.1; 0; 0];
steps = 30;

% optimization ranges
range_1 = 100:400;
range_2 = 1:100;
range_3 = -pi/3:0.005:0;
range_4 = 0:0.005:pi/3;

%parameter to optimize
% option 1
params.kp_t = 297;
% option 2
params.kd_t = 36;
% option 3
params.kp_s = 260;
% option 
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
controllers = {'hyp_tan', 'spline', 'hyp_tan_2'};
h_param = opt_par{3};
c_type = controllers{3};


params_opt = optimize(q, dq, params, h_param, range_1, steps, c_type)