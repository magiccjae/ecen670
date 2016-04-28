trials = 100000;

x = random('Uniform',10,12,1,trials);
y = x.^3;

calc_ux = 11
calc_uy = 1342

est_ux = mean(x)
est_uy = mean(y)


x = random('Normal',0,1,1,trials);
calc_normal_skew = 0
est_normal_skew = skewness(x)

lamda = 3;
x = random('Exponential',lamda,1,trials);
calc_expo_skew = 2
est_expo_skew = skewness(x)