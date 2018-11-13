%% 
% This function defines the event function.
% In the three link biped, the event occurs when the swing foot hits the
% ground.
%%
function [value,isterminal,direction] = event_func(t, y)

% you may want to use kin_swf to set the 'value'
q = y(1:3);
dq = y(4:6);

[x_swf, z_swf, dx_swf, dz_swf] = kin_swf(q, dq);

value = z_swf + 0.001;
isterminal = 1;
direction = -1;

end
