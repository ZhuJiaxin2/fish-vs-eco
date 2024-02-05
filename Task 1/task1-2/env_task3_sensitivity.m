clear;close;clc
i = 0;
for Malerate = 40:2:100
    i = i + 1;
%     N_larval(i) = 0.0063 * Malerate - 0.1582; % 线性
    N_larval(i) = -0.0000965 * Malerate ^ 2 + 0.0154956 * Malerate - 0.3658665;
    N_juvenile(i) = juvenile_density(N_larval(i));
end

death = deathnum(N_juvenile);  % 每一行一种鱼

x_values = 0.4:0.02:1;
xxx = x_values ./ (1 - x_values);

% matrix = env_stability(death);

% %%%%%%%%%%
R = death;
[num, txt, raw] = xlsread('统计结果new.xlsx');
    P = num(:, 1);  % 物种占比，列
    P1 = P * 36985 - R;
    P2 = P1 ./ sum(P1); % 新占比
% log2(P1)
    H = - sum(P2 .* log2(P2));
    R_ave = mean(R);
    D = 0.5 * (H + 1 - tanh(R_ave));
    matrix = D;
% %%%%%%%%%%


%%%%%%%%%%%%% 生态稳定性对性别比例
Malerate1 = 0.4:0.02:1;
x_values = Malerate1 ./ (1 - Malerate1);
y_values = matrix;

% 计算数值导数
dy_dx = gradient(y_values, x_values);

figure;
plot(x_values, dy_dx, '-');
legend('数值导数');
xlabel('M/F');
ylabel('D');
title('生态稳定性对性别比例');
%%%%%%%%%%%%%


% figure;
% hold on;
% % plot(xxx, H);
% plot(xxx, matrix);