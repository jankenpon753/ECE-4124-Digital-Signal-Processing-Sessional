% Original signal x(n)
x = [1, -3, 4, -5, 0, 2, 3, 5, -7];
n = 0:length(x)-1; % n = 0 to 8

% 1. Time shifting: x(n-3)
shift_amount = 3;
n_shift = n - shift_amount;
x_shift = x;

% 2. Folding: x(-n)
n_fold = -n;
x_fold = flip(x);

% 3. Scaling: x(3n)
n_scale = 0:floor((length(x)-1)/3);
x_scale = x(3*n_scale + 1); % MATLAB uses 1-based indexing

% Plotting
figure;

subplot(4,1,1);
stem(n, x, 'filled');
title('Original Signal: x(n)');
xlabel('n');
ylabel('x(n)');

subplot(4,1,2);
stem(n_shift, x_shift, 'filled');
title('Time Shifting: x(n-3)');
xlabel('n');
ylabel('x(n-3)');

subplot(4,1,3);
stem(n_fold, x_fold, 'filled');
title('Folding: x(-n)');
xlabel('n');
ylabel('x(-n)');

subplot(4,1,4);
stem(n_scale, x_scale, 'filled');
title('Scaling: x(3n)');
xlabel('n');
ylabel('x(3n)');