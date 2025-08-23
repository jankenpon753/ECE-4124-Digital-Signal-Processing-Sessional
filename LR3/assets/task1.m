% Given signals
x = [2, 1, 0, -1, 2, 5, 6];
h = [0, 0, 2, 2, 4, 5, 6];

% Linear convolution
lin_conv = conv(x, h);

% Circular convolution (length = max(length(x), length(h)))
N = max(length(x), length(h));
circ_conv = cconv(x, h, N);

% Cross-correlation
cross_corr = xcorr(x, h);

% Auto-correlation of x(n)
auto_corr = xcorr(x);

% Plotting
figure;
subplot(3,2,1);
stem(0:length(x)-1, x, 'filled');
title('Original Signal x(n)');
xlabel('n'); ylabel('Amplitude');

subplot(3,2,2);
stem(0:length(h)-1, h, 'filled');
title('Original Signal h(n)');
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

sgtitle('Signal Operations: Original, Convolution and Correlation');