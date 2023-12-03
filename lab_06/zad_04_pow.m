clear all;clc;close all;

% power
a=10;
b=1000;
x=linspace(0.1,5,a);
rnd=5*rand(1,a);
y=x.^2+rnd;

a1=(a*sum(log(x).*log(y))-sum(log(x))*sum(log(y)))/(a*sum(log(x).^2)-(sum(log(x)))^2);
a2=(sum(log(x).^2)*sum(log(y))-sum(log(x))*sum(log(x).*log(y)))/(a*sum(log(x).^2)-(sum(log(x)))^2);
p1=[exp(a1),a2];

x_val=linspace(0,5,b);
y_val=p1(1)*x_val.^p1(2);
figure(1)
scatter(x,y)
hold on
plot(x_val,y_val)

