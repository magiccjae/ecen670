clear;

mu = 2;
lamda = 1/mu;
trials = 100000;

x = 0:0.2:15;

values = random('Exponential', mu, trials, 1);

[num_elem, centers] = hist(values,x);

figure(1); clf;
plot(x,pdf('Exponential',x,mu));
hold on;
plot(x,num_elem/trials/centers(2)-centers(1),'rx');
hold off;

subset = values((values >= 6) & (values <= 9));

x_subset = 6.05:0.1:(9-0.05);
[num_elem, centers] = hist(subset,x_subset);

p_subset = exp(-6/mu)-exp(-9/mu)

figure(1);
hold on;
plot(x_subset,pdf('Exponential',x_subset,mu)/p_subset);
plot(centers,num_elem/length(subset)/(centers(2)-centers(1)),'rx');
hold off;

xlabel('x');
ylabel('Probability dentisy per unit length');
legend('Actual distribution','Estimated distribution');