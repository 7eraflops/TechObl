clear all;clc;close all;
x=linspace(0.1,20,21);
rnd=1.5*rand(1,21);
y=log(x)+rnd;

p1=polyfit(x,y,1);
p2=polyfit(x,y,2);
p3=polyfit(x,y,3);
p6=polyfit(x,y,6);

figure(1)
subplot(2,2,1)
scatter(x,y)
hold on
plot(x,polyval(p1,x))
subplot(2,2,2)
scatter(x,y)
hold on
plot(x,polyval(p2,x))
subplot(2,2,3)
scatter(x,y)
hold on
plot(x,polyval(p3,x))
subplot(2,2,4)
scatter(x,y)
hold on
plot(x,polyval(p6,x))