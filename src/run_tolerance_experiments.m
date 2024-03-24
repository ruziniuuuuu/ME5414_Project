function results = run_tolerance_experiments(problems, n, m, options, tolerance_values)
    % Initialize a table to store the results
    num_problems = length(problems);
    num_tolerances = length(tolerance_values);
    total_rows = num_problems * num_tolerances;
    
    results = table('Size', [total_rows, 8], ...
        'VariableTypes', {'cell', 'double', 'double', 'double', 'double', 'double', 'double', 'double'}, ...
        'VariableNames', {'Problem', 'NumVariables', 'NumConstraints', 'Tolerance', 'SimplexIterations', 'BarrierIterations', 'SimplexTime', 'BarrierTime'});
    
    row_index = 1;
    
    % Run the experiments for each test problem and tolerance value
    for i = 1:num_problems
        % Load the test problem data
        [c, A, b, Aeq, beq, lb, ub] = load_problem_data(problems{i});

        for j = 1:num_tolerances
            % Set the OptimalityTolerance in the options
            options.OptimalityTolerance = tolerance_values(j);

            % Solve using the Simplex method
            tic;
            [~, ~, ~, output_simplex] = simplex_solver(c, A, b, Aeq, beq, lb, ub, options);
            simplex_time = toc;
            simplex_iterations = output_simplex.iterations;

            % Solve using the Barrier method
            tic;
            [~, ~, ~, output_barrier] = barrier_solver(c, A, b, Aeq, beq, lb, ub, options);
            barrier_time = toc;
            barrier_iterations = output_barrier.iterations;
            
            % Store the results in the table
            results.Problem{row_index} = problems{i};
            results.NumVariables(row_index) = n(i);
            results.NumConstraints(row_index) = m(i);
            results.Tolerance(row_index) = tolerance_values(j);
            results.SimplexIterations(row_index) = simplex_iterations;
            results.BarrierIterations(row_index) = barrier_iterations;
            results.SimplexTime(row_index) = simplex_time;
            results.BarrierTime(row_index) = barrier_time;
            
            row_index = row_index + 1;
        end
    end
end