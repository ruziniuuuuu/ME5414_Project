function [x, fval, exitflag, output] = barrier_solver(c, A, b, Aeq, beq, lb, ub, options)
    % BARRIER_SOLVER Solves a linear programming problem using the Barrier method.
    %   [x, fval, exitflag, output] = barrier_solver(c, A, b, Aeq, beq, lb, ub, options)
    %
    %   Inputs:
    %       c: The coefficients of the linear objective function.
    %       A: The inequality constraint matrix.
    %       b: The inequality constraint vector.
    %       Aeq: The equality constraint matrix.
    %       beq: The equality constraint vector.
    %       lb: The lower bound vector.
    %       ub: The upper bound vector.
    %       options: A structure containing solver options.
    %
    %   Outputs:
    %       x: The solution vector.
    %       fval: The objective function value at the solution.
    %       exitflag: The exit condition of the solver.
    %       output: A structure containing solver output information.
    
    % Set default options if not provided
    if nargin < 8
        options = optimoptions('linprog');
    end
    
    % Set the solver to 'interior-point'
    options.Algorithm = 'interior-point';
    
    % Solve the linear programming problem using the Barrier method
    [x, fval, exitflag, output] = linprog(c, A, b, Aeq, beq, lb, ub, options);
    
    % Display the solution
    disp('Barrier Method Solution:');
    disp(['Objective Function Value: ', num2str(fval)]);
    disp(['Solution Vector: ', num2str(x')]);
    
    end