clear;close;clc

ap = 1;
au = 0.75;
mp = 0.4;
mu = 0.8;
% mp = 0.5;
% mu = 0.5;
b = 0.3;
r = 3;

ode_system = @(t, y) [
    ap * mp * min(y(1), y(2)) + b * (y(3) - y(1));
    ap * (1 - mp) * min(y(1), y(2)) + b * (y(4) / r - y(2));
    ap * (1 - mp) * min(y(1), y(2)) + b * (y(4) / r - y(2));
    au * mu * min(y(3), y(4)) + b * (y(1) - y(3));
    au * (1 - mu) * min(y(3), y(4)) + b * (y(2) * r - y(4));
    ap * (1 - mp) * min(y(1), y(2)) + b * (y(6) - y(5));
    au * (1 - mu) * min(y(3), y(4)) + b * (y(5) - y(6));
];


tspan = [0 6]; % 从0到6年

y0 = [1.5; 1.5; 1; 1.5; 1; 1]; % 初值

% ode45
[t, y] = ode45(ode_system, tspan, y0);

y = [y(:, 1), y(:, 5), y(:, 2), y(:, 6)];

figure;
plot(t, y);
xlabel('Time');
ylabel('Num');
legend('Npm', 'Npf', 'Num', 'Nuf');
title('env and sex rate');

disp(sum(y(end, :)))
