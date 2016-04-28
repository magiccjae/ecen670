clear all;
close all;

n = 10:1:100;
p = [0.2,0.3,0.4,0.5];

result = kld(p,n);
plot(n,result,'linewidth',2);
legend('p=0.2','p=0.3','p=0.4','p=0.5');
xlabel('n');
ylabel('Kullback-Leibler Divergence');