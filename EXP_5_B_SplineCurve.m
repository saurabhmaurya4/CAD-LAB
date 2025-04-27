% Define control points (n+1 points)
P = [0 0;    % P0
     1 2;    % P1
     3 5;    % P2
     6 1];   % P3

% Degree of the B-Spline (p)
p = 2;

% Define clamped knot vector (m = n + p + 1 = 4 + 2 + 1 = 7 knots)
knots = [0, 0, 0, 1, 2, 2, 2];  % Clamped at start/end

% Evaluate curve at parameter t
t_resolution = 100;
t_values = linspace(knots(p+1), knots(end-p), t_resolution); % Valid t range

% Compute B-Spline basis functions and curve
curve = zeros(length(t_values), 2);
for t_idx = 1:length(t_values)
    t = t_values(t_idx);
    sum_weights = zeros(1, 2);
    for i = 0:size(P, 1)-1
        basis = BSpineBasis(i, p, t, knots);
        sum_weights = sum_weights + basis * P(i+1, :);
    end
    curve(t_idx, :) = sum_weights;
end

% Plot the curve and control polygon
figure;
hold on;
plot(curve(:, 1), curve(:, 2), 'b-', 'LineWidth', 2);  % B-Spline curve
plot(P(:, 1), P(:, 2), 'ro--', 'MarkerSize', 8, 'LineWidth', 1);  % Control polygon
grid on;
axis equal;
title('Quadratic B-Spline Curve');
xlabel('X-axis');
ylabel('Y-axis');
legend('B-Spline Curve', 'Control Points', 'Location', 'best');

% B-Spline basis function (Cox-de Boor recursion)
function N = BSpineBasis(i, p, t, knots)
    if p == 0
        N = (t >= knots(i+1)) && (t < knots(i+2));
    else
        term1 = 0;
        term2 = 0;
        denom1 = knots(i+p+1) - knots(i+1);
        denom2 = knots(i+p+2) - knots(i+2);
        
        if denom1 ~= 0
            term1 = ((t - knots(i+1)) / denom1) * BSpineBasis(i, p-1, t, knots);
        end
        if denom2 ~= 0
            term2 = ((knots(i+p+2) - t) / denom2) * BSpineBasis(i+1, p-1, t, knots);
        end
        N = term1 + term2;
    end
end