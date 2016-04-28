clear all;
%5-2
figure(1);
x = 0:0.1:5.1;
mu = 1/2;
lamda = 1/mu;
trials = 100000;

x_actual = pdf('exp',x,mu);
plot(x,x_actual,'b');
hold on;

x_estimate = exprnd(mu,trials,1);
[num,centers] = hist(x_estimate,x);

plot(centers,num/trials/(centers(2)-centers(1)),'rx');

y = -4*x+3;
y_actual = 0.5*exp((y-3)/2);
plot(y,y_actual,'b');

y_rand = -4*x_estimate+3;
[num1,centers1] = hist(y_rand,fliplr(y)); % Flip the bounds
plot(centers1, num1/trials/(centers1(2)-centers1(1)),'rx');
title('Problem 5-2');
ylim([0 2]);
xlim([-10 5]);
ylabel('Probability density per unit length');
xlabel('x');
legend('Actual Dentisy','Estimated Density');
hold off;



%5-12
figure(2);
bound = 2*pi;
x1 = -bound-pi/20:pi/20:bound+pi/20;
y1 = unifpdf(x1,-bound,bound);
plot(x1,y1,'b');
hold on;

rand_uniform = unifrnd(-bound,bound,trials,1);
[num2,centers2] = hist(rand_uniform,x1);

plot(centers2,num2/trials/(centers2(2)-centers2(1)),'rx');

x_uni = x1.^4;
x_uni = x_uni(ceil(length(x_uni)/2):length(x_uni));
y_uni = (1/(8*pi))*x_uni.^(-3/4);
plot(x_uni,y_uni,'b');


x2 = 0:pi/20:20*pi;
rand_uniform_y = rand_uniform.^4;
[num3,centers3] = hist(rand_uniform_y,x2);
plot(centers3,num3/trials/(centers3(2)-centers3(1)),'rx');
title('Problem 5-12');
ylim([0 0.25]);
xlim([-10 30]);
ylabel('Probability density per unit length');
xlabel('x');
legend('Actual Dentisy','Estimated Density');

hold off;






