% Output derivative plots; Uncomment to get sensitivity analysis derivative plots
clear; close; clc

i = 0;
for x = -0.1:0.01:0.15
    i = i + 1;
    sex(i) = num_sex(x);
    birth(i) = num_birth(x);
end

x_values = (-0.1:0.01:0.15) + 1;
y_values = birth;

% Numerical derivative calculation
dy_dx = gradient(y_values, x_values);

figure;
plot(x_values, dy_dx, '-');
xlabel('x_values');
ylabel('y_values');
title('Birth Sensitivity Analysis');

x_values = -0.1:0.01:0.15 + 1;
y_values = birth;

figure;
% Numerical derivative calculation
x_values = (-0.1:0.01:0.15) + 0.8;
y_values = sex;
dy_dx = gradient(y_values, x_values);

figure;
plot(x_values, dy_dx, '-');
xlabel('x_values');
ylabel('y_values');
title('Sex Sensitivity Analysis');

% x_values = 0.1:0.01:1;
% y_values = birth;
% 
% % Numerical derivative calculation
% dy_dx = gradient(y_values, x_values);
% 
% figure;
% plot(x_values, dy_dx, '-');
% xlabel('x_values');
% ylabel('y_values');
% title('Birth Sensitivity Analysis');

i = 0;
for x = 0.2:0.1:6
    i = i + 1;
    r(i) = num_r(x);
end

x_values = 0.2:0.1:6;
y_values = r;

% Numerical derivative calculation
dy_dx = gradient(y_values, x_values);

figure;
plot(x_values, dy_dx, '-');
xlabel('x_values');
ylabel('y_values');
title('R Sensitivity Analysis');

% x1 = 0.1:0.01:1;
% x2 = 1:0.1:4;
% 
% figure(1)
% plot(x1,sex);
% xlabel('Sex');
% ylabel('Sumnum');
% title('Sex');
% figure(2)
% plot(x1,birth);
% xlabel('Birth');
% ylabel('Sumnum');
% title('Birth');
% figure(3)
% plot(x2,r);
% xlabel('Gamma');
% ylabel('Sumnum');
% title('Gamma');
% Commented in English

% plot(x2,r);
% xlabel('gamma');
% ylabel('sumnum');
% title('gamma');
