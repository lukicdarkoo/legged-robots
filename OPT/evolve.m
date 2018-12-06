addpath('./funct');
clc
close all

global HPARAMS POP E
HPARAMS = [
    {'kp_t', 150, 250};
    {'kd_t', 10, 25};
    {'kp_s', 150, 300};
    {'kd_s', 10, 30};
    {'alfa', 3, 20};
    {'t_target', 0, pi/12}
];

try
    POP = xlsread('population.xlsx');
catch
    POP = zeros(0, size(HPARAMS, 1) + 3);
end

% Run evolutive algorithm
min_values = cell2mat(HPARAMS(:, 2));
max_values = cell2mat(HPARAMS(:, 3));

ga_options = struct('Generations', 10, 'PopulationSize', 50);
IntCon = [1 2 3 4];
optimals = ga(@fitness, size(HPARAMS, 1), [], [], [], [], min_values, max_values, [], IntCon, ga_options);

energy = sum(E);
fprintf(['params.kp_t = %d; \nparams.kd_t = %d;', ... 
    '\nparams.kp_s = %d; \nparams.kd_s = %d;', ...
    '\nparams.alfa = %f; \nparams.t_target = %f;\n'], optimals);

xlswrite('population.xlsx', POP);

function val = fitness(chromosome)
    global POP
    params.sw_target = pi/11;
    q = [0; 0; 0];
    dq = [0; 0; 0];
    steps = 5;
    
    params.t_target = val_by_id(chromosome, 't_target');
    params.kp_t = val_by_id(chromosome, 'kp_t');
    params.kd_t = val_by_id(chromosome, 'kd_t');
    params.kp_s = val_by_id(chromosome, 'kp_s');
    params.kd_s = val_by_id(chromosome, 'kd_s');
    params.alfa = val_by_id(chromosome, 'alfa');
    
    % Evaluate it here
    try
        [dist, time, energy, step_deviation, step_size] = optimize_dist(q, dq, params, steps, 'hyp_tan');
        val = - 2 * dist + time - step_size + 5 * step_deviation;
        dist
        time
        energy
        step_size
        POP = cat(1, POP, cat(2, chromosome, dist, time, energy));
    catch
        warning('There was a problem with state-space calculation')
        val = realmax;
    end
end

function val = val_by_id(chromosome, id)
    global HPARAMS
    val = chromosome(strcmp(HPARAMS(:, 1), id));
end