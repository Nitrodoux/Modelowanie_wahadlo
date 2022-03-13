%deklaracja zmiennych symbolicznych
syms ddx ddl ddth dx dth dl l x th k1 k0 k2 b1 b2 g m1 m2 u;
%prêdkoœæ v2
v2i2=(dx+dth*l*cos(th)+dl*sin(th))^2;
v2j2=(dth*l*sin(th)-dl*cos(th))^2;
v22=v2i2+v2j2;
%lagrangan
K=(1/2)*(m1*dx^2+m2*((dx+dth*l*cos(th)+dl*sin(th))^2+(dth*l*sin(th)-dl*cos(th))^2))
U=(1/2)*(k0*(x)^2+k1*x^2+k2*l^2-m2*g*l*cos(th))
D=(1/2)*(b1*dx^2+b2*dl^2)
L=K-U
%% pochodne dL/dq_d
L_dx=diff(L,dx)
L_dl=diff(L,dl)
L_dth=diff(L,dth)
%% pochodne dL/dq
L_x=diff(L,x)
L_l=diff(L,l)
L_th=diff(L,th)
%% dD/dq_doth
D_dx=diff(D,dx)
D_dl=diff(D,dl)
D_dth=diff(D,dth)
%% Uproszczenia
L_dx1=simplify(diff(L,dx))
L_dl1=simplify(diff(L,dl))
L_dth1=simplify(diff(L,dth))
%%
L_x1=simplify(diff(L,x))
L_l1=simplify(diff(L,l))
L_th1=simplify(diff(L,th))
%%
D_dx1=simplify(diff(D,dx))
D_dl1=simplify(diff(D,dl))
D_dth1=simplify(diff(D,dth))
%% pochodne d/dth dL/dq_doth
dLdx1=ddx*(m1+m2)
dLdl1=m2*ddl
dLdth1=l^2*m2*ddth
%% Pe³ne lagrangany
L1=dLdx1-L_x1+D_dx1-k0*u
L2=dLdl1-L_l1+D_dl1
L3=dLdth1-L_th1+D_dth1
%% Wyznaczenie drugich pochodnych
L11=solve(L1,ddx)
L22=solve(L2,ddl)
L33=solve(L3,ddth)
%% Uporz¹dkowanie
collect(L11,[x dx l dl th dth])
collect(L22,[x dx l dl th dth])
collect(L33,[x dx l dl th dth])
%% Linearyzacja uk³adu
%okreœlenie wektora zmiennych stanu
syms ddx ddl ddth dx dth dl l x th k1 k0 k2 b1 b2 g m1 m2 u x1 x2 x3 x4 x5 x6;
x=[x1,x2,x3,x4,x5,x6];
%okreœlenie funkcji zmiennych stanu
f(1) = x(2);
f(2) = -(x(1)*(k0 + k1) + b1*x(2) - k0*u)/(m1 + m2);
f(3) = x(4);
f(4) = (x(3)*m2*x(6)^2 + x(2)*m2*cos(x(5))*x(6) - b2*x(4) - k2*x(3) + (g*m2*cos(x(5)))/2)/m2;
f(5) = x(6);
f(6) = -(g*x(3)*sin(x(5)) - 2*x(4)*x(2)*cos(x(5)) + 2*x(6)*x(5)*x(3)*sin(x(6)))/(2*x(3)^2);
%% obliczenie pochodnych cz¹stkowych
for i=1:6
    for j=1:6
        A(i,j)=diff(f(i),x(j));
    end
end
%% okreœlenie punktów pracy
xz=2;
lz=3;
thz=0;
pp=[xz 0 lz 0 thz 0];
%Podstawienie punktów pracy do macierzy A
A=subs(A,x,pp);
% wyznaczenie rownan liniowych przy pomocy macierzy A
X=A*(x.'-pp.')
