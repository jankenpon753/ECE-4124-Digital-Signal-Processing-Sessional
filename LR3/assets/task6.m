% Parameters
cycles = 4;                % Number of cycles
samples_per_cycle = 50;    % Increased sample points per cycle for smoothness
N = cycles * samples_per_cycle;
n = 0:N-1;

% Define signals
theta = 2*pi*n/samples_per_cycle;
x = sin(theta);
h = cos(theta);

% x(-n+4)
n2 = 0:N-1;
idx_x = -n2 + 4 + 1; % +1 for MATLAB indexing
x_shifted = zeros(1, N);
for i = 1:N
    if idx_x(i) >= 1 && idx_x(i) <= N
        x_shifted(i) = x(idx_x(i));
    else
        % Pad with wrapped values from x
        pad_idx = mod(idx_x(i)-1, N) + 1;
        x_shifted(i) = x(pad_idx);
    end
end

% h(-n-3)
idx_h = -n2 - 3 + 1;
h_shifted = zeros(1, N);
for i = 1:N
    if idx_h(i) >= 1 && idx_h(i) <= N
        h_shifted(i) = h(idx_h(i));
    else
        pad_idx = mod(idx_h(i)-1, N) + 1;
        h_shifted(i) = h(pad_idx);
    end
end

% Now x_shifted and h_shifted are the same length for all operations

% Linear convolution
lin_conv = conv(x_shifted, h_shifted);

% Circular convolution (length = N)
Nc = N;
circ_conv = cconv(x_shifted, h_shifted, Nc);

% Cross correlation
cross_corr = xcorr(x_shifted, h_shifted);

% Auto correlation on x(-n+4)
auto_corr = xcorr(x_shifted);

% Plotting
figure;

subplot(3,2,1);
stem(n2, x_shifted, 'filled');
title('x(-n+4) [sin]');
xlabel('n'); ylabel('Amplitude');

subplot(3,2,2);
stem(n2, h_shifted, 'filled');
title('h(-n-3) [cos]');
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
stem(-(length(x_shifted)-1):(length(h_shifted)-1), cross_corr, 'filled');
title('Cross Correlation');
xlabel('Lag'); ylabel('Amplitude');

subplot(3,2,6);
stem(-(length(x_shifted)-1):(length(x_shifted)-1), auto_corr, 'filled');
title('Auto Correlation of x(-n+4)');
xlabel('Lag'); ylabel('Amplitude');

sgtitle('Signal Operations: Transformed Sine and Cosine');