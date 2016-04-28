clear all;
close all;

x = exprnd(1,10000,1);
y = exprnd(1,10000,1);

figure(1);
histogram(x+y,'Normalization','pdf');
z = 0:0.1:10;
hold on; plot(z, z .* exp(-z)); hold off;
legend('Estimates', 'Analytical');
title('Problem 6-1a');
xlabel('z');
ylabel('Probability density');

figure(2);
histogram(x-y,'Normalization','pdf');
z = -10:0.1:10;
hold on; plot(z, 1/2*exp(-abs(z))); hold off;
legend('Estimates', 'Analytical');
title('Problem 6-1b');
xlabel('z');
ylabel('Probability density');

figure(3);
histogram(x .* y, 'Normalization', 'pdf');
z = 0:0.1:10;
integral_z = @(z) integral(@(x) 1 ./ x .* exp(-(x + z./x)), 0, inf);
hold on; plot(z, arrayfun(integral_z, z)); hold off;
legend('Estimates', 'Analytical');
title('Problem 6-1c');
xlabel('z');
ylabel('Probability density');
ylim([0 2]);
xlim([0 10]);

figure(4);
histogram(x./ y, 0:5:90, 'Normalization', 'pdf');
z = 0:0.1:80;
hold on; plot(z, 1 ./ (z+1).^2); hold off;
legend('Estimates', 'Analytical');
title('Problem 6-1d');
xlabel('z');
ylabel('Probability density');
ylim([0 0.2]);
xlim([0 80]);

figure(5);
histogram(min(x,y), 'Normalization', 'pdf');
z = 0:0.1:10;
hold on; plot(z, 2 .* exp(-2 .* z)); hold off;
legend('Estimates', 'Analytical');
title('Problem 6-1e');
xlabel('z');
ylabel('Probability density');

figure(6);
histogram(max(x,y), 'Normalization', 'pdf');
z = 0:0.1:10;
hold on; plot(z, 2 .* exp(-z) .* (1 - exp(-z))); hold off;
legend('Estimates', 'Analytical');
title('Problem 6-1f');
xlabel('z');
ylabel('Probability density');

figure(7);
histogram(min(x,y) ./ max(x,y), 'Normalization', 'pdf');
z = 0:0.1:1;
hold on; plot(z, 2 ./ (1 + z).^2); hold off;
legend('Estimates', 'Analytical');
title('Problem 6-1g');
xlabel('z');
ylabel('Probability density');
