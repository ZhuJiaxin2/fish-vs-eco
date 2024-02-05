function D = env_stability(R)
    [num, txt, raw] = xlsread('统计结果new.xlsx');
    P = num(:, 1) - 0.2 * R;  % 物种占比，列
    
    H = - sum(P .* log2(P));
    R_ave = mean(R);
    D = 0.5 * (H + 1 - tanh(R_ave));
end