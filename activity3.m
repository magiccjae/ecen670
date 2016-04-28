clear;

a = 0.5;
b = 4;
trials = 100000;

x = 0:0.2:20;

values = random('Gamma', a, b, trials, 1);

[num_elem, centers] = hist(values,x);

figure(1); clf;
plot(x,pdf('Gamma',x,a,b));
hold on;
plot(centers, num_elem/trials/(centers(2)-centers(1)),'rx');
hold off;
xlabel('x');
ylabel('Probability density per unit length');
legend('Actual distribution', 'Estimated distribution');

figure(2); clf;
plot(x,cdf('Gamma',x,a,b));
hold on;
plot(centers,cumsum(num_elem)/trials,'rx');
hold off;
xlabel('x');
ylabel('Cumulative sum of probability');
legend('Actual distribution', 'Estimated distribution');