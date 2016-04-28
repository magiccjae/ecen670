% Problem 3 parts b and c
i = randn(100000, 1); % Create the random array
q = sqrt(3/4) * i; % Modify i according to our written solution.
L_b = 1;
L_a = [1 -0.5];
s = filter(L_b, L_a, q); % Filter the signal. This step is important to obtaining the value Rss.
v = sqrt(5) * randn(100000,1); % V is just a constant so it needs less work.
x = s + v;
[Rss, lags] = xcorr(s,20,'unbiased'); % Find the correlations. Use R(ss/vv/xx) for the numeric solutions,
[Rvv, lags] = xcorr(v,20,'unbiased'); % and use modifications of lags for theanalytic solutions.
[Rxx, lags] = xcorr(x,20,'unbiased');
figure(1);
plot(lags, 2.^-abs(lags)); % Analytic Rss
hold on; plot(lags, Rss,'--'); hold off; % Numeric Rss
hold on; plot(lags, Rvv); hold off; % Numeric Rvv
legend('Analytical Rss', 'Numeric Rss', 'Numeric Rvv', 'Location','NorthWest');
xlabel('m');
ylabel('R[m]');
figure(2);
Sxx = abs(fft(Rxx)); % This is used to plot the numeric Rxx which is now Sxx
omega = linspace(0,2*pi*(length(Sxx)-1)/length(Sxx), length(Sxx));
z = exp(j.*omega); % It's more convenient to plot the z than the omega.
% We can just plot the z's to get an analytic solution
plot(omega, abs((5 - 14*z.^(-1) + 5*z.^(-2)) ./ (1 - 5/2*z.^(-1) + z.^(-2))));
% Or we can plot Sxx for the numeric solution.
hold on; plot(omega, Sxx); hold off;
legend('Analytical S(\omega)', 'Numeric S(\omega)', 'Location', 'North');
xlim([0 2*pi]);
xlabel('\omega');
ylabel('S(\omega)');