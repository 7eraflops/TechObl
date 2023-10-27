f = @(x) sin(x);
dx = 0.3;
x = 0:dx:2 * pi;

% metoda prostokatow

tic
C_1 = sum(f(x)) * dx
toc
figure(1)
fplot(f, [0, 2 * pi])
hold on

for i = 1:2:(2 * pi / dx)
    line([x(i), x(i)], [0, f((x(i)))])
    line([x(i), x(i + 1)], [f((x(i))), f((x(i)))])
    line([x(i + 1), x(i + 1)], [0, f((x(i)))])

end

% metoda trapezów

tic
C_2 = (sum(f(x)) - (f(x(1)) - f(x(end))) / 2) * dx
toc

% matlab

tic
C_3 = integral(f, x(1), x(end))
toc

tic
C_4 = quad(f, x(1), x(end))
toc
