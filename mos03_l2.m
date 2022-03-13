function [ dx ] = mos03_l2( t, x,param)
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
dx(2, 1) =  - ((k0 + k1)*(x(1) - 2))/(m1 + m2) - (b1*x(2))/(m1 + m2)
dx(3, 1) = x(4);
dx(4, 1) = - (b2*x(4))/m2 - (k2*(x(3) - 3))/m2
dx(5, 1) = x(6);
dx(6, 1) = -(g*x(5))/6 