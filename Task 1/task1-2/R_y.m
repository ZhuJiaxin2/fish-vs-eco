function num = R_y(y, D_larval, D_juvenile, S_larval, beta_0, beta_1, l_bar, l_inf, d)
    num = 0;
    for i = max(y - D_juvenile, 0):max(y, D_larval)
        if i - 1 <= 0
            num = num + 1;
        else
            num = num + P_y(i - 1, S_larval, beta_0, beta_1, l_bar, l_inf, d);
        end
    end
end