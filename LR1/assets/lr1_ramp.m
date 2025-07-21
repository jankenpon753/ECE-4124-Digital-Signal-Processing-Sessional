% Define discrete time index
n = -5:10; % From -5 to 10 (includes negative range)
% Generate discrete unit ramp signal
x = max(0, n); % x[n] = n for n >= 0, 0 otherwise
% Plot the ramp signal
stem(n, x, 'filled', 'LineWidth', 2);
grid on;
xlabel('n (discrete time)');
ylabel('Amplitude');
title('Discrete Unit Ramp Signal r[n]');