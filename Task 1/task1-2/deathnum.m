function M = deathnum(den)
    [num, txt, raw] = xlsread('统计结果new.xlsx');
    Lmm = num(:, 2);    % Host length column
    Lg = num(:, 3);     % Host mass column
    N = num(:,1);       % Host density column
    F = 0.41;           % Feeding season length
    S = 7.884 * Lmm;    % Effective search rate for the i-th host, column
    h = 0.0548;         % Attachment time
    m_lamprey = 200.9;  % Lamprey mass
    PR = m_lamprey ./ Lg;
    P_s = 1 - PR .^ 2 / (1 + PR .^ 2);     % Survival rate of hosts per attack

    tempsum = sum(S .* N * h);
    a = (F * S .* N) / (1 + tempsum);
    A = a * den ./ N;
    M = (1 - P_s) * A;
end
