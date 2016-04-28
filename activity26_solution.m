% Activity Day 26
% Dr. Mazzeo

%clear all;
%close all;

x_gen = @(N) filter([1 1 1], [1], randn(N,1));
omega_scale = @(N) linspace(0, 2*pi*(N/(N+1)), N);

% First thing will look at periodogram averaging

x = x_gen(10000);
[R lags] = xcorr(x, length(x), 'unbiased');
R_T = R .* window(@bartlett, length(R));
Sxx = fft(R_T);

figure(1);
plot(omega_scale(length(Sxx)), abs(Sxx));
hold on; plot(omega_scale(1000), abs(fft([1 1 1], 1000)).^2); hold off;
legend('Computed Periodogram', 'Desired Power Spectrum');
xlabel('\omega');
ylabel('S_T(\omega)');

Sxx_ov = [];
for ov_counter = 1:100
    Sxx = [];
    for counter = 1:1
        x = x_gen(100);
        [R lags] = xcorr(x, length(x), 'unbiased');
        R_T = R .* window(@bartlett, length(R));
        Sxx(counter,:) = fft(R_T);
    end
    Sxx_ov(ov_counter,:) = Sxx;
    %Sxx_ov(ov_counter,:) = mean(Sxx)';
end
Sxx_mean_1 = mean(Sxx_ov);
Sxx_var_1 = var(Sxx_ov);


Sxx_ov = [];
for ov_counter = 1:100
    Sxx = [];
    for counter = 1:10
        x = x_gen(100);
        [R lags] = xcorr(x, length(x), 'unbiased');
        R_T = R .* window(@bartlett, length(R));
        Sxx(counter,:) = fft(R_T);
    end
    Sxx_ov(ov_counter,:) = mean(Sxx)';
end
Sxx_mean_10 = mean(Sxx_ov);
Sxx_var_10 = var(Sxx_ov);

Sxx_ov = [];
for ov_counter = 1:100
    Sxx = [];
    for counter = 1:100
        x = x_gen(100);
        [R lags] = xcorr(x, length(x), 'unbiased');
        R_T = R .* window(@bartlett, length(R));
        Sxx(counter,:) = fft(R_T);
    end
    Sxx_ov(ov_counter,:) = mean(Sxx)';
end
Sxx_mean_100 = mean(Sxx_ov);
Sxx_var_100 = var(Sxx_ov);


figure(2);
plot(omega_scale(length(Sxx_mean_1)), abs(Sxx_mean_1));
hold on;
plot(omega_scale(length(Sxx_mean_10)), abs(Sxx_mean_10));
plot(omega_scale(length(Sxx_mean_100)), abs(Sxx_mean_100));
plot(omega_scale(1000), abs(fft([1 1 1], 1000)).^2);
hold off;
legend('Mean of 100 S_T(\omega) estimates averaging 1',...
    'Mean of 100 S_T(\omega) estimates averaging 10',...
    'Mean of 100 S_T(\omega) estimates averaging 100',...
    'Analytical predicted S_T(\omega)',...
    'Location', 'North')
xlabel('\omega');
ylabel('S_T(\omega)');
xlim([0 2*pi]);

figure(3);
semilogy(omega_scale(length(Sxx_var_1)), abs(Sxx_var_1));
hold on;
semilogy(omega_scale(length(Sxx_var_10)), abs(Sxx_var_10));
semilogy(omega_scale(length(Sxx_var_100)), abs(Sxx_var_100));
semilogy(omega_scale(1000), (abs(fft([1 1 1], 1000)).^2).^2);
hold off;
legend('Variance of 100 S_T(\omega) estimates averaging 1',...
    'Variance of 100 S_T(\omega) estimates averaging 10',...
    'Variance of 100 S_T(\omega) estimates averaging 100',...
    'Analytical S^2_T(\omega)',...
    'Location', 'Southeast')
xlabel('\omega');
ylabel('Variance of S_T(\omega)');
xlim([0 2*pi]);

% Performance tradeoff with lag window
R_total = [];
Rxx_total = [];
Rxx_w_total = [];
Sxx = [];
Sxx_w = [];

for counter = 1:100
    x = x_gen(100);
    [R lags] = xcorr(x, length(x), 'unbiased');
    R_T = R .* window(@bartlett, length(lags));
    R_w = R_T .* window(@bartlett, length(lags));
    R_total(counter,:) = R;
    Rxx_total(counter,:) = R_T;
    Rxx_w_total(counter,:) = R_w;
    Sxx(counter,:) = fft(R);
    Sxx_T(counter,:) = fft(R_T);
    Sxx_w(counter,:) = fft(R_w);
