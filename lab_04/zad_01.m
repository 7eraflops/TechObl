x=linspace(1,10,10);
xq = linspace(1,10,1000);
y= @(x) 3*x.^2;
v=y(x);

figure(1)
subplot(2,1,1)
scatter(x,v)

subplot(2,1,2)
vq=interp1(x,v,xq,"linear");
plot(xq,vq,'r')
hold on

vq=interp1(x,v,xq,"spline");
plot(xq,vq,'b')
hold on

vq=interp1(x,v,xq,"nearest");
plot(xq,vq,'k')
hold off


x=[0,5,10];
y=[0,5,10];
[X,Y]=meshgrid(x,y);

xq=linspace(0,10,100);
yq=linspace(0,10,100);
[Xq,Yq]=meshgrid(xq,yq);

Z = X.^0.5 + Y.^0.5;


figure(2)
subplot(2,2,1)
mesh(X,Y,Z)

subplot(2,2,2)
Zq=interp2(X,Y,Z,Xq,Yq,"linear");
surf(Xq,Yq,Zq)
hold on

subplot(2,2,3)
Zq=interp2(X,Y,Z,Xq,Yq,"spline");
surf(Xq,Yq,Zq)
hold on

subplot(2,2,4)
Zq=interp2(X,Y,Z,Xq,Yq,"nearest");
surf(Xq,Yq,Zq)
hold on



