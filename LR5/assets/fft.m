clc;
clear;
close all;

% Input signal definition
x = [3 0 1 -2];
N = length(x);
n = 0:N-1;  % sample indices

% FFT computation
X = fft(x);

% Inverse FFT to reconstruct the original sequence
x_reconstructed = ifft(X);

% Display results in the console
disp('Computed FFT:');
disp(X);
disp('Recovered sequence via IFFT:');
disp(x_reconstructed);

% Create a single figure with 2x2 subplots
figure;

% Plot 1: Time-domain input
subplot(2,2,1);
stem(n, x, 'filled', 'LineWidth', 1.5);
title('Discrete-time input signal');
xlabel('n (sample index)');
ylabel('Amplitude');
grid on;
set(gca, 'FontSize', 12);

% Plot 2: Magnitude spectrum
subplot(2,2,2);
stem(n, abs(X), 'filled', 'LineWidth', 1.5);
title('FFT magnitude');
xlabel('k (frequency bin)');
ylabel('Magnitude |X(k)|');
grid on;
set(gca, 'FontSize', 12);

% Plot 3: Phase spectrum
subplot(2,2,3);
stem(n, angle(X), 'filled', 'LineWidth', 1.5);
title('FFT phase');
xlabel('k (frequency bin)');
ylabel('Phase (radians)');
grid on;
set(gca, 'FontSize', 12);

% Plot 4: Reconstructed time-domain signal
subplot(2,2,4);
stem(n, real(x_reconstructed), 'filled', 'LineWidth', 1.5);
title('Signal reconstructed from IFFT');
xlabel('n (sample index)');
ylabel('Amplitude');
grid on;
set(gca, 'FontSize', 12);

% Optional overall title (requires MATLAB R2018b or later)
if exist('sgtitle','builtin')
    sgtitle('FFT Analysis');
end