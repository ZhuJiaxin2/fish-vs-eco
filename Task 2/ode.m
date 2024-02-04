clear;close;clc

ap = 1;
au = 1;
mp = 0.3;
mu = 0.7;
b = 0.5;
r = 10;

ode_system = @(t, y) [
    ap * mp * min(y(1), y(2)) + b * (y(3) - y(1));
    ap * (1 - mp) * min(y(1), y(2)) + b * (y(4) / r - y(2));
    au * mu * min(y(3), y(4)) + b * (y(1) - y(3));
    au * (1 - mu) * min(y(3), y(4)) + b * (y(2) * r - y(4))
];


tspan = [0 6]; % 从0到6年

y0 = [1; 1; 1; 1]; % 初值

% ode45
[t, y] = ode45(ode_system, tspan, y0);

figure;
plot(t, y);
xlabel('Time');
ylabel('Num');
legend('Npm', 'Npf', 'Num', 'Nuf');
title('env and sex rate');
