clear; close all; clc;

repetitions = 10000;
P_FA = 1e-2; % This is the probability of a false alarm

s = [1 2 3 4 3 2 1]' % Signal that we will detect in noise
N = length(s)
E_s = s.' * s; % Energy of signal

mu_1 = 0.5; % The model is x = mu * s + sigma * W (noise)
mu_0 = 0;
sigma = 2;

vSNR = mu_1/sigma * sqrt(E_s) % Signal to Noise ratio

m_0 = norminv(1 - P_FA, 0, 1) % Threshold to be set
P_D_m = 1 - normcdf(m_0 - vSNR) % Probability of detection

count_1_m = 0;
for counter = 1:repetitions

 w = mvnrnd([0 0 0 0 0 0 0], eye(N), 1)'; % White noise
 x = mu_0 * s + sigma * w; % No signal - just additive noise
 m = s.' * x / (sigma * sqrt(s.' * s)); % Test statistic
 count_1_m = count_1_m + (m > m_0);

end
est_P_FA_m = count_1_m / repetitions % Estimated probability of false alarm
count_1_m = 0;
for counter = 1:repetitions

 w = mvnrnd([0 0 0 0 0 0 0], eye(N), 1)'; %W White noise
 x = mu_1 * s + sigma * w; % Signal with additive noise
 m = s.' * x / (sigma * sqrt(s.' * s)); % Test statistic
 count_1_m = count_1_m + (m > m_0);
end
est_P_D_m = count_1_m / repetitions % Estimated probability of detection
