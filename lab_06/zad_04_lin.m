clear all;clc;close all;

% linear
a=10;
b=1000;
x=linspace(0,20,a);
rnd=5*rand(1,a);
y=2*x+rnd;

x_val=linspace(0,20,b);

a1=(a*sum(x.*y)-sum(x)*sum(y))/(a*sum(x.^2)-(sum(x))^2);
a2=(sum(x.^2)*sum(y)-sum(x)*sum(x.*y))/(a*sum(x.^2)-(sum(x))^2);
p1=[a1,a2];

figure(1)
scatter(x,y)
hold on
plot(x_val,polyval(p1,x_val))

