a = -1;
b = 2;
c = 3;
coefficients = [a, b, c];
x = linspace(-5, 5, 2000);
delta = b ^ 2 - 4 * a * c

x_1 = (-1 * b + sqrt(delta)) / (2 * a)
x_2 = (-1 * b - sqrt(delta)) / (2 * a)
y_1 = a * x_1 ^ 2 + b * x_1 + c
y_2 = a * x_2 ^ 2 + b * x_2 + c
zeros = [x_1, y_1; x_2, y_2];

y = a * x .^ 2 + b * x + c;

y_m = polyval(coefficients, x);

r = roots(coefficients);

figure(1)
plot(x, y, 'y', 'LineWidth', 2)
hold on
plot(zeros(:, 1), zeros(:, 2), 'ro')

grid on
xlabel("x")
ylabel("y")
title("-x^{2}+2x+3")

plot(x, y_m, 'r--')
