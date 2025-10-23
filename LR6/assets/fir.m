fs = 1000; 
fcut = 100; 
n = 50;

% FIR Filter
b_fir = fir1(n, fcut/(fs/2));

% IIR Filter (Butterworth)
[b_iir, a_iir] = butter(4, fcut/(fs/2));

% Frequency responses (use freqz to get data, then plot in subplots)
Nfreq = 512;
[Hf, wf] = freqz(b_fir, 1, Nfreq, fs);
[Hi, wi] = freqz(b_iir, a_iir, Nfreq, fs);

figure;
subplot(3,1,1);
plot(wf, 20*log10(abs(Hf)));
grid on;
title('FIR Magnitude Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');

subplot(3,1,2);
plot(wi, 20*log10(abs(Hi)));
grid on;
title('IIR Magnitude Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');

% Compare outputs (time domain)
t = 0:1/fs:1;
x = sin(2*pi*50*t) + 0.5*randn(size(t));
y_fir = filter(b_fir, 1, x);
y_iir = filter(b_iir, a_iir, x);

subplot(3,1,3);
plot(t, x, 'k', t, y_fir, 'r', t, y_iir, 'b');
grid on;
legend('Original', 'FIR Output', 'IIR Output');
xlabel('Time (s)');
ylabel('Amplitude');
title('Time-domain Signals');