function mun = m_i(i, beta_0, beta_1, l_bar, l_inf, d)
    dl_i_num = dl_i(l_inf,l_bar,i, d);
    mun = exp(beta_0 + beta_1 * (l_bar + dl_i_num)) / (1 + exp(beta_0 + beta_1 * (l_bar + dl_i_num)));
end