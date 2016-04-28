clear all;
close all;

trial = 10000;

x = zeros(trial,1);
y = zeros(trial,1);

for i=1:trial
    x(i) = random('Uniform',0,1);
    y(i) = random('Uniform',0,1);
end
figure(1);
scatter(x,y);

a = 2;
b = 1;
c = 1;
d = 2;
z = a*x+b*y;
w = c*x+d*y;

mark = [a b; c d];

jacobian1 = det(mark);
figure(2);
scatter(z,w);


a = 2;
b = 1;
c = 1;
d = 1;
z = a*x+b*y;
w = c*x+d*y;

jae = [a b; c d];

jacobian2 = det(jae);
figure(3);
scatter(z,w);


a = 1;
b = 0;
c = 0;
d = 1;
z = a*x+b*y;
w = c*x+d*y;

mazzeo = [a b; c d];

jacobian3 = det(mazzeo);
figure(4);
scatter(z,w);


a = 0.5;
b = 1;
c = 1;
d = 0.5;
z = a*x+b*y;
w = c*x+d*y;

mitch = [a b; c d];

jacobian4 = det(mitch);
figure(5);
scatter(z,w);


a = 2;
b = 2;
c = 2;
d = 2;
z = a*x+b*y;
w = c*x+d*y;

jeffs = [a b; c d];

jacobian5 = det(jeffs);
figure(6);
scatter(z,w);