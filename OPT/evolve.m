addpath('./funct');

global HPARAMS
HPARAMS = [
    {'kp_t', 200, 400};
    {'kd_t', 10, 40};
    {'kp_s', 200, 400};
    {'kd_s', 10, 40};
    {'sw_target', pi/10, pi/6};
    {'t_target', pi/10, pi/9};
    {'alfa', 3, 15};
];

% Run evolutive algorithm
min_values = cell2mat(HPARAMS(:, 2));
max_values = cell2mat(HPARAMS(:, 3));
ga_options = struct('Generations', 500, 'PopulationSize', 50);
% optimals = ga(@fitness, size(HPARAMS, 1), [], [], [], [], min_values, max_values);
IntCon = [1 2 3 4];
optimals = ga(@fitness, size(HPARAMS, 1), [], [], [], [], min_values, max_values, [], IntCon, ga_options);
optimals


function val = fitness(chromosome)
   
    params.kp_t = val_by_id(chromosome, 'kp_t');
    params.kd_t = val_by_id(chromosome, 'kd_t');
    params.kp_s = val_by_id(chromosome, 'kp_s');
    params.kd_s = val_by_id(chromosome, 'kd_s');
    params.sw_target = val_by_id(chromosome, 'sw_target');
    params.t_target = val_by_id(chromosome, 't_target');
    params.alfa = val_by_id(chromosome, 'alfa');
    
    % Evaluate it here
    q = [0; 0; 0];
    dq = [0.1; 0; 0];
    steps = 5;
    dist = optimize_dist(q, dq, params, steps, 'hyp_tan');
    val = - dist;
    fprintf("kp_t: %d, kd_t: %d, kp_s: %d, kd_s: %d, sw_target: %g, t_target: %g, alpha: %g, dist: %g \n", chromosome, dist);
end

function val = val_by_id(chromosome, id)
    global HPARAMS
    val = chromosome(strcmp(HPARAMS(:, 1), id));
end