% problem 1
clear;
close all;
clc;

p = 0.5;
q = 1-p;
n = 1000;
trials = 10000;
s = 0.1;

x = cumsum((rand(n,trials)<p).*2*s-s);  % generate 10000 random walks. each column represent one random walk.

figure(1);
hold on;
plot(x((1:n),1),'r');
plot(x((1:n),2),'b');
plot(x((1:n),3),'g');
plot(x((1:n),4));
plot(x((1:n),5));
hold off;

mean_sim = mean(x(n,(1:trials)))
mean_est = n*(p-q)*s
var_sim = var(x(n,(1:trials)))
var_est = 4*n*p*q*s^2
