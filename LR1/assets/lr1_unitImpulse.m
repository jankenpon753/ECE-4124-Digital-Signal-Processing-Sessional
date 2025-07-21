% Length of impulse response
N = 11; % Total number of samples
% Generate unit impulse using impz
x = impz(1, 1, N); % delta[n] from n = 0 to N-1
% Time index
n = 0:N-1;
% Plot the impulse
stem(n, x, 'filled', 'LineWidth', 2);
grid on;
xlabel('n (discrete time)');
ylabel('Amplitude');
title('Discrete Unit Impulse Signal (delta[n])');
ylim([-0.2 1.2]);