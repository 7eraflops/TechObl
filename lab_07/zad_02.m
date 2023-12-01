close all; clc; clear all;
x_guess=6;
tolerance = 1*10^(-10);
max_iterations=100;
iteration_count=0;

syms x
func=2*x.^2-10*x+6
d_func=diff(func)

tic
while(abs(double(subs(func,x,x_guess))>tolerance && iteration_count<max_iterations))
    x_guess=x_guess-(double(subs(func,x,x_guess)))/(double(subs(d_func,x,x_guess)))
    iteration_count=iteration_count+1;
end
toc
iteration_count
x_zero=x_guess
error=abs(double(subs(func,x,x_guess)))

figure(1)
fplot(func)
grid on
hold on
scatter(x_guess, double(subs(func,x,x_guess)))
xlabel("x")
ylabel("y")
title("finding zeros with the newthon method")
legend("function","zero")