addpath('./funct');
clc
close all

global HPARAMS POP
HPARAMS = [
    {'kp_t', 200, 400};
    {'kd_t', 10, 40};
    {'kp_s', 200, 400};
    {'kd_s', 10, 40};
    {'alfa', 3, 15};
    {'t_target', 0, pi/11}
];

try
    POP = xlsread('population.xlsx');
catch
    POP = zeros(0, size(HPARAMS, 1) + 3);
end

% Run evolutive algorithm
min_values = cell2mat(HPARAMS(:, 2));
max_values = cell2mat(HPARAMS(:, 3));
ga_options = struct('Generations', 50, 'PopulationSize', 50);
IntCon = [1 2 3 4];
optimals = ga(@fitness, size(HPARAMS, 1), [], [], [], [], min_values, max_values, [], IntCon, ga_options);

fprintf('Optimal Parameters:\n  kp_t: %3d, kd_t: %3d, kp_s: %3d, kd_s: %3d, t_target: %.5g, alpha: %.5g \n', optimals);

xlswrite('population.xlsx', POP);

function val = fitness(chromosome)
    global POP
    params.sw_target = pi/10;
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
        [dist, time, energy] = optimize_dist(q, dq, params, steps, 'hyp_tan');
        val = - dist;
%         dist
%         fprintf('kp_t: %3d, kd_t: %3d, kp_s: %3d, kd_s: %3d, sw_target: %3.4g, t_target: %3.4g, alpha: %3.4g, dist: %3.4g, energy: %.2g \n\n', chromosome, dist, energy);
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