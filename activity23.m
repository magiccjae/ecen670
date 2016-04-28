% Problem 11-1 Parts b, c, and d
L_b = [1 0 1];
L_a = 6*sqrt(2) * [1 -5/6 1/6];
[h,w] = freqz(L_b, L_a, 1000);
figure(1);
plot(w, (cos(2*w) + 1) ./ (12*cos(2*w) - 70*cos(w) + 62)); % Just plot theoriginal function.
hold on; plot(w, abs(h).^2, '--'); hold off; % Plot the freqz analysis.
legend('Analytical', 'Computed from minimum-phase systems');
xlabel('\omega');
ylabel('S(\omega)');
i = randn(100000,1);
x = filter(L_b, L_a, i); % Filter uses our L to modify the random variablei.
 % xcorr later transforms it to our
 % autocorrelation Rxx.
[Rxx, lags] = xcorr(x, 15, 'unbiased');
figure(2);
plot(lags, 1/12 * ((lags==0) - 5 * ((1/3).^abs(lags) - (1/2).^abs(lags)))); %Use modified lags to plot the analytic solution.
hold on; plot(lags, Rxx, '--'); hold off; % Use Rxx to plot the numeric solution.
legend('Analytical', 'Numerically computed', 'Location', 'West');
xlabel('m');
ylabel('R_{XX}[m]');
figure(3);
zplane(L_b, L_a); % This shows us the poles.
