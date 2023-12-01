clear all; clc; close all;

tolerance = 1*10^(-10);
max_iterations=100;
a=1;
b=8;
s=(a+b)/2;
iteration_count=0;

tic
while(abs(f(s))>tolerance && iteration_count<max_iterations)
    if(f(s)*f(a)<0)
        b=s;
    end
    if(f(s)*f(b)<0)
        a=s;
    end
    s=(a+b)/2;
    iteration_count=iteration_count+1;
end
toc

iteration_count
x_zero=s
error=abs(f(s))

tic
x0=fzero(@(x) f(x),s)
toc

x=linspace(-10,10,1001);
figure(1)
plot(x,f(x))
grid on
hold on;
scatter(s,f(s))
xlabel("x")
ylabel("y")
title("finding zeros with the bisection method")
legend("function","zero")
