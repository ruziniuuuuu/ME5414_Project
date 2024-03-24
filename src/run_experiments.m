function results = run_experiments(problems, n, m, options)
    % Initialize a table to store the results
    results = table(problems', n', m', 'VariableNames', {'Problem', 'NumVariables', 'NumConstraints'});
    results.SimplexIterations = zeros(length(problems), 1);
    results.BarrierIterations = zeros(length(problems), 1);
    results.SimplexTime = zeros(length(problems), 1);
    results.BarrierTime = zeros(length(problems), 1);

    % Run the experiments for each test problem
    for i = 1:length(problems)
        % Load the test problem data
        [c, A, b, Aeq, beq, lb, ub] = load_problem_data(problems{i});

        % Solve using the Simplex method
        tic;
        [~, fval_simplex, exitflag_simplex, output_simplex] = simplex_solver(c, A, b, Aeq, beq, lb, ub, options);
        results.SimplexTime(i) = toc;
        results.SimplexIterations(i) = output_simplex.iterations;

        % Solve using the Barrier method
        tic;
        [~, fval_barrier, exitflag_barrier, output_barrier] = barrier_solver(c, A, b, Aeq, beq, lb, ub, options);
        results.BarrierTime(i) = toc;
        results.BarrierIterations(i) = output_barrier.iterations;

        % Compare the objective function values
        if abs(fval_simplex - fval_barrier) > 1e-6
            warning('Objective function values do not match for problem %s.', problems{i});
        end

        % Check the exit flags
        if exitflag_simplex <= 0 || exitflag_barrier <= 0
            warning('Solver did not converge for problem %s.', problems{i});
        end
    end
end