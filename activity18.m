clear; close all;

sigma = 1;
x = randn(100000,1);
X = sigma .* x;
 
maxlags = 100;
[Rxx,lags] = xcorr(X, maxlags, 'unbiased');
Rxxdft = abs(fft(Rxx));
figure(1);
subplot(3,1,1); plot(X);
title('Discrete time series for random variable X');
subplot(3,1,2); plot(lags,Rxx);
title('Autocorrelation R_{X} for discrete time lags');
subplot(3,1,3); plot(linspace(0,2,length(Rxxdft)), Rxxdft);
xlabel('Frequency [\pi]');
title('Power spectral density S_{X} for random variable X');
 
b = 1/5 * [1 1 1 1 1]; a = [1]
Y = filter(b, a, X);
 
figure(2);
[h_b, w_b] = freqz(b);
subplot(3,1,1); plot(w_b, abs(h_b));
title('Filter response for b');
[h_a, w_a] = freqz(a);
subplot(3,1,2); plot(w_a, abs(h_a));
title('Filter response for a');
filter_h = h_b ./ h_a;
subplot(3,1,3); plot(w_a, abs(filter_h).^2);
title('Squared filter response of B / A');
 
[Ryy,lags] = xcorr(Y, maxlags, 'unbiased');
Ryydft = abs(fft(Ryy));
 
figure(3);
subplot(3,1,1); plot(Y);
title('Discrete time series for random variable Y');
subplot(3,1,2); plot(lags,Ryy);
title('Autocorrelation R_{Y} for discrete time lags');
subplot(3,1,3); plot(linspace(0,2,length(Ryydft)), Ryydft);
xlabel('Frequency [\pi]');
title('Power spectral density S_{Y} for random variable Y');
