% Define the range of n
n = -10:10;

% Unit Impulse Signal (delta[n])
impulse = (n == 0);

% Unit Step Signal (u[n])
step = (n >= 0);

% Ramp Signal (r[n])
ramp = n .* (n >= 0);

% Convert unit impulse from unit step
impulse_from_step = [step(1), diff(step)];

% Convert unit impulse from ramp
impulse_from_ramp = [ramp(1), diff(diff(ramp))];

% Convert unit step from unit impulse
step_from_impulse = cumsum(impulse);

% Convert unit step from ramp
step_from_ramp = [ramp(1), diff(ramp)];

% Convert ramp from unit impulse
ramp_from_impulse = cumsum(cumsum(impulse));

% Convert ramp from unit step
ramp_from_step = cumsum(step);

% Plotting
figure;

subplot(4,2,1);
stem(n, impulse, 'filled');
title('Unit Impulse Signal');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(4,2,2);
stem(n, impulse_from_step, 'filled');
title('Impulse from Step');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(4,2,3);
stem(n, impulse_from_ramp, 'filled');
title('Impulse from Ramp');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(4,2,4);
stem(n, step, 'filled');
title('Unit Step Signal');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(4,2,5);
stem(n, step_from_impulse, 'filled');
title('Step from Impulse');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(4,2,6);
stem(n, step_from_ramp, 'filled');
title('Step from Ramp');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(4,2,7);
stem(n, ramp, 'filled');
title('Ramp Signal');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(4,2,8);
stem(n, ramp_from_impulse, 'filled');
title('Ramp from Impulse');
xlabel('n');
ylabel('Amplitude');
grid on;

figure;
stem(n, ramp_from_step, 'filled');
title('Ramp from Step');
xlabel('n');
ylabel('Amplitude');
grid on;