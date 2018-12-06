%%
% External horizontal push at the hip at step_number 10
function u_ext = perturbation(q, step_number)

[ext_step_number, ext_value] = ext_perturbation_parameters();

if step_number == ext_step_number
    F = ext_value; % value of the external push
else
    F = 0;
end

[~, ~, ~, l1, ~, ~, ~] = set_parameters();

u_ext = zeros(2, 1);
u_ext(1) = F * l1 * cos(q(1));
u_ext(2) = 0;

end