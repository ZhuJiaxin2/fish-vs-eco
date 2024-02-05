% task1的main函数，输出各种宿主的死亡情况
clear;close;clc
i = 0;
for Malerate = 30:1:90
    i = i + 1;
    N_larval(i) = -0.0000965 * Malerate ^ 2 + 0.0154956 * Malerate - 0.3658665;
    N_juvenile(i) = juvenile_density(N_larval(i));
end

matrix = deathnum(N_juvenile);

x_values = 0.3:0.01:0.9;


figure;
hold on;

for i = 1:size(matrix, 1)
    plot(x_values ./ (1 - x_values), matrix(i, :));
end

xlabel('X');
ylabel('Y');
hold off;

figure;
average_curve = mean(matrix, 1);
xxx = x_values ./ (1 - x_values);
plot(xxx, average_curve, 'LineWidth', 2);

xlabel('X');
ylabel('Y');