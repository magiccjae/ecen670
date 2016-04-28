clear; close all; clc;

t = 10000;
T = 100;
Y = rand(1,t);

binaryMatrix = [];

for i= 1:t
    if(Y(i) > .5)
        binaryMatrix = horzcat(binaryMatrix,ones(1,T));
    else
        binaryMatrix = horzcat(binaryMatrix,(zeros(1,T)-1));
    end
end

% binary transmission plot
% Plot subset of matrix to get the idea
figure(1)
stairs(binaryMatrix(1:500));
ylim([-2 2])

% Auto correlation
max_lag = 100;
[Ryy, lags] = xcorr(binaryMatrix, max_lag, 'unbiased');

figure(2);
plot(lags,Ryy);
str = sprintf('Autocorrelation, T=%d',T);
title(str);

% Power Spectrum
w = linspace(0,2*pi, length(lags));
Sxw = 4.*(sin(w*T/2).^2)./(T.*w.^2);

figure(3);
plot(w,abs(fft(Ryy)),'k');
hold on;
plot(w,Sxw,'--');
hold off;

ylim([0 5]);
xlim([0 2*pi]);
xlabel('Frequency');
title('Power Spectral Density');
legend('Measured','Calculated');