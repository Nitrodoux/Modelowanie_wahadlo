function [ dx ] = mos03_nl( t, x,param);
m1 = param(1);
m2 = param(2);
g = param(3);
b1 = param(4);
b2 = param(5);
k0= param(6);
k1 = param(7);
k2 = param(8);


%% Wyznacz wymuszenie
u = 0 * (t < 0.01);
%% Oblicz pochodne
dx(1, 1) = x(2);
dx(2, 1) = (-(k0 + k1)/(m1 + m2))*x(1) + (-(b2*sin(x(5))^2 + b1)/(m1 + m2))*x(2) + ((b2*sin(x(5)))/(m1 + m2))*x(4) + (k0*u)/(m1 + m2);
dx(3, 1) = x(4);
dx(4, 1) = x(4)*x(6)^2 + x(2)*cos(x(5))*x(6) + (g*cos(x(5)))/2 - (k2*x(3))/m2 - (b2*x(4))/m2 + (b2*x(2)*sin(x(5)))/m2;
dx(5, 1) = x(6)
dx(6, 1) = ((-2*sin(x(5)))*x(2)*x(3)*x(6) + (2*cos(x(5)))*x(2)*x(4) + (-g*sin(x(5)))*x(3))/(2*x(3)^2);
end

