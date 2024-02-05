clear;close;clc
i = 0;
for Malerate = 30:5:90
    i = i + 1;
%     N_larval(i) = 0.0063 * Malerate - 0.1582; % 线性
    N_larval(i) = -0.0000965 * Malerate ^ 2 + 0.0154956 * Malerate - 0.3658665;
    N_juvenile(i) = juvenile_density(N_larval(i));
end

death = deathnum(N_juvenile);  % 每一行一种鱼


male_ratio = 0.3:0.05:0.9;
sex_ratio = male_ratio ./ (1 - male_ratio);
plot(sex_ratio, death)
% matrix = env_stability(death);

% %%%%%%%%%%
R = death;
[num, txt, raw] = xlsread('统计结果new.xlsx');
P = num(:, 1);  % 物种占比，列
P1 = repmat(P, 1, length(sex_ratio)) * 36985 .* (1 - R);
P2 = P1 ./ sum(P1); % 新占比
% log2(P1)
H = - sum(P2 .* log2(P2));
R_ave = mean(R);
D = 0.5 * (H + 1 - tanh(R_ave));
matrix = D;
% %%%%%%%%%%
figure;
hold on;
plot(sex_ratio, matrix);

writematrix([sex_ratio', death', matrix'], "性别比与死亡率与生态平衡指数.xlsx")
