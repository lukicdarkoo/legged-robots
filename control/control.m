function u = control(t, q, dq, q0, dq0, step_number)

params.kp_t = 380;
params.kd_t = 11;
params.kp_s = 387;
params.kd_s = 38;

% params.kp_t = 297;
% params.kd_t = 36;
% params.kp_s = 260;
% params.kd_s = 5;


params.sw_target = 0.52021;
params.sw_delay = 0;
params.t_target = 0.31803;

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
params.alfa = 14.959;
u = htan_controller(q, dq, params);

%% hyperbolic tangent 2
% params.alfa = 5;
% u = htan2_controller(q, dq, params);
end