clear all;
close all;
clc;
f = @(x) sin(x);

N = 100000;
a = 0;
b = 2 * pi;
M = max(f(linspace(a, b)));
m = min(f(linspace(a, b)));

tic

for i = 1:N
    x_val = rand(1) * (b - a) + a;
    y_val = rand(1) * (M - m) + m;

    f_x = f(x_val);

    if y_val > 0

        if y_val < f_x
            under_pos(i, 1) = x_val;
            under_pos(i, 2) = y_val;
        else
            over(i, 1) = x_val;
            over(i, 2) = y_val;
        end

    else

        if y_val > f_x
            under_neg(i, 1) = x_val;
            under_neg(i, 2) = y_val;
        else
            over(i, 1) = x_val;
            over(i, 2) = y_val;
        end

    end

end

under_pos_nz(:, 1) = nonzeros(under_pos(:, 1));
under_pos_nz(:, 2) = nonzeros(under_pos(:, 2));

under_neg_nz(:, 1) = nonzeros(under_neg(:, 1));
under_neg_nz(:, 2) = nonzeros(under_neg(:, 2));

over_nz(:, 1) = nonzeros(over(:, 1));
over_nz(:, 2) = nonzeros(over(:, 2));

figure(1)
plot(over_nz(:, 1), over_nz(:, 2), 'y*')
hold on
plot(under_pos_nz(:, 1), under_pos_nz(:, 2), 'b*')
hold on
plot(under_neg_nz(:, 1), under_neg_nz(:, 2), 'r*')
title("monte carlo integration")
xlabel("x")
ylabel("y")
legend("over pos", "over neg", "under")

MC_integral = (length(under_pos_nz) - length(under_neg_nz)) / N * (M * (b - a))
toc
tic
MATLAB_integral = integral(f, a, b)
toc
MC_int_error = (abs(MATLAB_integral - MC_integral) / MATLAB_integral) * 100
