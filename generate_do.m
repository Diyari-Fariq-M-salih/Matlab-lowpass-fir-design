% --- Synthetic DO (C4) Signal Generator ---

Fs = 24000;              % sampling frequency (same as your FIR design)
Tech = 1/Fs;             % sampling period
duration = 0.1;          % length of the note in seconds
t = 0:Tech:duration;     % time vector

f_do = 523.25;           % DO (C4) frequency in Hz
e = 0.8 * sin(2*pi*f_do * t);   % pure tone, 80% amplitude

% Optional: add some harmonics (more realistic piano/voice tone)
e = e + 0.3*sin(2*pi*2*f_do*t) + 0.15*sin(2*pi*3*f_do*t);

% Pack into the same structure as "signal.mat"
signal = [t; e];

% Save to .mat so you can load it in your filtering script
save('signal.mat','signal');

disp("Synthetic DO signal created and saved as signal.mat");
