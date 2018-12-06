addpath('./funct');

global HPARAMS E
HPARAMS = [
    {'kp_t', 200, 400};
    {'kd_t', 10, 40};
    {'kp_s', 200, 400};
    {'kd_s', 10, 40};
    {'sw_target', pi/10, pi/6};
    {'t_target', pi/10, pi/9};
    {'alfa', 3, 15}
];



% Run evolutive algorithm
min_values = cell2mat(HPARAMS(:, 2));
max_values = cell2mat(HPARAMS(:, 3));
ga_options = struct('Generations', 500, 'PopulationSize', 50);
% optimals = ga(@fitness, size(HPARAMS, 1), [], [], [], [], min_values, max_values);
IntCon = [1 2 3 4];
optimals = ga(@fitness, size(HPARAMS, 1), [], [], [], [], min_values, max_values, [], IntCon, ga_options);

energy = sum(E);
fprintf('Optimal Parameters:\n  kp_t: %3d, kd_t: %3d, kp_s: %3d, kd_s: %3d, sw_target: %.5g, t_target: %.5g, alpha: %.5g \n', optimals);


function val = fitness(chromosome)
    global E
    
    params.kp_t = val_by_id(chromosome, 'kp_t');
    params.kd_t = val_by_id(chromosome, 'kd_t');
    params.kp_s = val_by_id(chromosome, 'kp_s');
    params.kd_s = val_by_id(chromosome, 'kd_s');
    params.sw_target = val_by_id(chromosome, 'sw_target');
    params.t_target = val_by_id(chromosome, 't_target');
    params.alfa = val_by_id(chromosome, 'alfa');
    
    E = zeros(2, 1);
    
    % Evaluate it here
    q = [0; 0; 0];
    dq = [0.1; 0; 0];
    steps = 5;
    [dist, time] = optimize_dist(q, dq, params, steps, 'hyp_tan');
    energy = sum(E);
    val = - dist;
    fprintf('kp_t: %3d, kd_t: %3d, kp_s: %3d, kd_s: %3d, sw_target: %3.4g, t_target: %3.4g, alpha: %3.4g, dist: %3.4g, energy: %.2g\n', chromosome, dist, energy);
end

function val = val_by_id(chromosome, id)
    global HPARAMS
    val = chromosome(strcmp(HPARAMS(:, 1), id));
end