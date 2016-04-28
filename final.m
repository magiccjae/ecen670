%%
clear; close all;
load('final_exam_data.mat');

% power spectrum of X
maxlags = 100;
[Rxx,lags] = xcorr(x, maxlags, 'unbiased');
Rxxdft = abs(fft(Rxx));
figure(1);
subplot(3,1,1); plot(x);
title('Discrete time series for random variable X');
subplot(3,1,2); plot(lags,Rxx);
title('Autocorrelation R_{X} for discrete time lags');
subplot(3,1,3); plot(linspace(0,2,length(Rxxdft)), Rxxdft);
xlabel('Frequency [\pi]');
title('Power spectral density S_{X} for random variable X');


% power spectrum of Y
[Ryy,lags] = xcorr(y, maxlags, 'unbiased');
Ryydft = abs(fft(Ryy));

figure(2);
subplot(3,1,1); plot(y);
title('Discrete time series for random variable Y');
subplot(3,1,2); plot(lags,Ryy);
title('Autocorrelation R_{Y} for discrete time lags');
subplot(3,1,3); plot(linspace(0,2,length(Ryydft)), Ryydft);
xlabel('Frequency [\pi]');
title('Power spectral density S_{Y} for random variable Y');

% H(w)^2 = Syy/Sxx;
my_filter = Ryydft./Rxxdft;
[h_filter, w_filter] = freqz(my_filter);
figure(3);
plot(my_filter);
title('magnitude of the filter');




%% 2
% % mean of each realization
% mean_data = mean(a);
% 
% [Rxx lags] = xcorr(

% a = @(N) rand + randn(N,1);

ensemble_mean = mean(a);
ensemble_var = var(a);
% we can see that variance is nowhere getting close to 0
% Thus this process is not mean-ergodic
figure(12);
plot(ensemble_var);

% pick some processes
realization_1 = a(:,1);
realization_2 = a(:,10);
realization_3 = a(:,40);
% realization_1 = a(100000);
% realization_2 = a(100000);
mean_1 = mean(realization_1);
mean_2 = mean(realization_2);
mean_3 = mean(realization_3);

[Rxx_1 lags_1] = xcorr(realization_1, 10, 'unbiased');
Cxx_1 = Rxx_1 - mean_1^2;

[Rxx_2 lags_2] = xcorr(realization_2, 10, 'unbiased');
Cxx_2 = Rxx_2 - mean_2^2;

[Rxx_3 lags_3] = xcorr(realization_3, 10, 'unbiased');
Cxx_3 = Rxx_3 - mean_3^2;

% small difference in the graph actually means a huge difference because
% y-axis is scaled very large. Thus this process is not ergodic
figure(11);
plot(lags_1, Cxx_1, 'b');
hold on;
plot(lags_2, Cxx_2, 'r.');
plot(lags_3, Cxx_3, 'g.');
plot(lags_1, mean_1 + 0.*lags_1, 'b--');
plot(lags_2, mean_2 + 0.*lags_2, 'r--');
plot(lags_3, mean_3 + 0.*lags_3, 'g--');
hold off;
xlabel('Lags');
ylabel('Values for covariance and means');
legend('Autocovariance for 1', 'Autocovariance for 2', 'Autocovariance for 3', 'Mean of 1', 'Mean of 2', 'Mean of 3');





%% 3

n = 1000000;
xf = -1+2.*rand(n,1); %uniform on [-1,1]
yf = -1+2.*rand(n,1);
q = sqrt(xf.^2+yf.^2);
k = 1;
for i = 1:n
 if q(i) < 1
 z(k) = xf(i).*sqrt(-4*log(q(i)))./q(i);
 w(k) = yf(i).*sqrt(-4*log(q(i)))./q(i);
 k = k+1;
 end
end
figure(21);
hz = histogram(z,'Normalization','pdf');
limz = linspace(hz.BinLimits(1), hz.BinLimits(2));
hold on;
plot(limz,normpdf(limz,0,1),'LineWidth',1.5);
hold off;
title('z is N(0,1)');
figure(22);
hw = histogram(w,'Normalization','pdf');
limw = linspace(hw.BinLimits(1), hw.BinLimits(2));
hold on;
plot(limw,normpdf(limw,0,1),'LineWidth',1.5);
hold off;
title('w is N(0,1)');




