x = 1 + 2*randn(100000,1);
b = 1/5 * [1 1 1 1 1]; a = [1];
y = filter(b, a, x);
mean(x)
mean(y)
figure(1); [r, lags] = xcorr(x, 10, 'unbiased'); stem(lags, r);
figure(2); [r, lags] = xcorr(x, y, 10, 'unbiased'); stem(lags, r);
figure(3); [r, lags] = xcorr(y, 10, 'unbiased'); stem(lags, r);
