% problem 2
clear;
close all;
clc;

p = 0.5;
q = 1-p;
n = 1000;   % the number of steps in a random walk
T = 0.5;      % each time step length
t = n*T;
trials = 10000;
s = 1;
alpha = s^2/T;

x = cumsum((rand(n,trials)<p).*2*s-s);  % generate 10000 random walks. each column represent one random walk
y = cumsum((rand(n,trials)<p).*2*s-s);  
x_est = x(n,1:trials);      % end points of 10000 random walk
y_est = y(n,1:trials);
z_est = sqrt(x_est.^2+y_est.^2);

x_actual = 0:1:150;
z_actual = raylpdf(x_actual,sqrt(alpha*t));     % parameters: (x, std)

figure(1); hold on;
histogram(z_est,'normalization','pdf');  % estimated plot for z(rayleigh)
plot(z_actual);
legend('estimate','actual');
xlabel('z');
ylabel('pdf of z');