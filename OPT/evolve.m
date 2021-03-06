addpath('./funct');

close all

global HPARAMS POP i total 
i = 0;

HPARAMS = [
    {'kp_t', 650, 750};
    {'kd_t', 15, 25};
    {'kp_s', 650, 750};
    {'kd_s', 25, 35};
    {'sw_target', pi/25, pi/15};
    {'t_target', pi/35, pi/25}
];

try
    POP = xlsread('population.xlsx');
catch
    POP = zeros(0, size(HPARAMS, 1) + 3);
end

% Run evolutive algorithm
min_values = cell2mat(HPARAMS(:, 2));
max_values = cell2mat(HPARAMS(:, 3));

ga_options = struct('Generations', 5, 'PopulationSize', 500 );
% ga_options = optimoptions('ga','UseParallel', true, 'UseVectorized', false, 'Generations', 5, 'PopulationSize', 500);
total = (ga_options.Generations + 1) * ga_options.PopulationSize;
IntCon = [1 2 3 4];
optimals = ga(@fitness, size(HPARAMS, 1), [], [], [], [], min_values, max_values, [], IntCon, ga_options);

fprintf(['params.kp_t = %d; \nparams.kd_t = %d;', ... 
    '\nparams.kp_s = %d; \nparams.kd_s = %d;', ...
    '\nparams.sw_target = %f; \nparams.t_target = %f;\n'], optimals);

%% saving results and params to file

params.kp_t = optimals(1);
params.kd_t = optimals(2);
params.kp_s = optimals(3);
params.kd_s = optimals(4);
params.sw_target = optimals(5);
params.t_target = optimals(6);

try
    xlswrite('./SAVES/population.xlsx', POP);
    save('./SAVES/params.mat', 'params');
catch
    mkdir('./SAVES');
    save('./SAVES/params.mat', 'params');
    xlswrite('./SAVES/population.xlsx', POP);
end
    
%% 
run;

function val = fitness(chromosome)
    global POP i total
    q = [0; 0; 0];
    dq = [0; 0; 0];
    steps = 20;
    params.alfa = 10;
    
    params.sw_target = val_by_id(chromosome, 'sw_target');
    params.t_target = val_by_id(chromosome, 't_target');
    params.kp_t = val_by_id(chromosome, 'kp_t');
    params.kd_t = val_by_id(chromosome, 'kd_t');
    params.kp_s = val_by_id(chromosome, 'kp_s');
    params.kd_s = val_by_id(chromosome, 'kd_s');
    
    % Evaluate it here
    try
        [dist, time, energy, step_deviation, step_size] = optimize(q, dq, params, steps, 'exp');
%         val = - 2 * dist + time - step_size + 5 * step_deviation;
        val = - dist;
%         val = - dist - 2 * dist/time - 2 * step_size * steps / time + 3;
%         dist
%         time
%         energy
%         step_size
        POP = cat(1, POP, cat(2, chromosome, dist, time, energy));
    catch
        warning('There was a problem with state-space calculation')
        val = realmax;
    end
    fprintf('Iteration: %d/%d (%g%%)\n', i, total, i/total*100);
    i = i + 1;
end

function val = val_by_id(chromosome, id)
    global HPARAMS
    val = chromosome(strcmp(HPARAMS(:, 1), id));
end