function N_juvenile = juvenile_density(N_larval)
    D_larval = 4;     % Duration of larval stage in years
    D_juvenile = 2;   % Duration of juvenile stage in years
    S_larval = 0.627;   % Annual survival rate of larvae
    beta_0 = -23.886;   % 
    beta_1 = 0.186;     % 
    l_inf = 159;        % mm
    l_bar = l_inf/2;    % Midpoint of the length interval
    d = 0.515;          % Duration of the growth season for a specific stream, in years

    % Calculate the value of B
    sum = 0;
    for y = 0:D_larval
       sum = sum + P_y(y,S_larval, beta_0, beta_1, l_bar, l_inf, d);
    end
    B = N_larval / sum;

    % Calculate the density of adult fish
    sum = 0;
    for y = 1:(D_larval + D_juvenile)
       sum = sum + R_y(y, D_larval, D_juvenile, S_larval, beta_0, beta_1, l_bar, l_inf, d) * B;
    end
    N_juvenile = sum;
end
