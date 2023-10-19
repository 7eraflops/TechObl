% First letter

first_letter_x=[1,1,2,3,3];
first_letter_y=[1,5,3,5,1];

figure(1)
    plot(first_letter_x,first_letter_y,"r",LineWidth=3)
    axis([0 8 0 6])
    title("Michał Charaszkiewicz")
    hold on

% Second letter

a=1.5;
b=2;

x0=5.5; 
y0=3;

t=1.7*pi:-0.01:0.3*pi;
x=x0+a*cos(t);
y=y0+b*sin(t);

figure(1)
    plot(x,y,"b",LineWidth=3)
