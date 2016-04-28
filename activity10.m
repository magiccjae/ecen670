clear all;
close all;

trials = 100000
mu = 0;
sigma = sqrt(4);

x = normrnd(0,sigma,trials,1);
y = normrnd(0,sigma,trials,1);

z = abs(x-y);

z_estimate = 2*sigma/(sqrt(pi))
z_actual = mean(z)




x2 = exprnd(1,trials,1);
y2 = exprnd(1,trials,1);

z = (x2-y2).*(x2-y2>0);

z_estimate = mean(z)



lambda =2
x3 = exprnd(1/lambda,trials,1);
y3 = exprnd(1/lambda,trials,1);

z_estimate = 1/(2*lambda)
z_actual = mean(min(x3,y3))

z_estimate2 = 7/(3*lambda)
z_actual2 = mean(max(2*x3,y3))
