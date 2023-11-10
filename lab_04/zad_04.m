clear all; close all; clc;
a=-10;
b=10;
x=linspace(a,b,30);
y=sin(x);
sum=0;
for i=1:length(x)
    p=1;
    for j=1:length(x)
        if j~=i
            c = poly(x(j))/(x(i)-x(j));
            p = conv(p,c);
        end
    end
    sum= sum + p*y(i);
end

xq=linspace(a,b,1000);
yq=polyval(sum,xq);
scatter(x,y)
hold on
plot(xq,yq)