%% Dane

k1=1;
k0=2;
k2=3;
b1=1;
b2=2;
g=9.81;
m1=4;
m2=2;

%% Czas symulacji
t = [0:0.1:20];

%% Warunki poczatkowe
t0 = [0 0 1 0 0.1 0]';

%% Rozwiazanie dla systemu nieliniowego
options = odeset('RelTol', 1e-3, 'AbsTol', 1e-3);
[t, x] = ode23s(@mos03_nl2, t, t0, options, [m1 m2 g b1 b2 k0 k1 k2 ]);

figure(1);
subplot(2,1,1)
plot(t, x(:,1),t, x(:,3),t, x(:,5) )
title('Wykres przemieszczeñ uk³adu nieliniowego')
xlabel('Czas [s]')
ylabel('Przemieszczenie ')
legend('x [m]','l [m]','\theta [rad]')
subplot(2,1,2)
plot(t, x(:,2),t, x(:,4),t, x(:,6) )
title('Wykres prêdkoœci uk³adu nieliniowego')
xlabel('Czas [s]')
ylabel('Prêdkoœæ')
legend('dx [m/s]','dl [m/s]','d\theta [rad/s]')
figure(3);
subplot(2, 1, 1);
plot(t, x(:, :));
legend('x', 'dx','l','dl', '\theta', 'd\theta');
title('OdpowiedŸ uk³adu nieliniowego')

%% Rozwiazanie dla systemu liniowego
options = odeset('RelTol', 1e-3, 'AbsTol', 1e-3);
[t, x] = ode45(@mos03_l2, t, t0, options, [m1 m2 g b1 b2 k0 k1 k2 ]);

figure(2);
subplot(2,1,1)
plot(t, x(:,1),t, x(:,3),t, x(:,5) )
title('Wykres przemieszczeñ uk³adu liniowego')
xlabel('Czas [s]')
ylabel('Przemieszczenie ')
legend('x [m]','l [m]','\theta [rad]')
subplot(2,1,2)
plot(t, x(:,2),t, x(:,4),t, x(:,6) )
title('Wykres prêdkoœci uk³adu liniowego')
xlabel('Czas [s]')
ylabel('Prêdkoœæ')
legend('dx [m/s]','dl [m/s]','d\theta [rad/s]')

figure(3);
subplot(2, 1, 2);
plot(t, x(:, :));
legend('x', 'dx','l','dl', '\theta', 'd\theta');
title('OdpowiedŸ uk³adu liniowego')


