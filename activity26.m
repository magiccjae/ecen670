clear; close all;

x_gen = @(N) filter([1 1 1], [1], randn(N,1));
omega_scale = @(N) linspace(0,2*pi*(N/(N+1)),N);

x = x_gen(10000);
[R lags] = xcorr(x,length(x),'unbiased');
R_T = R.*window(@bartlett,length(R));
Sxx = fft(R_T);


figure(1);
plot(omega_scale(length(Sxx)), abs(Sxx));   % computed
hold on;
plot(omega_scale(1000),abs(fft([1 1 1],1000)).^2);  % desired
hold off;
legend('Computed Periodogram', 'Desired Power Spectrum');
xlabel('\omega');
ylabel('S_T(\omega)');


%%
% 100 samples, average 1, 10, 100
Sxx = zeros(201,100);
for i=1:100
    x_hundred = x_gen(100);
    [R lags] = xcorr(x_hundred,length(x_hundred),'unbiased');
    R_T = R.*window(@bartlett,length(R));
    Sxx(:,i) = fft(R_T);
end

Sxx_one = Sxx(:,1);
Sxx_ten = sum(Sxx(:,1:10),2)./10;
Sxx_hundred = sum(Sxx,2)./100;

figure(2);
plot(omega_scale(length(Sxx_one)), abs(Sxx_one));
hold on;
plot(omega_scale(length(Sxx_ten)), abs(Sxx_ten));
plot(omega_scale(length(Sxx_hundred)), abs(Sxx_hundred));
plot(omega_scale(100),abs(fft([1 1 1],100)).^2);
hold off;
legend('average 1', 'average 10', 'average 100', 'Desired Power Spectrum');
xlabel('\omega');
ylabel('S_T(\omega)');

% variance using equation on page 541
figure(3);
semilogy(omega_scale(1000),abs(fft([1 1 1],1000)).^4);  % desired
hold on;
semilogy(omega_scale(length(Sxx_one)), abs(Sxx_one).^2);  % average 1
semilogy(omega_scale(length(Sxx_ten)), (abs(Sxx_ten).^2)./10); % average 10
semilogy(omega_scale(length(Sxx_hundred)), (abs(Sxx_hundred).^2)./100); % average 100

hold off;
legend('Analytical S^2_T(\omega)', 'average 1', 'average 10', 'average 100');
ylim([10^-10 10^5]);
xlabel('\omega');
ylabel('Variance of S_T(\omega)');
