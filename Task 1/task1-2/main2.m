clear;close;clc

[num, txt, raw] = xlsread('统计结果.xlsx');
Lmm = num(:, 1);    % 宿主长度列
N = num(:,2);       % 宿主密度列

% a_i = 0;        % 寄生生物对第i种宿主的攻击次数
F = 0.41;       % 进食季节长度
S = 7.884 * Lmm;   % 对第i种宿主的有效搜索率，列
h = 0.0548;     % 附着时间

% M = 0;        % 一列，有每个宿主的数据
% A = 0;        % 列
P_s = 0.25;     % 宿主每次受攻击生存率

L = 0.08;          % 七鳃鳗数量（密度）

tempsum = sum(S .* N * h);
a = (F * S .* N) / (1 + tempsum);
A = a * L ./ N;
M = (1 - P_s) * A