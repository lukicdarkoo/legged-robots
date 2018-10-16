%%
% This function takes the configuration of the 3-link model and plots the 
% 3-link model. 
% q = [q1, q2 ,q3] the generalized coordinates. Try different angles to see
% if your formulas for x1, z1, etc. makes sense. Example: q = [-pi/6, pi/6,
% pi/8]
%%
function visualize(q)

    [~, ~, ~, l1, l2, l3, ~] = set_parameters;
%     q1 = ;
%     q2 = ;
%     q3 = ;
%     
%     x1 = ;
%     z1 = ;
%     x2 = ;
%     z2 = ;
%     x3 = ;
%     z3 = ;
%     
%     x_h = ;
%     z_h = ;
%     
%     x_t = ;
%     z_t = ;
%     
%     x_swf = ;
%     z_swf = ;
    
    %% 
    % Here plot a schematic of the configuration of three link biped at the
    % generalized coordinate q = [q1, q2, q3]:
    close all
    lw = 2;
    % links
    % link1
    plot([0, x_h], [0, z_h], 'linewidth', lw); 
    hold on
    % link2
    
    % link3
    axis 'square'
    xlim([-1, 1]);
    ylim([0, 1.2]);
    % point masses
    mz = 40;
    % m1
    plot(x1, z1, '.', 'markersize', mz); 
    
    % m2
    
    % m3
end
