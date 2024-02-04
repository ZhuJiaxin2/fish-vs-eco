clear;close;clc
i = 0;
for Malerate = 1:1:90
    i = i + 1;
%     N_larval(i) = 0.0063 * Malerate - 0.1582; % 线性
    N_larval(i) = -0.0000965 * Malerate ^ 2 + 0.0154956 * Malerate - 0.3658665;
    N_juvenile(i) = juvenile_density(N_larval(i));
end

matrix = deathnum(N_juvenile);

x_values = 0.01:0.01:0.9;

% 绘制每组数据的曲线
figure;
hold on;

for i = 1:size(matrix, 1)
    plot(x_values ./ (1 - x_values), matrix(i, :), 'DisplayName', ['Curve ' num2str(i)]);
end

% 添加标题和标签
title('Individual Curves from a 37x11 Matrix');
xlabel('X');
ylabel('Y');
legend('show');
hold off;

% 绘制平均曲线
figure;
average_curve = mean(matrix, 1);
xxx = x_values ./ (1 - x_values);
plot(xxx, average_curve, 'LineWidth', 2, 'DisplayName', 'Average Curve');

% 添加标题和标签
title('Average Curve from a 37x11 Matrix');
xlabel('X');
ylabel('Y');
legend('show');
