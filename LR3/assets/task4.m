% Given signals
x = [2, 1, 0, -1, 2, 5, 6];
h = [0, 0, 2, 2, 4, 5, 6];

% Operation 1: x(-n+4)
N_x = length(x);
n_x = 0:N_x-1;
x_neg_n_plus_4 = zeros(1, N_x);
for i = 1:N_x
    idx = -n_x(i) + 4 + 1; % +1 for MATLAB indexing
    if idx >= 1 && idx <= N_x
        x_neg_n_plus_4(i) = x(idx);
    else
        x_neg_n_plus_4(i) = 0;
    end
end

% Operation 2: h(-n-3)
N_h = length(h);
n_h = 0:N_h-1;
h_neg_n_minus_3 = zeros(1, N_h);
for i = 1:N_h
    idx = -n_h(i) - 3 + 1; % +1 for MATLAB indexing
    if idx >= 1 && idx <= N_h
        h_neg_n_minus_3(i) = h(idx);
    else
        h_neg_n_minus_3(i) = 0;
    end
end

% Linear convolution
lin_conv = conv(x_neg_n_plus_4, h_neg_n_minus_3);

% Circular convolution (length = max of input lengths)
N = max(length(x_neg_n_plus_4), length(h_neg_n_minus_3));
circ_conv = cconv(x_neg_n_plus_4, h_neg_n_minus_3, N);

% Cross correlation
cross_corr = xcorr(x_neg_n_plus_4, h_neg_n_minus_3);

% Auto correlation on x(-n+4)
auto_corr = xcorr(x_neg_n_plus_4);

% Plotting
figure;
subplot(3,2,1);
stem(x_neg_n_plus_4, 'filled');
title('x(-n+4)');
xlabel('n'); ylabel('Amplitude');

subplot(3,2,2);
stem(h_neg_n_minus_3, 'filled');
title('h(-n-3)');
xlabel('n'); ylabel('Amplitude');

subplot(3,2,3);
stem(lin_conv, 'filled');
title('Linear Convolution');
xlabel('n'); ylabel('Amplitude');

subplot(3,2,4);
stem(circ_conv, 'filled');
title('Circular Convolution');
xlabel('n'); ylabel('Amplitude');

subplot(3,2,5);
stem(cross_corr, 'filled');
title('Cross Correlation');
xlabel('n'); ylabel('Amplitude');

subplot(3,2,6);
stem(auto_corr, 'filled');
title('Auto Correlation of x(-n+4)');
xlabel('n'); ylabel('Amplitude');

sgtitle('DSP Operations Results for x(-n+4) and h(-n-3)');