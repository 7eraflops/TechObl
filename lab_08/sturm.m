close all;clc;clear;
syms x
range = [-100, 100];
degree = 5;
coefficients_f=randi([-5,5],1,degree+1);

f = poly2sym(coefficients_f,x);
funcs=[f, diff(f,x)];

for n=3:(degree+1)
    funcs(n)=-1.*polynomialReduce(funcs(n-2),funcs(n-1));
end

val_lo=double(subs(funcs,x,range(1)));
val_hi=double(subs(funcs,x,range(2)));
changes_lo=numel(find(diff(sign(val_lo))));
changes_hi=numel(find(diff(sign(val_hi))));

number_of_real_zeros=changes_lo-changes_hi

figure(1)
axis([-5 5 -20 20])
hold on
grid on
fplot(funcs)
legend("AutoUpdate","on")