% Main function for task3, outputs the curve of D with respect to gender ratio
clear; close; clc
i = 0;
for MaleRate = 40:2:100
    i = i + 1;
    N_larval(i) = -0.0000965 * MaleRate ^ 2 + 0.0154956 * MaleRate - 0.3658665;
    N_juvenile(i) = juvenile_density(N_larval(i));
end

death = deathnum(N_juvenile);  % Each row corresponds to a fish species

x_values = 0.4:0.02:1;
xxx = x_values ./ (1 - x_values);

% matrix = env_stability(death);

% %%%%%%%%%%
R = death;
[num, txt, raw] = xlsread('统计结果New.xlsx');
    P = num(:, 1);  % Species proportion, column
    P1 = P * 36985 - R;
    P2 = P1 ./ sum(P1); % New proportions
    H = - sum(P2 .* log2(P2));
    R_ave = mean(R);
    D = 0.5 * (H + 1 - tanh(R_ave));
    matrix = D;
% %%%%%%%%%%

figure;
hold on;
% plot(xxx, H);
plot(xxx, matrix);
