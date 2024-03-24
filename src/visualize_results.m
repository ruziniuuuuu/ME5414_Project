function visualize_results(results)
    % Extract the problem names and metrics from the results table
    problems = results.Problem;
    simplex_iterations = results.SimplexIterations;
    barrier_iterations = results.BarrierIterations;
    simplex_time = results.SimplexTime;
    barrier_time = results.BarrierTime;
    
    % Create a figure window
    figure('Name', 'Comparison of Simplex and Barrier Methods');
    
    % Plot the number of iterations
    subplot(2, 2, 1);
    bar(categorical(problems), [simplex_iterations, barrier_iterations]);
    xlabel('Problem');
    ylabel('Number of Iterations');
    legend('Simplex', 'Barrier');
    title('Comparison of Number of Iterations');
    
    % Plot the computational time
    subplot(2, 2, 2);
    bar(categorical(problems), [simplex_time, barrier_time]);
    xlabel('Problem');
    ylabel('Time (s)');
    legend('Simplex', 'Barrier');
    title('Comparison of Computational Time');
    
    % Calculate and plot the ratio of iterations (Barrier / Simplex)
    iteration_ratio = barrier_iterations ./ simplex_iterations;
    subplot(2, 2, 3);
    bar(categorical(problems), iteration_ratio);
    xlabel('Problem');
    ylabel('Ratio of Iterations (Barrier / Simplex)');
    title('Ratio of Iterations (Barrier / Simplex)');
    
    % Calculate and plot the ratio of computational time (Barrier / Simplex)
    time_ratio = barrier_time ./ simplex_time;
    subplot(2, 2, 4);
    bar(categorical(problems), time_ratio);
    xlabel('Problem');
    ylabel('Ratio of Computational Time (Barrier / Simplex)');
    title('Ratio of Computational Time (Barrier / Simplex)');
end