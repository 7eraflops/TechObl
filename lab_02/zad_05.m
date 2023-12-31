[X, Y] = meshgrid(-5:5);
F_1 = sin(X) + cos(Y);
F_2 = exp(-1 * X .^ 2) + exp(-1 * (Y .^ 2));
F_3 = X .^ 2 + Y .^ 2;
figure(1)

subplot(3, 1, 1)
surf(X, Y, F_1)
title("sin(x)+cos(x)")

subplot(3, 1, 2)
surf(X, Y, F_2)
title("e")

subplot(3, 1, 3)
surf(X, Y, F_3)
