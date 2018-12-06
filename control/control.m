function u = control(t, q, dq, q0, dq0, step_number)

params.kp_t = 400;
params.kd_t = 27;
params.kp_s = 282;
params.kd_s = 40;

% params.kp_t = 297;
% params.kd_t = 36;
% params.kp_s = 260;
% params.kd_s = 5;


params.sw_target = pi/10;
params.sw_delay = 0;
params.t_target = 0.24019;

%% wrong controller
% u = wrong_controller(q, dq, params);

%% cosine controller
% u = cos_controller(q, dq, params);

%% cosine trajectory controller
% u = cos_traj_controller(q, dq, params);

%% updated spline controller
% params.alfa = 0.01;
% u = spline_controller(q, dq, params)

%% hyperbolic tangent controller
params.alfa = 12.748;
u = htan_controller(q, dq, params);

%% hyperbolic tangent 2
% params.alfa = 5;
% u = htan2_controller(q, dq, params);
end