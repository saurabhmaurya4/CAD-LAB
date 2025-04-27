function hermiteSpline(P0, P1, T0, T1)
    % Function to plot a Hermite cubic spline between points P0 and P1
    % with tangent vectors T0 and T1

    u = linspace(0, 1, 100);
    
    % Hermite basis functions
    h1 = 2*u.^3 - 3*u.^2 + 1;
    h2 = -2*u.^3 + 3*u.^2;
    h3 = u.^3 - 2*u.^2 + u;
    h4 = u.^3 - u.^2;
    
    % Calculate the spline points
    x = h1 * P0(1) + h2 * P1(1) + h3 * T0(1) + h4 * T1(1);
    y = h1 * P0(2) + h2 * P1(2) + h3 * T0(2) + h4 * T1(2);
    
    % Plotting the curve
    plot(x, y, 'b-', 'LineWidth', 2);
    hold on;
    plot(P0(1), P0(2), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
    plot(P1(1), P1(2), 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g');
    
    % Plot tangents for visualization
    quiver(P0(1), P0(2), T0(1), T0(2), 0, 'r', 'LineWidth', 1.5, 'MaxHeadSize', 0.5);
    quiver(P1(1), P1(2), -T1(1), -T1(2), 0, 'g', 'LineWidth', 1.5, 'MaxHeadSize', 0.5);
    
    axis equal;
    grid on;
    xlabel('X-axis');
    ylabel('Y-axis');
    title('Hermite Cubic Spline');
    hold off;
end

% Define points
P0 = [16, 0];
P1 = [3, 1];
P2 = [14, 8];

% Compute tangent vectors
T0 = P2 - P0;
T1 = P1 - P2;

% Call the Hermite spline function
figure;
hermiteSpline(P0, P1, T0, T1);

% Define points
P0 = [1, 2];
P1 = [7, 1];
P2 = [-2, 1];
P3 = [9, -2];

% Compute tangent vectors
T0 = P2 - P0;
T1 = P1 - P3;

% Call the Hermite spline function
figure;
hermiteSpline(P0, P1, T0, T1);