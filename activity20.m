close all; clc; clear;
arrival_rate = 10^4;
p = 1/arrival_rate;
n = 10^5;
trials = 10^7;

% part A
figure(1);
bern = random('bino',1,p,trials,1);
stem(bern(1:n));


% part D
figure(2); hold on;
events = find(bern(1:trials));
differences = diff(events);
histogram(differences,'Normalization','pdf');
expo = exppdf(0:n,10^4);
plot(expo);
legend('estimate', 'actual');
xlabel('time difference');
ylabel('pdf');
xlim([0 10^5]);
ylim([0 1.5*10^-4]);


% part E
p = 1/1e4;
n = 1e5;
geo = random('geo',p,n,1);      % how many trials needed for one success
geometric = zeros(trials,1);
index_of_arrivals = cumsum(geo);
index_less_than_trials = find(index_of_arrivals < trials);
number_of_arrivals = max(index_less_than_trials);

for i=1:number_of_arrivals
    geometric(index_of_arrivals(i)) = 1;
end
figure(3);
stem(geometric(1:n));

% part F
combined = bern + geometric;
combined_index = find(combined == 1);
combined_difference = diff(combined_index);
figure(4); hold on;
histogram(combined_difference,'Normalization','pdf');
expo2 = exppdf(0:n,0.5*10^4);
plot(expo2);
legend('estimate', 'actual');
xlabel('time difference');
ylabel('pdf');
