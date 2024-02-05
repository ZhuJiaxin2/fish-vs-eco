function num = P_y(y, S_larval, beta_0, beta_1, l_bar, l_inf, d)
    num = 1;
    for i = 1:y
        m_i_num = m_i(i, beta_0, beta_1,l_bar, l_inf, d);
        num = num * S_larval * (1 - m_i_num);
    end
end