% Load filter coefficients from FDATool
load FIR_coeff.mat      % loads variable Num
b = Num;                % FIR coefficients

% Load the DO sound signal (MAKE SURE signal.mat is in this folder)
load signal.mat         % loads variable "signal"

t = signal(1,:);        % time vector
e = signal(2,:);        % input signal
N = length(e);          % number of samples
Tech = t(2);            % sampling period
