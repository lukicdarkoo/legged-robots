function u = control(t, q, dq, q0, dq0, step_number)

params = control_hyper_parameters(step_number);
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
u = htan_controller(q, dq, params);

%% hyperbolic tangent controller with frequency control
% u = htant_controller(q, dq, params, t);

%% hyperbolic tangent 2
% params.alfa = 5;
% u = htan2_controller(q, dq, params);

%% experimental
% u = experimental(q, dq, params);

%% linear
% u = linear_controller(q, dq, params);

%% saturation
if abs(u(1)) > 30; u(1) = sign(u(1)) * 30; end
if abs(u(2)) > 30; u(2) = sign(u(2)) * 30; end