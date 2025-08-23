% Given signals
x = [2, 1, 0, -1, 2, 5, 6];
h = [0, 0, 2, 2, 4, 5, 6];

% Operation 1: x(3n-2)
n = 1:length(x);
n1 = 1:ceil((length(x)+2)/3); % Find valid n for x(3n-2)
x_3n_2 = zeros(1, length(n1));
for i = 1:length(n1)
    idx = 3*n1(i)-2;
    if idx >= 1 && idx <= length(x)
        x_3n_2(i) = x(idx);
    end
end

% Operation 2: -h(n+2)
n2 = 1:length(h);
h_n_plus_2 = zeros(1, length(h));
for i = 1:length(h)
    idx = i+2;
    if idx <= length(h)
        h_n_plus_2(i) = -h(idx);
    else
        h_n_plus_2(i) = 0;
    end
end

% Linear convolution
lin_conv = conv(x_3n_2, h_n_plus_2);

% Circular convolution (length = max of input lengths)
N = max(length(x_3n_2), length(h_n_plus_2));
circ_conv = cconv(x_3n_2, h_n_plus_2, N);

% Cross correlation
cross_corr = xcorr(x_3n_2, h_n_plus_2);

% Auto correlation on x(n)
auto_corr = xcorr(x_3n_2);

% Plotting
figure;
subplot(3,2,1);
stem(x_3n_2, 'filled');
title('x(3n-2)');
xlabel('n'); ylabel('Amplitude');

subplot(3,2,2);
stem(h_n_plus_2, 'filled');
title('-h(n+2)');
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
title('Auto Correlation of x(3n-2)');
xlabel('n'); ylabel('Amplitude');

sgtitle('DSP Operations Results');