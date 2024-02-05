clear;close;

ap = 1;
au = 0.4;
mp = 0.4;
mu = 0.8;
b = 0.4;
r = 4;

ode_system = @(t, y) [
    ap * mp * min(y(1), y(2)) + b * (y(3) - y(1)); %Npm
    ap * (1 - mp) * min(y(1), y(2)) + b * (y(4) / r - y(2));
    au * mu * min(y(3), y(4)) + b * (y(1) - y(3)); %Num
    au * (1 - mu) * min(y(3), y(4)) + b * (y(2) * r - y(4));
    ap * (1 - mp) * min(y(1), y(2)) + b * (y(6) - y(5)); %Npf
    au * (1 - mu) * min(y(3), y(4)) + b * (y(5) - y(6)); %Nuf
];


tspan = [0 6]; % 从0到6年

y0 = [1.5; 1.5; 1; 1; 1.5; 1]; % 初值

% ode45
[t, y] = ode45(ode_system, tspan, y0);

y_pic = [y(:,1), y(:,3), y(:,5), y(:,6)];
figure;
plot(t, y_pic);
xlabel('Time');
ylabel('Num');
legend('Npm', 'Num', 'Npf', 'Nuf');
title('env and sex rate');
figure;
plot(t, sum(y_pic, 2))

writematrix([t, y_pic, sum(y_pic, 2)], "自然资源与性别比数据.xlsx", "Range", "A:F")

disp(sum(y_pic(end, :)))

ap = 0.7;
au = 0.7;
mp = 0.4;
mu = 0.8;
b = 0.4;
r = 1;

ode_system = @(t, y) [
    ap * mp * min(y(1), y(2)) + b * (y(3) - y(1)); %Npm
    ap * (1 - mp) * min(y(1), y(2)) + b * (y(4) / r - y(2));
    au * mu * min(y(3), y(4)) + b * (y(1) - y(3)); %Num
    au * (1 - mu) * min(y(3), y(4)) + b * (y(2) * r - y(4));
    ap * (1 - mp) * min(y(1), y(2)) + b * (y(6) - y(5)); %Npf
    au * (1 - mu) * min(y(3), y(4)) + b * (y(5) - y(6)); %Nuf
];

[t, y] = ode45(ode_system, tspan, y0);

y_pic = [y(:,1), y(:,3), y(:,5), y(:,6)];
figure;
plot(t, y_pic);
figure;
plot(t, sum(y_pic, 2))

writematrix([t, y_pic, sum(y_pic, 2)], "自然资源与性别比数据.xlsx", "Range", "G:L")

clear;close;

ap = 1;
au = 0.4;
mp = 0.5;
mu = 0.5;
b = 0.4;
r = 4;

ode_system = @(t, y) [
    ap * mp * min(y(1), y(2)) + b * (y(3) - y(1)); %Npm
    ap * (1 - mp) * min(y(1), y(2)) + b * (y(4) / r - y(2));
    au * mu * min(y(3), y(4)) + b * (y(1) - y(3)); %Num
    au * (1 - mu) * min(y(3), y(4)) + b * (y(2) * r - y(4));
    ap * (1 - mp) * min(y(1), y(2)) + b * (y(6) - y(5)); %Npf
    au * (1 - mu) * min(y(3), y(4)) + b * (y(5) - y(6)); %Nuf
];


tspan = [0 6]; % 从0到6年

y0 = [1.5; 1.5; 1; 1; 1.5; 1]; % 初值

% ode45
[t, y] = ode45(ode_system, tspan, y0);

y_pic = [y(:,1), y(:,3), y(:,5), y(:,6)];
figure;
plot(t, y_pic);
xlabel('Time');
ylabel('Num');
legend('Npm', 'Num', 'Npf', 'Nuf');
title('env and sex rate');
figure;
plot(t, sum(y_pic, 2))

writematrix([t, y_pic, sum(y_pic, 2)], "自然资源与性别比数据.xlsx", "Range", "M:R")

disp(sum(y_pic(end, :)))

ap = 0.7;
au = 0.7;
mp = 0.5;
mu = 0.5;
b = 0.4;
r = 1;

ode_system = @(t, y) [
    ap * mp * min(y(1), y(2)) + b * (y(3) - y(1)); %Npm
    ap * (1 - mp) * min(y(1), y(2)) + b * (y(4) / r - y(2));
    au * mu * min(y(3), y(4)) + b * (y(1) - y(3)); %Num
    au * (1 - mu) * min(y(3), y(4)) + b * (y(2) * r - y(4));
    ap * (1 - mp) * min(y(1), y(2)) + b * (y(6) - y(5)); %Npf
    au * (1 - mu) * min(y(3), y(4)) + b * (y(5) - y(6)); %Nuf
];

[t, y] = ode45(ode_system, tspan, y0);

y_pic = [y(:,1), y(:,3), y(:,5), y(:,6)];
figure;
plot(t, y_pic);
figure;
plot(t, sum(y_pic, 2))

writematrix([t, y_pic, sum(y_pic, 2)], "自然资源与性别比数据.xlsx", "Range", "S:X")