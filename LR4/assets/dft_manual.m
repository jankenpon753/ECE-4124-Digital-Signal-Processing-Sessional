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

% Manual DFT of both signals
X = dft_manual(x_pad);
H = dft_manual(h_pad);

% Multiply in frequency domain
Y = X .* H;

% Manual IDFT to get convolution result
y_dft = idft_manual(Y);

% Direct convolution (for verification)
y_direct = conv(x, h);

%% Display results
disp('Convolution using manual DFT (complex values):');
disp(y_dft);
disp('Convolution using manual DFT (real part):');
disp(real(y_dft));
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
title('Convolution y(n) using manual DFT');
xlabel('n'); ylabel('Amplitude'); grid on;

subplot(4,1,4);
stem(n_y, y_direct, 'm', 'filled', 'LineWidth', 1.5);
title('Convolution y(n) using Direct conv()');
xlabel('n'); ylabel('Amplitude'); grid on;

%% Local functions: manual DFT and IDFT
function X = dft_manual(x)
    % x: 1-by-N real/complex vector
    N = length(x);
    n = 0:N-1;
    k = 0:N-1;
    W = exp(-1j*2*pi/N*(n.'*k)); % N-by-N DFT matrix
    X = W * x(:);                % column result
    X = X(:).';                  % return as row
end

function x = idft_manual(X)
    % X: 1-by-N frequency samples
    N = length(X);
    n = 0:N-1;
    k = 0:N-1;
    Winv = exp(1j*2*pi/N*(n.'*k)); % N-by-N IDFT matrix
    x = (1/N) * (Winv * X(:));     % column result
    x = x(:).';                     % return as row
end
