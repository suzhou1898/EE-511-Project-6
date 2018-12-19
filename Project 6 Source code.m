a=linspace(0,50,101);
Fx=zeros(1,100);
PMF=zeros(1,100);
M=100;
num_input=xlsread('Data Samples.xlsx');
for i=1:100
    num(i)=num_input(i);
    for j=1:100
        if(num(i)<a(j+1))
            Fx(j)=Fx(j)+1;
            if(num(i)>a(j))&&(num(i)<a(j+1))
                PMF(i)=(a(j)+a(j+1))/2;
            end
        end
    end
end
m=mean(num,2)
variance=var(num)
Fx=Fx/100;
figure(1);
histogram(PMF,'Normalization','probability','BinWidth',10);
title('The probability mass function')
ylabel('The value of PMF')
xlabel('The interval')
grid on
figure(2);
x=linspace(0,49.5,100);
plot(x,Fx);
grid on
title('The empirical distribution')
ylabel('The value of probability')
xlabel('The value taken on by x')
for i=1:M
    sample=randsample(num,M,1);
    mean_sample(i)=mean(sample);
    var_sample(i)=var(sample);
end
mean_sample
var_sample
var_mean=var(mean_sample)
 
MSE_m=0;
for i=1:M      
    MSE(i)=(mean_sample(i)-m)^2;
end
MSE_m=mean(MSE)
MSE_var=0;
for i=1:M
    MSE(i)=(var_sample(i)-variance)^2;
end
MSE_var=mean(MSE)
