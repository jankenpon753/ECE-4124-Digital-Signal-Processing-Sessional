% Define discrete time index
n = -5:5; % From -5 to 5
% Generate discrete unit step signal
x = double(n >= 0); % u[n] = 1 for n >= 0, 0 otherwise
% Plot the step signal
stem(n, x, 'filled', 'LineWidth', 2);
grid on;
xlabel('n (discrete time)');
ylabel('Amplitude');
title('Discrete Unit Step Signal u[n]');
ylim([-0.2 1.2]);