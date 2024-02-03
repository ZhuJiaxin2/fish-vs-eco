function mun = dl_i(l_inf, l_bar, i, d)
    mun = (l_inf - l_bar) * (1 - exp(- i * d));
end