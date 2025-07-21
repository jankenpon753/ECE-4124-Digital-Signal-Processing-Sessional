% Define discrete time
N = 21;
n = 0:N-1;
% Generate unit step signal u[n]
step_signal = double(n >= 0);
% Convert step to ramp using cumulative sum
ramp_signal = cumsum(step_signal);
% Convert ramp back to step using difference
recovered_step = [ramp_signal(1), diff(ramp_signal)];
% Step to Impulse: difference of step signal
impulse_from_step = [step_signal(1), diff(step_signal)];
% Impulse to Step: cumulative sum of impulse signal
step_from_impulse = cumsum(impulse_from_step);
% Plotting
figure;
subplot(5,1,1);
stem(n, step_signal, 'filled', 'LineWidth', 2);
grid on;
title('Original Unit Step Signal u[n]');
xlabel('n');
ylabel('Amplitude');
ylim([-0.2 1.2]);
subplot(5,1,2);
stem(n, ramp_signal, 'filled', 'LineWidth', 2);
grid on;
title('Converted Unit Ramp Signal r[n]');
xlabel('n');
ylabel('Amplitude');
subplot(5,1,3);
stem(n, recovered_step, 'filled', 'LineWidth', 2);
grid on;
title('Recovered Step Signal from Ramp');
xlabel('n');
ylabel('Amplitude');
ylim([-0.2 1.2]);
subplot(5,1,4);
stem(n, impulse_from_step, 'filled', 'LineWidth', 2);
grid on;
title('Impulse Signal from Step \delta[n]');
xlabel('n');
ylabel('Amplitude');
ylim([-0.2 1.2]);
subplot(5,1,5);
stem(n, step_from_impulse, 'filled', 'LineWidth', 2);
grid on;
title('Recovered Step Signal from Impulse');
xlabel('n');
ylabel('Amplitude');
ylim([-0.2 1.2]);