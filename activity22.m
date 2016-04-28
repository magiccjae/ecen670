clear; close all;
N = 1000; % Number of sample points
f_0 = 250; % Frequency of interest (Hz)
lambda = 20; % Poisson sampling rate (samples per second)
t = cumsum(exprnd(1/lambda,1,N)); %Poisson sampling times
samples = cos(2*pi*f_0 * t); %Samples at Poisson times
figure(1);
plot(t, samples, '.')
xlabel('Time [s]');
ylabel('Sample');
f = 0:1:1000; % Analyzed frequency range
P = @(f) 1 / lambda * sum(samples .* exp(-j * 2*pi*f * t));
P_f = arrayfun(P, f); % Executing Papoulis equation 10-210
figure(2);
plot(f, abs(P_f));
xlabel('Frequency [Hz]');
ylabel('Estimate of Fourier transform magnitude');

t = 0:0.05:50;
samples = cos(2*pi*f_0*t);
figure(3);
plot(t, samples, '.')
xlabel('Time [s]');
ylabel('Sample');
P = @(f) 1 / lambda * sum(samples .* exp(-j * 2*pi*f * t));
P_f = arrayfun(P, f); % Executing Papoulis equation 10-210
figure(4);
plot(f, abs(P_f));
xlabel('Frequency [Hz]');
ylabel('Estimate of Fourier transform magnitude');
