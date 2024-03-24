function [c, A, b, Aeq, beq, lb, ub] = load_problem_data(problem_name)
    % Load problem data from MPS file
    mps_file = fullfile('data', [problem_name, '.mps']);
    
    % Read MPS file using MATLAB's built-in mpsread function
    prob = mpsread(mps_file);
    
    % Extract problem data from the prob structure
    c = prob.f;
    A = prob.Aineq;
    b = prob.bineq;
    Aeq = prob.Aeq;
    beq = prob.beq;
    lb = prob.lb;
    ub = prob.ub;
end