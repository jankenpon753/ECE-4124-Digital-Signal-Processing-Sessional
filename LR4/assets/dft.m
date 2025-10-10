clc;
clear;
close all;

% Signals
x = [-2 4 2 1 5];
h = [5 -4 2 1 0];

% Length of convolution
N = length(x) + length(h) - 1;

% Zero-pad both signals to length N
x_pad = [x, zeros(1, N-length(x))];
h_pad = [h, zeros(1, N-length(h))];

% DFT of both signals
X = fft(x_pad);
H = fft(h_pad);

% Multiply in frequency domain
Y = X .* H;

% IDFT to get convolution result
y_dft = ifft(Y);

% Direct convolution (for verification)
y_direct = conv(x, h);

%% Display results
disp('Convolution using DFT:');
disp(y_dft);
disp('Direct convolution:');
disp(y_direct);

%% Visualization
n_x = 0:length(x)-1;
n_h = 0:length(h)-1;
n_y = 0:N-1;

figure;

subplot(4,1,1);
stem(n_x, x, 'r', 'filled', 'LineWidth', 1.5);
title('Input Signal1 x(n)');
xlabel('n'); ylabel('Amplitude'); grid on;

subplot(4,1,2);
stem(n_h, h, 'b', 'filled', 'LineWidth', 1.5);
title('Input Signal2 h(n)');
xlabel('n'); ylabel('Amplitude'); grid on;

subplot(4,1,3);
stem(n_y, real(y_dft), 'g', 'filled', 'LineWidth', 1.5);
title('Convolution y(n) using DFT');
xlabel('n'); ylabel('Amplitude'); grid on;

subplot(4,1,4);
stem(n_y, y_direct, 'm', 'filled', 'LineWidth', 1.5);
title('Convolution y(n) using Direct conv()');
xlabel('n'); ylabel('Amplitude'); grid on;
