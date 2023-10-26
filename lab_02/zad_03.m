syms x
y = piecewise(x < 2.5, (abs(x - 1) / (4 * x ^ 2 + 1)), x > 2.5, log((x + 1) ^ 4), 1);

figure(1)
fplot(y)
