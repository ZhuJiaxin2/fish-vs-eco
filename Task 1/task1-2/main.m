clear;close;clc

[num, txt, raw] = xlsread('t1b.xlsx');
N_larval = num(:, 2);     % 当前时刻单位体积幼鱼数量
% N_juvenile = 0;   % 当前时刻单位体积成年鱼数量
D_larval = 4;     % 幼虫时期的时长（duration），单位：年
D_juvenile = 2;   % 成年时期的时长（duration），单位：年
% P_y = 0;          % 幼鱼存活y年，且没有变态的概率
% R_y = 0;          % y年前的那一年出生的鱼，在今年或之前成年并存活的概率
% B = 0;            % 每年出生的幼鱼数量

% P_d = 0;            % d年前出生的幼鱼，存活到现在的概率
% y = 0;              % 时间段，当y=0时，不考虑死亡率、变态率,P=1
S_larval = 0.627;   % 幼鱼每年存活率
% m_i = 0;            % 幼鱼在第i年变态为成年鱼的概率

beta_0 = -23.886;   % 
beta_1 = 0.186;     % 
l_inf = 159;        % mm
l_bar = l_inf/2;    % 鱼长度区间的中点
% dl_i = 0;           % i年前的鱼预期的长度变化量

d = 0.515;          %对特定溪流的成长季时长，年

% 计算B的值
sum = 0;
for y = 1:D_larval
    sum = sum + P_y(y,S_larval, beta_0, beta_1, l_bar, l_inf, d);
end
B = N_larval / sum;

% 计算成年体密度
sum = 0;
for y = 1:(D_larval + D_juvenile)
    sum = sum + R_y(y, D_larval, D_juvenile, S_larval, beta_0, beta_1, l_bar, l_inf, d) * B;
end
N_juvenile = sum;