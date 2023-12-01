clear all;clc;close all;
a=10;
b=1000;
x=linspace(0.1,20,a);
rnd=10*rand(1,a);
y=2*x+2*rnd;

p1=polyfit(x,y,1);
p2=polyfit(x,y,2);
p3=polyfit(x,y,3);
p9=polyfit(x,y,9);

x_val=linspace(0,20,b);

figure(1)
subplot(2,2,1)
scatter(x,y)
hold on
plot(x_val,polyval(p1,x_val))
subplot(2,2,2)
scatter(x,y)
hold on
plot(x_val,polyval(p2,x_val))
subplot(2,2,3)
scatter(x,y)
hold on
plot(x_val,polyval(p3,x_val))
subplot(2,2,4)
scatter(x,y)
hold on
plot(x_val,polyval(p9,x_val))