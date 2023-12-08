clear;clc;close;
syms x y;
f = exp(-x^2 - y^2);
v = [x; y];
center_point = [1; 1];

GR = gradient(f,v);
HS = hessian(f,v);
taylor_series = ...
    subs(f, v, center_point) + ...
    transpose(GR) * (v - center_point) + ...
    0.5 * transpose((v - center_point)) * HS * (v - center_point);

figure(1)
hold on
grid on
axis([-5 5 -5 5 -5 5])
view(45,20)
fsurf(f, "r")
fsurf(taylor_series,"g")
scatter3(center_point(1),center_point(2),subs(f,v,center_point),'filled','o','LineWidth',4)
legend("f", "taylor series", "center point")