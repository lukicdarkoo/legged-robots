% You can set any hyper parameters of the control function here; you may or
% may not want to use the step_number as the input of the function. 
function [params] = control_hyper_parameters()
clearvars params
try
    load('params.mat', 'params');
catch
    fprintf('\ncould not load params, using default.\n');
    params.sw_delay = 0;
    params.sw_target = 0.3012;
    params.kp_t = 346; 
    params.kd_t = 36;
    params.kp_s = 477; 
    params.kd_s = 10;
    params.alfa = 10; 
    params.t_target = 0.4344;
    params.f = 6; %%Hz
end

end
