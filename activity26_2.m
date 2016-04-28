clear; close all;

x_gen = @(N) filter([1 1 1], [1], randn(N,1));
omega_scale = @(N) linspace(0,2*pi*(N/(N+1)),N);

samples = 100;

for i=1:samples
    x = x_gen(samples);
    [R(:,i) lags] = xcorr(x,length(x),'unbiased');
    R_T(:,i) = R(:,i).*window(@bartlett,length(lags));
    R_W(:,i) = R_T(:,i).*window(@bartlett,length(lags));
end

figure(1);
hold on;
subplot(3,1,1); plot(lags, R); 
ylabel('Unbiased R^T');
subplot(3,1,2); plot(lags, R_T);
ylabel('Biased R_T');
subplot(3,1,3); plot(lags, R_W);
ylabel('Biased R_T x w(t)');
xlabel('Lags');


Sxx_unbiased = fft(R);
Sxx_biased = fft(R_T);
Sxx_window = fft(R_W);

unbiased_mean = sum(Sxx_unbiased,2)./samples;
biased_mean = sum(Sxx_biased,2)./samples;
window_mean = sum(Sxx_window,2)./samples;

figure(2);
plot(omega_scale(length(unbiased_mean)), abs(unbiased_mean));
hold on;
plot(omega_scale(length(biased_mean)), abs(biased_mean));
plot(omega_scale(length(window_mean)), abs(window_mean));
plot(omega_scale(100),abs(fft([1 1 1],100)).^2);
hold off;
legend('unbiased', 'biased', 'window', 'Desired Power Spectrum');
xlabel('\omega');
ylabel('S_T(\omega)');

% variance using equation on page 541
figure(3);
semilogy(omega_scale(1000),abs(fft([1 1 1],1000)).^4);  % desired
hold on;
semilogy(omega_scale(length(unbiased_mean)), abs(unbiased_mean).^2);  % unbiased
semilogy(omega_scale(length(biased_mean)), abs(biased_mean).^2); % biased
semilogy(omega_scale(length(window_mean)), abs(window_mean).^2); % window

hold off;
legend('Analytical S^2_T(\omega)', 'unbiased', 'biased', 'window');
ylim([10^-10 10^5]);
xlabel('\omega');
ylabel('Variance of S_T(\omega)');
