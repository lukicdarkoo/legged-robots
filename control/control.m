function u = control(t, q, dq, q0, dq0, step_number)

params.kp_t = 311;
params.kd_t = 36;
params.kp_s = 202;
params.kd_s = 5;

params.sw_target = pi/8;
params.sw_delay = 0;
params.t_target = pi/10;

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
params.alfa = 5;
u = htan_controller(q, dq, params);

end