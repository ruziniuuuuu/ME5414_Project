%% RUN_EXPERIMENTS Script to run experiments comparing Simplex and Barrier methods.

clc; clear;

% Define the test problems
problems = {'AFIRO', 'SC50A', 'ADLITTLE', 'SHARE1B'};
n = [28, 49, 138, 253]; % Number of variables
m = [52, 81, 64, 183]; % Number of constraints

% Check if the number of problems matches the lengths of n and m
assert(length(problems) == length(n) && length(problems) == length(m), ...
    'Number of problems does not match the lengths of n and m.');

% Set the solver options
options = optimoptions('linprog', 'Display', 'iter', ...
    'OptimalityTolerance', 1e-6);

% Run experiments for the test problems
results = run_experiments(problems, n, m, options);

% Display the results
disp(results);

% Visualize the results
visualize_results(results);

%% Generate problems with fixed m and varying n
fixed_m = 50;
n_values = [50, 100, 200, 500, 1000];
problems_fixed_m = generate_problems(fixed_m, n_values);

% Run experiments for problems with fixed m and varying n
results_fixed_m = run_experiments_struct(problems_fixed_m, options);

% Display the results
disp(results_fixed_m);

% Visualize the results (varying variables)
visualize_results_variables(results_fixed_m);

%% Generate problems with fixed n and varying m
fixed_n = 100;
m_values = [30, 50, 100, 200, 500];
problems_fixed_n = generate_problems(m_values, fixed_n);

% Run experiments for problems with fixed n and varying m
results_fixed_n = run_experiments_struct(problems_fixed_n, options);

% Display the results
disp(results_fixed_n);

% Visualize the results (varying constraints)
visualize_results_constraints(results_fixed_n);

%% Define the range of tolerance values to test
tolerance_values = [1e-2, 1e-4, 1e-6, 1e-8, 1e-10];

results_varying_tolerance = run_tolerance_experiments(problems, n, m, options, tolerance_values);

% Display the results
disp(results_varying_tolerance);

% Visualize the results (varying tolerance)
visualize_tolerance_results(results_varying_tolerance);