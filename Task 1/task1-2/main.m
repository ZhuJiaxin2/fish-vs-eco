clear;close;clc
i = 0;
for Malerate = 0:10:100
    i = i + 1;
    N_larval(i) = 47.459 * Malerate + 40.89;
    N_juvenile(i) = juvenile_density(N_larval(i));
end

matrix = deathnum(N_juvenile);

x_values = 0:10:100;

% 绘制每组数据的曲线
figure;
hold on;

for i = 1:size(matrix, 1)
    plot(x_values, matrix(i, :), 'DisplayName', ['Curve ' num2str(i)]);
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
plot(x_values, average_curve, 'LineWidth', 2, 'DisplayName', 'Average Curve');

% 添加标题和标签
title('Average Curve from a 37x11 Matrix');
xlabel('X');
ylabel('Y');
legend('show');
