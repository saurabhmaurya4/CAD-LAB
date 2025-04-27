% Define endpoints (x1, y1) to (x2, y2)
x1 = 2; y1 = 3;
x2 = 9; y2 = 8;

% Calculate Δx and Δy
dx = x2 - x1;
dy = y2 - y1;

% Determine the number of steps
steps = max(abs(dx), abs(dy));

% Compute increments
x_inc = dx / steps;
y_inc = dy / steps;

% Initialize starting point
x = x1;
y = y1;

% Store coordinates for plotting
X = [x];
Y = [y];

% Generate points iteratively
for i = 1:steps
    x = x + x_inc;
    y = y + y_inc;
    X = [X, round(x)];   % Round to nearest integer
    Y = [Y, round(y)];
end

% Plot the line and grid
figure;
plot(X, Y, 'ro-', 'LineWidth', 1.5, 'MarkerSize', 8);
grid on;
axis equal;
title('DDA Algorithm');
xlabel('X-axis');
ylabel('Y-axis');
xlim([min(X)-1, max(X)+1]);
ylim([min(Y)-1, max(Y)+1]);