% RUN_EXPERIMENTS Script to run experiments comparing Simplex and Barrier methods.

% Clear the workspace and command window
clear;
clc;

% Define the test problems
problems = {'AFIRO', 'SC50A', 'ADLITTLE', 'SHARE1B'};

% Define the number of variables (n) and constraints (m) for each problem
n = [28, 49, 138, 253];
m = [52, 81, 64, 183];

% Set the solver options
options = optimoptions('linprog');
options.Display = 'iter';

% Initialize arrays to store the results
num_iterations_simplex = zeros(length(problems), 1);
num_iterations_barrier = zeros(length(problems), 1);
time_simplex = zeros(length(problems), 1);
time_barrier = zeros(length(problems), 1);

% Run the experiments for each test problem
for i = 1:length(problems)
    % Load the test problem data
    [c, A, b, Aeq, beq, lb, ub] = load_problem_data(problems{i});
    
    % Solve using the Simplex method
    tic;
    [~, ~, ~, output_simplex] = simplex_solver(c, A, b, Aeq, beq, lb, ub, options);
    time_simplex(i) = toc;
    num_iterations_simplex(i) = output_simplex.iterations;
    
    % Solve using the Barrier method
    tic;
    [~, ~, ~, output_barrier] = barrier_solver(c, A, b, Aeq, beq, lb, ub, options);
    time_barrier(i) = toc;
    num_iterations_barrier(i) = output_barrier.iterations;
end

% Display the results
disp('Experimental Results:');
disp('--------------------');
disp('Problem   | Simplex Iterations | Barrier Iterations | Simplex Time (s) | Barrier Time (s)');
disp('----------|-------------------|-------------------|-----------------|----------------');
for i = 1:length(problems)
    fprintf('%-10s| %-18d| %-18d| %-16.2f| %-16.2f\n', problems{i}, num_iterations_simplex(i), ...
        num_iterations_barrier(i), time_simplex(i), time_barrier(i));
end

% Plot the results
figure;
subplot(1, 2, 1);
bar([num_iterations_simplex, num_iterations_barrier]);
xlabel('Problem');
ylabel('Number of Iterations');
legend('Simplex', 'Barrier');
title('Comparison of Number of Iterations');

subplot(1, 2, 2);
bar([time_simplex, time_barrier]);
xlabel('Problem');
ylabel('Time (s)');
legend('Simplex', 'Barrier');
title('Comparison of Computational Time');