end
figure(4);
subplot(3,1,1);
plot(lags, R_total');
ylabel('Unbiased R^T');
subplot(3,1,2);
plot(lags, Rxx_total');
ylabel('Biased R_T');
subplot(3,1,3);
plot(lags, Rxx_w_total');
ylabel('Biased R_T \times w(t)');
xlabel('Lags');

figure(5);
plot(omega_scale(length(Sxx(1,:))), abs(mean(Sxx)));
hold on; plot(omega_scale(length(Sxx_T(1,:))), abs(mean(Sxx_T))); hold off;
hold on; plot(omega_scale(length(Sxx_w(1,:))), abs(mean(Sxx_w))); hold off;
hold on; plot(omega_scale(1000), (abs(fft([1 1 1], 1000))).^2); hold off;
legend('Average of unbiased periodogram', 'Average of biased periodogram', 'Average of lag window-modified, biased periodogram', 'Analytical solution', 'Location', 'North');
xlabel('\omega');
ylabel('S_T(\omega) and S_w(\omega)');
xlim([0 2*pi]);

figure(6);
plot(omega_scale(length(Sxx(1,:))), var(Sxx));
hold on; plot(omega_scale(length(Sxx_T(1,:))), var(Sxx_T)); hold off;
hold on; plot(omega_scale(length(Sxx_w(1,:))), var(Sxx_w)); hold off;
%hold on; plot(omega_scale(1000), (abs(fft([1 1 1], 1000)).^2).^2); hold off;
%hold on; plot(omega_scale(1000), 1/2 .* (abs(fft([1 1 1], 1000)).^2).^2); hold off;
legend('Unbiased Periodogram', 'Periodogram S_T(\omega)', 'Lag window-modified periodogram S_w(\omega)');
xlabel('\omega');
ylabel('Variance');
xlim([0 2*pi]);

% Looking at spread of signal with smaller data windows (smoothing)

t = 1:100;
x = cos(2*pi/10 * t);

M = 1; [R_1 lags_R_1] = xcorr(x, round(length(x)*M), 'unbiased');
M = 1/4; [R_2 lags_R_2] = xcorr(x, round(length(x)*M), 'unbiased');
M = 1/16; [R_4 lags_R_4] = xcorr(x, round(length(x)*M), 'unbiased');
Sxx_1 = fft([R_1 zeros(1,1000)]);
Sxx_2 = fft([R_2 zeros(1,1000)]);
Sxx_4 = fft([R_4 zeros(1,1000)]);

figure(7);
         plot(lags_R_1, R_1);
hold on; plot(lags_R_2, R_2); hold off;
hold on; plot(lags_R_4, R_4); hold off;

figure(8);
         plot(omega_scale(length(Sxx_1)), abs(Sxx_1));
hold on; plot(omega_scale(length(Sxx_2)), abs(Sxx_2)); hold off;
hold on; plot(omega_scale(length(Sxx_4)), abs(Sxx_4)); hold off;
%hold on; plot(omega_scale(1000), abs(fft([1 1 1], 1000)).^2 ); hold off;
legend('M = 1', 'M = 1/4', 'M = 1/16'); 
xlim([0 2*pi]);


% Noise smoothing
t = 1:100;
x = x_gen(100)';

M = 1; [R_1 lags_R_1] = xcorr(x, round(length(x)/M), 'unbiased');
M = 4; [R_2 lags_R_2] = xcorr(x, round(length(x)/M), 'unbiased');
M = 16; [R_4 lags_R_4] = xcorr(x, round(length(x)/M), 'unbiased');
Sxx_1 = fft([R_1 zeros(1,1000)]);
Sxx_2 = fft([R_2 zeros(1,1000)]);
Sxx_4 = fft([R_4 zeros(1,1000)]);

figure(9);
         plot(lags_R_1, R_1);
hold on; plot(lags_R_2, R_2); hold off;
hold on; plot(lags_R_4, R_4); hold off;

figure(10);
         plot(omega_scale(length(Sxx_1)), abs(Sxx_1));
hold on; plot(omega_scale(length(Sxx_2)), abs(Sxx_2)); hold off;
hold on; plot(omega_scale(length(Sxx_4)), abs(Sxx_4)); hold off;
hold on; plot(omega_scale(1000), abs(fft([1 1 1], 1000)).^2 ); hold off;
legend('M = 1', 'M = 1/4', 'M = 1/16', 'Analytical solution'); 



return;