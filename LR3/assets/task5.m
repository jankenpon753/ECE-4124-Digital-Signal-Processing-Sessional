% Parameters
cycles = 4;                % Number of cycles
samples_per_cycle = 50;    % Increased sample points per cycle for smoothness
N = cycles * samples_per_cycle;
n = 0:N-1;

% Define signals
theta = 2*pi*n/samples_per_cycle;
x = sin(theta);
h = cos(theta);


% x(3n-2)
n1 = 1:ceil((N+2)/3);
x_3n_2_full = zeros(1, length(n1));
for i = 1:length(n1)
    idx = 3*n1(i)-2;
    if idx >= 1 && idx <= N
        x_3n_2_full(i) = x(idx);
    end
end
valid_idx = find(x_3n_2_full ~= 0 | n1 == 1);
x_3n_2 = x_3n_2_full(valid_idx);
n1_valid = n1(valid_idx);

% -h(n+2)
h_n_plus_2 = zeros(1, length(x_3n_2));
for i = 1:length(x_3n_2)
    idx = i+2;
    if idx <= N
        h_n_plus_2(i) = -h(idx);
    else
        % If out of bounds, pad with next values from h (wrap around or repeat last value)
        pad_idx = mod(idx-1, N) + 1;
        h_n_plus_2(i) = -h(pad_idx);
    end
end

% Now x_3n_2 and h_n_plus_2 are the same length for all operations

% Linear convolution
lin_conv = conv(x_3n_2, h_n_plus_2);

% Circular convolution (length = max of input lengths)
Nc = max(length(x_3n_2), length(h_n_plus_2));
circ_conv = cconv(x_3n_2, h_n_plus_2, Nc);

% Cross correlation
cross_corr = xcorr(x_3n_2, h_n_plus_2);

% Auto correlation on x(3n-2)
auto_corr = xcorr(x_3n_2);

% Plotting
figure;
subplot(3,2,1);
stem(n1_valid, x_3n_2, 'filled');
title('x(3n-2) [sin]');
xlabel('n'); ylabel('Amplitude');

subplot(3,2,2);
stem(1:length(h_n_plus_2), h_n_plus_2, 'filled');
title('-h(n+2) [cos]');
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
stem(-(length(x_3n_2)-1):(length(h_n_plus_2)-1), cross_corr, 'filled');
title('Cross Correlation');
xlabel('Lag'); ylabel('Amplitude');

subplot(3,2,6);
stem(-(length(x_3n_2)-1):(length(x_3n_2)-1), auto_corr, 'filled');
title('Auto Correlation of x(3n-2)');
xlabel('Lag'); ylabel('Amplitude');

sgtitle('Signal Operations: Transformed Sine and Cosine');