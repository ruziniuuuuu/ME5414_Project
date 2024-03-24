function visualize_results_constraints(results)
% Extract the number of constraints, and metrics from the results table
m_values = results.NumConstraints;
simplex_iterations = results.SimplexIterations;
barrier_iterations = results.BarrierIterations;
simplex_time = results.SimplexTime;
barrier_time = results.BarrierTime;

% Create a figure window
figure('Name', 'Comparison of Simplex and Barrier Methods (Generated Problems)');

% Plot the number of iterations
subplot(2, 2, 1);
plot(m_values, simplex_iterations, 'o-', 'LineWidth', 1.5);
hold on;
plot(m_values, barrier_iterations, 'o-', 'LineWidth', 1.5);
xlabel('Number of Constraints');
ylabel('Number of Iterations');
legend('Simplex', 'Barrier');
title('Comparison of Number of Iterations');
grid on;

% Plot the computational time
subplot(2, 2, 2);
plot(m_values, simplex_time, 'o-', 'LineWidth', 1.5);
hold on;
plot(m_values, barrier_time, 'o-', 'LineWidth', 1.5);
xlabel('Number of Constraints');
ylabel('Time (s)');
legend('Simplex', 'Barrier');
title('Comparison of Computational Time');
grid on;

% Calculate and plot the ratio of iterations (Barrier / Simplex)
iteration_ratio = barrier_iterations ./ simplex_iterations;
subplot(2, 2, 3);
plot(m_values, iteration_ratio, 'o-', 'LineWidth', 1.5);
xlabel('Number of Constraints');
ylabel('Ratio of Iterations (Barrier / Simplex)');
title('Ratio of Iterations (Barrier / Simplex)');
grid on;

% Calculate and plot the ratio of computational time (Barrier / Simplex)
time_ratio = barrier_time ./ simplex_time;
subplot(2, 2, 4);
plot(m_values, time_ratio, 'o-', 'LineWidth', 1.5);
xlabel('Number of Constraints');
ylabel('Ratio of Computational Time (Barrier / Simplex)');
title('Ratio of Computational Time (Barrier / Simplex)');
grid on;
end