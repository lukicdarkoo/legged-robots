%% 
% Evalue the control matrix B
function B = eval_B()
[m1, m2, m3, l1, l2, l3, g] = set_parameters;
B = reshape([-1.0,0.0,-1.0,0.0,1.0,-1.0],[3,2]);
end