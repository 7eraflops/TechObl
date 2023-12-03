clc; clear all; close all;

tols = logspace(-4, -16, 12);
times = [];
its = [];

for tolerance = logspace(-4, -16, 12)
    max_iterations = 100;
    a = 1;
    b = 8;
    s = (a + b) / 2;
    iteration_count = 0;

    tic

    while (abs(f(s)) > tolerance && iteration_count < max_iterations)

        if (f(s) * f(a) < 0)
            b = s;
        end

        if (f(s) * f(b) < 0)
            a = s;
        end

        s = (a + b) / 2;
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
