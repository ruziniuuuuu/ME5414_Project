function results = run_experiments_struct(problems, options)
    % Initialize a table to store the results
    n_values = [problems.n];
    m_values = [problems.m];
    results = table(n_values', m_values', 'VariableNames', {'NumVariables', 'NumConstraints'});
    results.SimplexIterations = zeros(length(problems), 1);
    results.BarrierIterations = zeros(length(problems), 1);
    results.SimplexTime = zeros(length(problems), 1);
    results.BarrierTime = zeros(length(problems), 1);

    % Run the experiments for each problem
    for i = 1:length(problems)
        % Extract problem data
        c = problems(i).c;
        A = problems(i).A;
        b = problems(i).b;
        Aeq = [];
        beq = [];
        lb = problems(i).lb;
        ub = problems(i).ub;

        % Solve using the Simplex method
        tic;
        [~, ~, exitflag_simplex, output_simplex] = simplex_solver(c, A, b, Aeq, beq, lb, ub, options);
        results.SimplexTime(i) = toc;
        results.SimplexIterations(i) = output_simplex.iterations;

        % Solve using the Barrier method
        tic;
        [~, ~, exitflag_barrier, output_barrier] = barrier_solver(c, A, b, Aeq, beq, lb, ub, options);
        results.BarrierTime(i) = toc;
        results.BarrierIterations(i) = output_barrier.iterations;

        % Check the exit flags
        if exitflag_simplex <= 0 || exitflag_barrier <= 0
            warning('Solver did not converge for problem %d.', i);
        end
    end
end