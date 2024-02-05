% Sensitivity analysis file for task1, uncomment each section to obtain output
clear; close; clc
i = 0;
for Malerate = 30:1:90
    i = i + 1;
    N_larval(i) = -0.0000965 * Malerate^2 + 0.0154956 * Malerate - 0.3658665;
    N_juvenile(i) = juvenile_density(N_larval(i));
end

% %%%%%%%%%%%%% Adult density to juvenile density derivative
% x_values = N_larval;
% y_values = N_juvenile;
% 
% % Compute numerical derivative
% dy_dx = gradient(y_values, x_values);
% 
% figure;
% plot(x_values, y_values, '-o', x_values, dy_dx, '-');
% legend('Original curve', 'Numerical derivative');
% xlabel('N_larval');
% ylabel('N_juvenile and dN_juvenile/dN_larval');
% title('Adult density to juvenile density');
% %%%%%%%%%%%%%

matrix = deathnum(N_juvenile);

% %%%%%%%%%%%%%%%% Host death count to adult density derivative
% x_values = N_juvenile;
% y_matrix = matrix;
% 
% dy_dx_matrix = zeros(size(y_matrix));
% 
% for i = 1:size(y_matrix, 1)
%     dy_dx_matrix(i, :) = gradient(y_matrix(i, :), x_values);
% end
% 
% figure;
% hold on;
% 
% for i = 1:size(dy_dx_matrix, 1)
%     plot(x_values, dy_dx_matrix(i, :), '-');
% end
% 
% hold off;
% 
% xlabel('x');
% ylabel('Derivative');
% %%%%%%%%%%%%%%%%%

% x_values = 0.3:0.01:0.9;
% 
% figure;
% hold on;
% 
% for i = 1:size(matrix, 1)
%     plot(x_values ./ (1 - x_values), matrix(i, :));
% end
% 
% xlabel('X');
% ylabel('Y');
% hold off;
% 
% figure;
% average_curve = mean(matrix, 1);
% xxx = x_values ./ (1 - x_values);
% plot(xxx, average_curve, 'LineWidth', 2);
% 
% xlabel('X');
% ylabel('Y');

% plot(xxx, average_curve, 'LineWidth', 2);
% 
% xlabel('X');
% ylabel('Y');
