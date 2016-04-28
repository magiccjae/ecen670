clear; close all; clc;

trials = 1e7;
p = 1/1e4;
n = 1e5;
poisson = random('bino',1,p,trials,1);

H = [1/2 -1/2];
shot_noise = conv(H,poisson);
figure(1);
stem(shot_noise(1:1e5));
mean(shot_noise)
maxlags = 100;

[Ryy,lags] = xcorr(shot_noise,maxlags,'unbiased');
Ryydft = abs(fft(Ryy));

figure(2);
plot(linspace(0,2,length(Ryydft)), Ryydft); 
xlabel('Frequency [\pi]'); 
title('Power spectral density S_{Y} for random variable Y'); 


% part e
H = [1 -1];
shot_noise = conv(H,poisson);
figure(3);
stem(shot_noise(1:1e5));
mean(shot_noise)
maxlags = 100;

[Ryy,lags] = xcorr(shot_noise,maxlags,'unbiased');
Ryydft = abs(fft(Ryy));

figure(4);
plot(linspace(0,2,length(Ryydft)), Ryydft); 
xlabel('Frequency [\pi]'); 
title('Power spectral density S_{Y} for random variable Y'); 
