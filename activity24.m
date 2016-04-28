% Activity Day 24
% Simuation of Wiener process by K-L expansion
clear all;

num_iterations = 1000;
T = 1;
t_steps = 100;
t = linspace(T/t_steps, T, t_steps);
s = 2;

step_noise = s .* (((rand(t_steps,num_iterations) > 0.5) .* 2) - 1);
w = cumsum(step_noise);

figure(1);
plot(repmat(t',1,100), w(:,1:100));

figure(2);
plot(t, var(w'))

%N = 100;
%for n = 1:N
%c_1 = sum(w * 
%t(1)
%t(100)

%return;


T = 10;
t = linspace(0, T, 60);
size(t)

N = 50;
alpha = 1;
s_squared = alpha * T;

w_t = 0 * t;
for iterations = 1:1000
    w_sum = 0*t;
    for n=-N:N
        omega_n = (2 * n + 1) * pi / (2 * T);
        lambda_n = alpha / (omega_n.^2);
        w_sum = w_sum + lambda_n * randn .* sin(omega_n .* t);
        %w_sum = w_sum + lambda_n * ((rand > 0.5) * 2 - 1) .* sin(omega_n .* t);
    end
    w_t(iterations,:) = sqrt(2/T) * w_sum;
end
size(w_t)

figure(1);
for k=1:1000
    plot(w_t(k,:), '.'); hold on;
end
hold off;

figure(2);
stem(mean(w_t))

figure(3);
plot(var(w_t));
hold on; plot(alpha * t); hold off;

%figure(3);
%plot(w_t);