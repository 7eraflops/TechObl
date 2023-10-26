x = -100:0.01:100;
coefficients = [-2, 3, 6, -5];
y = polyval(coefficients, x);

figure(1)
plot(x, y, "k", LineWidth = 2)
grid on
title("y=-2x^3+3x^2+6x-5")
xlabel("x")
ylabel("y")
