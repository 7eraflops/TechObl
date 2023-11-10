a=1;
b=10;
x1=linspace(a,b,5);
x2=linspace(a,b,10);
x3=linspace(a,b,20);

xq=linspace(a,b,1000);

v1=sqrt(x1);
v2=sqrt(x2);
v3=sqrt(x3);

figure(1)
subplot(1,3,1)

v1q=interp1(x1,v1,xq,'linear');
plot(xq,v1q,'r')
hold on

v1q=interp1(x1,v1,xq,'spline');
plot(xq,v1q,'b')
hold on

v1q=interp1(x1,v1,xq,'nearest');
plot(xq,v1q,'k')
hold on

subplot(1,3,2)

v2q=interp1(x2,v2,xq,'linear');
plot(xq,v2q,'r')
hold on

v2q=interp1(x2,v2,xq,'spline');
plot(xq,v2q,'b')
hold on

v2q=interp1(x2,v2,xq,'nearest');
plot(xq,v2q,'k')
hold on

subplot(1,3,3)

v3q=interp1(x3,v3,xq,'linear');
plot(xq,v3q,'r')
hold on

v3q=interp1(x3,v3,xq,'spline');
plot(xq,v3q,'b')
hold on

v3q=interp1(x3,v3,xq,'nearest');
plot(xq,v3q,'k')
hold on


