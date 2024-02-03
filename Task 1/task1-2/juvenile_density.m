function N_juvenile = juvenile_density(N_larval)
    D_larval = 4;     % 幼虫时期的时长（duration），单位：年
    D_juvenile = 2;   % 成年时期的时长（duration），单位：年
    S_larval = 0.627;   % 幼鱼每年存活率
    beta_0 = -23.886;   % 
    beta_1 = 0.186;     % 
    l_inf = 159;        % mm
    l_bar = l_inf/2;    % 鱼长度区间的中点
    d = 0.515;          %对特定溪流的成长季时长，年

    % 计算B的值
    sum = 0;
    for y = 0:D_larval
       sum = sum + P_y(y,S_larval, beta_0, beta_1, l_bar, l_inf, d);
    end
    B = N_larval / sum;

    % 计算成年体密度
    sum = 0;
    for y = 1:(D_larval + D_juvenile)
       sum = sum + R_y(y, D_larval, D_juvenile, S_larval, beta_0, beta_1, l_bar, l_inf, d) * B;
    end
    N_juvenile = sum;
end
