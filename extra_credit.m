clear; close all; clc;

% C = 10^-6;
% R = @(fc) 1/(2*pi*fc*C);
% 
% f_actual = 175;
% R_actual = R(f_actual);
% 
% 
% num = [R_actual 0];
% den = [R_actual 10^6];
% H = tf(num,den);
% 
% t = linspace(0,2,100);
% v_in = sin(f_actual*pi*t);
% 
% figure(1);
% plot(t,v_in);
