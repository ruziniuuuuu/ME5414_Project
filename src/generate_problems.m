function problems = generate_problems(m_values, n_values)
    if isscalar(n_values)
        n_values = repmat(n_values, size(m_values));
    elseif isscalar(m_values)
        m_values = repmat(m_values, size(n_values));
    end

    assert(length(m_values) == length(n_values), 'Length of m_values and n_values must be the same.');

    problems = struct('n', {}, 'm', {}, 'c', {}, 'A', {}, 'b', {}, 'lb', {}, 'ub', {});

    for i = 1:length(m_values)
        m = m_values(i);
        n = n_values(i);

        % Generate random lower and upper bounds
        lb = rand(n, 1) * 10;  % Random lower bounds between 0 and 10
        ub = lb + rand(n, 1) * 10;  % Random upper bounds no more than 10 units above lb

        % Choose a random solution x_star within bounds
        x_star = rand(n, 1) .* (ub - lb) + lb;

        % Define c randomly
        c = rand(n, 1) - 0.5; % Centering around 0 to have a mix of positive and negative values

        % Construct A and b such that Ax_star = b, ensuring x_star is a feasible solution
        A = rand(m, n) - 0.5; % Centering around 0 to increase the chance of a feasible and bounded solution
        b = A * x_star;

        % Check the solvability of the problem using linprog
        options = optimoptions('linprog', 'Display', 'off');
        [~, ~, exitflag] = linprog(c, [], [], A, b, lb, ub, options);

        % If exitflag is not 1, then the problem might not be feasible or bounded.
        % In that case, we attempt a new generation.
        assert(exitflag == 1, 'Generated LP problem is not solvable. Adjust the generation parameters.');

        % Store the problem data
        problems(i).n = n;
        problems(i).m = m;
        problems(i).c = c;
        problems(i).A = A;
        problems(i).b = b;
        problems(i).lb = lb;
        problems(i).ub = ub;
    end
end
