clc; clear all; close all;

tols = logspace(-4, -16, 12);
times = [];
its = [];

for tolerance = logspace(-4, -16, 12)

    x_guess = 6;
    tolerance = 1 * 10 ^ (-10);
    max_iterations = 100;
    iteration_count = 0;

    syms x
    func = 2 * x .^ 2 - 10 * x + 6;
    d_func = diff(func);

    tic

    while (abs(double(subs(func, x, x_guess)) > tolerance && iteration_count < max_iterations))
        x_guess = x_guess - (double(subs(func, x, x_guess))) / (double(subs(d_func, x, x_guess)));
        iteration_count = iteration_count + 1;
    end

    test = toc;
    times = [times test];
    iteration_count;
    its = [its iteration_count];
end

figure(1)
subplot(1, 2, 1)
grid on
scatter(tols, its)
xlabel("tolerance")
ylabel("number of iterations")
set(gca, 'XDir', 'reverse')
set(gca, 'xscale', 'log')
subplot(1, 2, 2)
hold on
scatter(tols, times)
set(gca, 'XDir', 'reverse')
set(gca, 'xscale', 'log')
xlabel("tolerance")
ylabel("times")
