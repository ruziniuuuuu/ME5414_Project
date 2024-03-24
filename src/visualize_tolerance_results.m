function visualize_tolerance_results(results)
    tolerance_values = results.Tolerance;

    % Plot the number of iterations vs. tolerance
    subplot(2, 1, 1);
    semilogx(tolerance_values, results.SimplexIterations, 'o-', 'LineWidth', 1.5);
    hold on;
    semilogx(tolerance_values, results.BarrierIterations, 'o-', 'LineWidth', 1.5);
    xlabel('OptimalityTolerance');
    ylabel('Number of Iterations');
    legend('Simplex', 'Barrier');
    title('Sensitivity of Iterations to OptimalityTolerance');
    grid on;

    % Plot the computational time vs. tolerance
    subplot(2, 1, 2);
    semilogx(tolerance_values, results.SimplexTime, 'o-', 'LineWidth', 1.5);
    hold on;
    semilogx(tolerance_values, results.BarrierTime, 'o-', 'LineWidth', 1.5);
    xlabel('OptimalityTolerance');
    ylabel('Time (s)');
    legend('Simplex', 'Barrier');
    title('Sensitivity of Computational Time to OptimalityTolerance');
    grid on;
end