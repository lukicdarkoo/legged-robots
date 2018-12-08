function u = control(t, q, dq, q0, dq0, step_number)

params.sw_target = pi/11;
params.sw_delay = 0;

params.kp_t = 178; 
params.kd_t = 25;
params.kp_s = 190; 
params.kd_s = 16;
params.alfa = 17.89; 
params.t_target = 0.177797;

params.f = 4; %%Hz (should be)

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
% u = htan_controller(q, dq, params);

%% hyperbolic tangent controller with frequency control
u = htant_controller(q, dq, params, t);

%% hyperbolic tangent 2
% params.alfa = 5;
% u = htan2_controller(q, dq, params);
end