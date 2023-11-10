clear all; close all; clc;
leftbnd=-10;
rightbnd = 10;
n = 30;
chebychevgrid=@(leftbnd,rightbnd,n)leftbnd+((rightbnd-leftbnd)/2)*(cos(linspace(pi,0,n))+1);
a = chebychevgrid(leftbnd,rightbnd,n);
y=sin(a);
plot(a, y,'o')
hold on

sum=0;
for i=1:length(a)
    p=1;
    for j=1:length(a)
        if j~=i
            c = poly(a(j))/(a(i)-a(j));
            p = conv(p,c);
        end
    end
    sum= sum + p*y(i);
end

xq=linspace(leftbnd,rightbnd,1000);

yq=polyval(sum,xq);
plot(xq,yq,'k')
