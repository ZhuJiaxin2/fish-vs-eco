% 输出导数图像，分别取消注释得到灵敏度分析导数图像
clear;close;clc

i = 0;
for x = 0.1:0.01:1
    i = i + 1;
    sex(i) = num_sex(x);
    birth(i) = num_birth(x);
end

% x_values = 0.1:0.01:1;
% y_values = sex;
% 
% % 计算数值导数
% dy_dx = gradient(y_values, x_values);
% 
% figure;
% plot(x_values, dy_dx, '-');
% xlabel('x_values');
% ylabel('y_values');
% title('sex');

% x_values = 0.1:0.01:1;
% y_values = birth;
% 
% % 计算数值导数
% dy_dx = gradient(y_values, x_values);
% 
% figure;
% plot(x_values, dy_dx, '-');
% xlabel('x_values');
% ylabel('y_values');
% title('birth');

i = 0;
for x = 1:0.1:4
    i = i + 1;
    r(i) = num_r(x);
end

% x_values = 1:0.1:4;
% y_values = r;
% 
% % 计算数值导数
% dy_dx = gradient(y_values, x_values);
% 
% figure;
% plot(x_values, dy_dx, '-');
% xlabel('x_values');
% ylabel('y_values');
% title('r');


% x1 = 0.1:0.01:1;
% x2 = 1:0.1:4;
% 
% figure(1)
% plot(x1,sex);
% xlabel('sex');
% ylabel('sumnum');
% title('sex');
% figure(2)
% plot(x1,birth);
% xlabel('birth');
% ylabel('sumnum');
% title('birth');
% figure(3)
% plot(x2,r);
% xlabel('gamma');
% ylabel('sumnum');
% title('gamma');