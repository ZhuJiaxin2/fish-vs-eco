clear;close;clc
i = 0;
for r = 30:5:90
    i = i + 1;
    N_larval(i) = -0.0000965 * r ^ 2 + 0.0154956 * r - 0.3658665;
    N_juvenile(i) = juvenile_density(N_larval(i));
end

table = readtable('t1b.xlsx');
den = table2array(table(:, 3)); 
M = table2array(table(:, 2));
x = 30:5:90;
plot(M, den, '*');
hold on
plot(x, N_larval);
plot(x, N_juvenile);

writematrix([x', N_larval', N_juvenile'], "二次函数拟合雄性比例-未成年-成年密度.xlsx")

M = M ./ 100;
M = M ./ (1-M);
x = x ./ 100;
x = x ./ (1-x);
hold off
plot(M, den, '*');
hold on
plot(x, N_larval);
plot(x, N_juvenile);
writematrix([M, den], "性别比和性别比密度拟合曲线.xlsx", 'Range','A:B')
writematrix([x', N_larval', N_juvenile'], "性别比和性别比密度拟合曲线.xlsx", 'Range','C:E')