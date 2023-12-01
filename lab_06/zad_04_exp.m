clear all;clc;close all;

% power
a=10;
b=1000;
x=linspace(0.1,1,a);
rnd=rand(1,a);
y=exp(0.5*x);

z=log(y);

a1=(a*sum(x.*z)-sum(x)*sum(z))/(a*sum(x.^2)-(sum(x))^2);
a2=(sum(x.^2)*sum(z)-sum(x)*sum(x.*z))/(a*sum(x.^2)-(sum(x))^2);
p1=[exp(a2),a1];

x_val=linspace(0,1,b);
y_val=p1(1)*exp(p1(2)*x_val);
figure(1)
scatter(x,y)
hold on
plot(x_val,y_val)

