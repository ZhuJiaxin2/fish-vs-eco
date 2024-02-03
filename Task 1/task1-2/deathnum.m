function M = deathnum(den)
    [num, txt, raw] = xlsread('统计结果.xlsx');
    Lmm = num(:, 1);    % 宿主长度列
    N = num(:,2);       % 宿主密度列
    F = 0.41;       % 进食季节长度
    S = 7.884 * Lmm;   % 对第i种宿主的有效搜索率，列
    h = 0.0548;     % 附着时间
    P_s = 0.25;     % 宿主每次受攻击生存率

    tempsum = sum(S .* N * h);
    a = (F * S .* N) / (1 + tempsum);
    A = a * den ./ N;
    M = (1 - P_s) * A;
end