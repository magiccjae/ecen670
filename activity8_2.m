clear all;
close all;

a = 2;
x = a.*rand(1, 10000);
y = a.*rand(1, 10000);
%%
z1 = x./y;

v1a = 0:.05:1;
v1b = 1:.05:5;
fz1_a = 0.5*ones(1, length(v1a));
fz1_b = 0.5*(1./v1b.^2);

figure;
histogram(z1, 'Normalization', 'pdf');
hold on;
plot(v1a, fz1_a, '-r', v1b, fz1_b, '-r');
xlim([0, 5]);

%%

z2 = y./(x+y);

va = .5:0.05:1;
vb = 0:0.05:0.5;
fz2_a = 0.5*(1./va.^2);
fz2_b = 0.5*(1./(1-vb).^2);

figure;
histogram(z2, 'Normalization', 'pdf');
hold on;
plot(va, fz2_a, '-r', vb, fz2_b, '-r');

%% 
z3 = abs(x-y);

v3 = 0:0.1:a;
fz3 = 2/a*(1-v3/a);

figure;
histogram(z3, 'Normalization', 'pdf');
hold on;
plot(v3, fz3);

%%
x = normrnd(0,1, [1, 100000]);
y = normrnd(0,1, [1, 100000]);

z4 = sqrt(x.^2 + y.^2);
v4 = 0:0.05:10;
fz4 = v4.*exp(-v4.^2/2);

figure;
histogram(z4, 'Normalization', 'pdf');
hold on;
plot(v4, fz4);

%%
z5 = x.^2 + y.^2;
v5 = 0:0.05:10;
fz5 = 0.5*exp(-v5/2);

figure;
histogram(z5, 'Normalization', 'pdf');
hold on;
plot(v5, fz5);

%%
z6 = x - y;
v6 = -10:0.1:10;
fz6 = 1/(2*sqrt(pi))*exp(-v6.^2/4);

figure;
histogram(z6, 'Normalization', 'pdf');
hold on;
plot(v6, fz6);
