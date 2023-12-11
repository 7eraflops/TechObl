clear;close all;clc
syms x y
v = [x; y];
f = x^3 + y^3 - 4;
guess = randi([-10, 10],2,1);
zero_point = guess;
tolerance=10^(-15);

HS=hessian(f,v);
GR=gradient(f,v);

while(double(subs(f,v,zero_point))>tolerance)
    zero_point=zero_point-(subs(HS,v,zero_point))^(-1)*subs(GR,v,zero_point);
end

zero_point=double(zero_point);
figure(1)
hold on
grid on
view(45, 20)
fsurf(f,'g')
fmesh(0,'b')
scatter3(guess(1),guess(2),subs(f,v,guess),'filled','r','LineWidth',4')
scatter3(zero_point(1),zero_point(2),subs(f,v,zero_point),'filled','y','LineWidth',4')
legend("f(x,y)","zero plane","initial guess","zero point")