clear;

trials = 10000;
n = 14;
p = 0.4;
k_values = 0:n;

myarray = zeros(n+1,1);     % the result of bernoulli range 0 - 14

for i=1:trials
    b = bernouli(n,p);
    myarray(b+1) = myarray(b+1) + 1;
end

myarray = myarray/trials;
myarray;

predicted = zeros(n+1,1);

for i=0:n
    predicted(i+1) = (factorial(n)/((factorial(n-i))*factorial(i)))*(p^(i))*((1-p)^(n-i));  % fundamental theorem
end

predicted;

figure(1); clf;
hold on;
stem(k_values,predicted,'b');
stem(k_values,myarray,'r');
hold off;

xlabel('k');
ylabel('p_n(k)');
legend('Predicted','Estimated');

sum(myarray(1:5))

sum(myarray(end-7:end))