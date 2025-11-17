%% --- FIR Filtering of the DO Signal Using Recurrence Method ---

clear; clc; close all;

%% 1. Load DO signal
load signal2.mat     % loads "signal"
t = signal(1,:);     % time vector
e = signal(2,:);     % input DO signal
N = length(e);       % number of samples
Tech = t(2);         % sampling period
Fs = 1/Tech;         % sampling frequency

%% 2. Load FIR filter coefficients (Num)
load FIR_coeff.mat   % created earlier by FDATool export
b = Num;             % rename for readability
M = length(b);       % number of coefficients

%% 3. FIR filtering using manual recurrence relation
s = zeros(1, N);     % output signal

for k = 1:N
    for i = 1:min(k, M)
        s(k) = s(k) + b(i) * e(k-i+1);
    end
end

%% 4. Plot input and output in time domain
figure;
plot(t, e); hold on;
plot(t, s);
xlabel("Time (s)");
ylabel("Amplitude");
title("DO Signal Before and After FIR Filtering");
legend("Original DO","Filtered DO");
grid on;

%% 5. Listen to the signals
disp("Playing original DO...");
sound(e, Fs);
pause(1.5);
disp("Playing filtered DO...");
sound(s, Fs);

%% 6. Compute FFTs for spectrum comparison
Nfft = 2^nextpow2(N);

E = fft(e, Nfft)/N;
S = fft(s, Nfft)/N;

f = linspace(0, Fs/2, Nfft/2+1);

E_amp = 2*abs(E(1:Nfft/2+1));
S_amp = 2*abs(S(1:Nfft/2+1));

%% 7. Plot FFT magnitude comparison
figure;
plot(f, E_amp); hold on;
plot(f, S_amp);
xlabel("Frequency (Hz)");
ylabel("Amplitude");
title("Spectrum of DO Before and After FIR Filtering");
legend("Input Spectrum","Filtered Spectrum");
grid on;
