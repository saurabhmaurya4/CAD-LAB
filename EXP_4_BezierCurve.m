
function bezierCurve(controlPoints, uValues)
    % Function to plot a Bezier curve for given control points and parameter values
    % controlPoints: n x 2 matrix of (x, y) control points
    % uValues: vector of parameter values in [0, 1]

    n = size(controlPoints, 1) - 1;  % Degree of the Bezier curve
    u = linspace(0, 1, 100);         % Fine-grained for smooth plotting
    
    % Initialize curve points
    curveX = zeros(size(u));
    curveY = zeros(size(u));

    % Compute Bernstein basis and curve points
    for i = 0:n
        B = nchoosek(n, i) .* (u.^i) .* (1-u).^(n-i);
        curveX = curveX + B * controlPoints(i+1, 1);
        curveY = curveY + B * controlPoints(i+1, 2);
    end

    % Plot the Bezier curve
    plot(curveX, curveY, 'b-', 'LineWidth', 2);
    hold on;
    
    % Plot control points and control polygon
    plot(controlPoints(:,1), controlPoints(:,2), 'ro--', 'LineWidth', 1.5, ...
        'MarkerSize', 8, 'MarkerFaceColor', 'r');
    
    % Plot evaluated points at specified uValues
    for k = 1:length(uValues)
        u0 = uValues(k);
        Px = 0; Py = 0;
        for i = 0:n
            B = nchoosek(n, i) * (u0^i) * (1-u0)^(n-i);
            Px = Px + B * controlPoints(i+1, 1);
            Py = Py + B * controlPoints(i+1, 2);
        end
        plot(Px, Py, 'ks', 'MarkerSize', 7, 'MarkerFaceColor', 'y'); % Plot point
        text(Px+0.5, Py, sprintf('u=%.1f', u0), 'FontSize', 8);
    end
    
    axis equal;
    grid on;
    xlabel('X-axis');
    ylabel('Y-axis');
    title('Bezier Curve with Control Polygon and Evaluated Points');
    hold off;
end

% Define control points
controlPoints = [35, 30;
                 25, 0;
                 15, 25;
                 5, 10];

% Parameter values to evaluate
uValues = [0, 0.2, 0.4, 0.6, 0.8, 1];

% Call the Bezier curve plotting function
figure;
bezierCurve(controlPoints, uValues);

%PROBLEM-2
% Define control points
controlPoints = [2, 0;
                 4, 3;
                 5, 2;
                 4, -2;
                 5, -3;
                 6, -2];

% Parameter values to evaluate
uValues = linspace(0,1,10);

% Call the Bezier curve plotting function
figure;
bezierCurve(controlPoints, uValues);
