% Parameters
n = -10:10;       % Discrete time index
A = 1;            % Amplitude
f = 0.05;         % Frequency (cycles/sample)
phi = 0;          % Phase

% Original sinusoidal signal
x = A * sin(2*pi*f*n + phi);

% Time shifting: x(n-3)
x_shift = A * sin(2*pi*f*(n-3) + phi);

% Folding: x(-n)
x_fold = A * sin(2*pi*f*(-n) + phi);

% Scaling: x(3n)
x_scale = A * sin(2*pi*f*(3*n) + phi);

% Plotting
figure;
subplot(2,2,1);
stem(n, x, 'filled');
title('Original: x[n]');
xlabel('n'); ylabel('x[n]');

subplot(2,2,2);
stem(n, x_shift, 'filled');
title('Time Shifted: x[n-3]');
xlabel('n'); ylabel('x[n-3]');

subplot(2,2,3);
stem(n, x_fold, 'filled');
title('Folded: x[-n]');
xlabel('n'); ylabel('x[-n]');

subplot(2,2,4);
stem(3*n, x_scale, 'filled');
title('Scaled: x[3n]');
xlabel('3n'); ylabel('x[3n]');