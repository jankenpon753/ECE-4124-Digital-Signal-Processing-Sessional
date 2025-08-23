% Parameters
cycles = 2;                % Number of cycles
samples_per_cycle = 50;    % Increased sample points per cycle for smoothness
N = cycles * samples_per_cycle;
n = 0:N-1;

% Define signals
theta = 2*pi*n/samples_per_cycle;
x = sin(theta);
h = cos(theta);

% Linear Convolution
lin_conv = conv(x, h);

% Circular Convolution (length = N)
circ_conv = cconv(x, h, N);

% Cross Correlation
cross_corr = xcorr(x, h);

% Auto Correlation of x(n)
auto_corr = xcorr(x);

% Plotting
figure;

subplot(3,2,1);
stem(n, x, 'filled');
title('Original Signal x(n) = sin(n)');
xlabel('n'); ylabel('Amplitude');

subplot(3,2,2);
stem(n, h, 'filled');
title('Original Signal h(n) = cos(n)');
xlabel('n'); ylabel('Amplitude');

subplot(3,2,3);
stem(0:length(lin_conv)-1, lin_conv, 'filled');
title('Linear Convolution');
xlabel('n'); ylabel('Amplitude');

subplot(3,2,4);
stem(0:length(circ_conv)-1, circ_conv, 'filled');
title('Circular Convolution');
xlabel('n'); ylabel('Amplitude');

subplot(3,2,5);
stem(-(length(x)-1):(length(h)-1), cross_corr, 'filled');
title('Cross Correlation');
xlabel('Lag'); ylabel('Amplitude');

subplot(3,2,6);
stem(-(length(x)-1):(length(x)-1), auto_corr, 'filled');
title('Auto Correlation of x(n)');
xlabel('Lag'); ylabel('Amplitude');

sgtitle('Signal Operations: Sine and Cosine Signals');