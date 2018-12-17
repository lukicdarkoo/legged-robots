% You can set any hyper parameters of the control function here; you may or
% may not want to use the step_number as the input of the function. 
function [params] = control_hyper_parameters()
try
    load('params.mat', 'params');
catch
    fprintf('\ncould not load params, using default.\n');
    params.sw_delay = 0;
    params.sw_target = 0.214239;
    params.kp_t = 394; 
    params.kd_t = 39;
    params.kp_s = 450; 
    params.kd_s = 20;
    params.alfa = 10; 
    params.t_target = 0.356439;
    params.f = 6; %%Hz
end

end
