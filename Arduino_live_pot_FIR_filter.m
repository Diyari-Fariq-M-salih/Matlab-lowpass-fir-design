%% -------------------------------
% REAL-TIME FIR FILTER WITH ARDUINO
% Input = Potentiometer at A0
% -------------------------------

clear; clc;

%% Load FIR coefficients
b = [ ...
0.127840333393636  ...
0.0439596886518010 ...
0.0497877909863766 ...
0.0549707353961395 ...
0.0592710697571116 ...
0.0624637585085750 ...
0.0643727934326621 ...
0.0650227995372929 ...
0.0643727934326621 ...
0.0624637585085750 ...
0.0592710697571116 ...
0.0549707353961395 ...
0.0497877909863766 ...
0.0439596886518010 ...
0.127840333393636 ];

N = length(b);
buffer = zeros(1,N);   % FIR sliding buffer

%% Serial setup (change COM port!)
port = "COM5";         % <--- MODIFY THIS
baud = 115200;

s = serialport(port, baud);
flush(s);

fprintf("Connected to %s\n", port);

%% Real-time filtering loop
while true
    % read sample from Arduino
    line = readline(s);
    x = str2double(line);

    if isnan(x)
        continue;   % ignore bad lines
    end

    % shift buffer
    buffer = [x buffer(1:end-1)];

    % FIR output
    y = sum(buffer .* b);

    % print
    fprintf("Raw: %4f   Filtered: %.3f\n", x, y);
end
