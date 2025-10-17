% raw_dft_idft.m
% Compute DFT and IDFT using raw (direct) summation and show results in console

x = [3 0 1 -2];

% DFT (raw)
X = my_dft(x);

% IDFT (raw)
x_reconstructed = my_idft(X);

% Display in console
disp('DFT Result X[k]:');
disp(X);
disp('Reconstructed sequence using IDFT x[n]:');
disp(x_reconstructed);
disp('Reconstructed (real part):');
disp(real(x_reconstructed));
disp('Reconstructed (imag part):');
disp(imag(x_reconstructed));

err = max(abs(x - real(x_reconstructed)));
fprintf('Max reconstruction error (abs): %g\n', err);

% Prepare indices
N = length(x);
n = 0:N-1;
k = 0:N-1;

% Single figure with subfigures (tiledlayout)
figure;
t = tiledlayout(5,1,'Padding','compact','TileSpacing','compact');

% 1: Original sequence
nexttile;
stem(n, x, 'filled');
title('Original sequence x[n]');
xlabel('n'); ylabel('Amplitude');
grid on;

% 2: Magnitude of DFT
nexttile;
stem(k, abs(X), 'filled');
title('Magnitude of DFT |X[k]|');
xlabel('k (frequency bin)'); ylabel('|X[k]|');
grid on;

% 3: Phase of DFT
nexttile;
stem(k, angle(X), 'filled');
title('Phase of DFT \angleX[k]');
xlabel('k (frequency bin)'); ylabel('Phase (radians)');
grid on;

% 4: Comparison original vs reconstructed (real part)
nexttile;
stem(n, x, 'b', 'filled');
hold on;
stem(n, real(x_reconstructed), 'r--', 'filled');
hold off;
legend('Original','Reconstructed (real part)');
title('Original vs Reconstructed');
xlabel('n'); ylabel('Amplitude');
grid on;

% 5: Imaginary part of reconstructed
nexttile;
stem(n, imag(x_reconstructed), 'm', 'filled');
title('Imaginary part of reconstructed (should be ~0)');
xlabel('n'); ylabel('Imaginary part');
grid on;

% --- Local functions --------------------------------------------------
function X = my_dft(x)
    % Compute DFT via direct summation
    x = x(:).';            % ensure row vector
    N = length(x);
    X = zeros(1, N);
    for k = 0:N-1
        s = 0;
        for n = 0:N-1
            s = s + x(n+1) * exp(-1j*2*pi*k*n / N);
        end
        X(k+1) = s;
    end
end

function x = my_idft(X)
    % Compute IDFT via direct summation
    X = X(:).';            % ensure row vector
    N = length(X);
    x = zeros(1, N);
    for n = 0:N-1
        s = 0;
        for k = 0:N-1
            s = s + X(k+1) * exp(1j*2*pi*k*n / N);
        end
        x(n+1) = s / N;
    end
end