clear; close all; clc;
n = 10000;
sigma = 1;
X = sigma * randn(1,n);

%From MATLAB filter example
N = 100;    % FIR filter order
Fp= 20e3;   % 20kHz passband-edge frequency
Fs = 96e3;  % 96kHz sampling frequency
Rp = 0.00057565; % corresponds to 0.01dB peak-to-peak ripple
Rst = 1e-4;     % corresponds to 80dB stopband attenuation

% Generate coefficients
NUM = firceqrip(N,Fp/(Fs/2),[Rp Rst],'passedge');   %NUM = vector of coeffs
% fvtool(NUM,'Fs',Fs,'Color','White')    % visualize filter

% This generates a low-pass signal below 20kHz(audible)
% figure;
% histogram(X);
X = filter(NUM,1,X);
% figure;
% histogram(X);
X_hat = hilbert(X);     % Hilbert transform of original signal;

max_lag = 100;
[Rxx,lags] = xcorr(X, max_lag, 'unbiased');
[Rxx_hat,lags] = xcorr(X_hat, max_lag, 'unbiased');

figure(1); plot(abs(fft(Rxx))); %Real signal
hold on; plot(abs(fft(Rxx_hat)),'r'); hold off;
legend('Original','Hilbert transformed');

% Want to resample the signal at a 1Mhz rate
p = 1000;
q = 96;
y = resample(X,p,q);
% figure;
% histogram(y);
y_hat = hilbert(y); % Hilbert transform of 1Mhz rate

max_lag = 1000;
[yxx,lags] = xcorr(y, max_lag, 'unbiased');
[yxx_hat,lags] = xcorr(y_hat, max_lag, 'unbiased');

figure(2); plot(abs(fft(yxx))); %Real signal
hold on; plot(abs(fft(yxx_hat)),'r'); hold off;
legend('Original','Hilbert transformed');

t = (1:length(y))*1e-6; %At 1Mhz sampling rate
f = 200e3; %Now modulate at 200kHz
omega_0 = 2*pi*f;
z_t = y.*exp(1j.*omega_0.*t);
z_t_hat = y_hat.*exp(1j.*omega_0.*t);

[z_t_xx,lags] = xcorr(z_t, max_lag, 'unbiased');
[z_t_xx_hat,lags] = xcorr(z_t_hat, max_lag, 'unbiased');

figure(3); plot(abs(fft(z_t_xx))); %Real signal
hold on; plot(abs(fft(z_t_xx_hat)),'r'); hold off;
legend('Original','Hilbert transformed');
