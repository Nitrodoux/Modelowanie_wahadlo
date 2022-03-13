function [ dx ] = mos03_nl2( t, x,param)
m1 = param(1);
m2 = param(2);
g = param(3);
b1 = param(4);
b2 = param(5);
k0= param(6);
k1 = param(7);
k2 = param(8);

%% Wyznacz wymuszenie
u =1;
%2*sin(2*pi*t*0.5);
%% Oblicz pochodne
dx(1, 1) = x(2);
dx(2, 1) = -(x(1)*(k0 + k1) + b1*x(2) - k0*u)/(m1 + m2);
dx(3, 1) = x(4);
dx(4, 1) = (x(3)*m2*x(6)^2 + x(2)*m2*cos(x(5))*x(6) - b2*x(4) - k2*x(3) + (g*m2*cos(x(5)))/2)/m2;
dx(5, 1) = x(6);
dx(6, 1) = -(g*x(3)*sin(x(5)) - 2*x(4)*x(2)*cos(x(5)) + 2*x(6)*x(2)*x(3)*sin(x(5)))/(2*x(3)^2);
