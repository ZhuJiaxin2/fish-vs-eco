clear;close;clc

[num, txt, raw] = xlsread('task1ex.xlsx');
name = txt(2:end, 1);
death = num(:, 1);
rank = num(:, 2);

up = 0;
down = 0;

n = size(rank, 1);
for i = 1:n - 1
    for j = i + 1:n
        if (death(i) > death(j) && rank(i) > rank(j)) || (death(i) < death(j) && rank(i) < rank(j))
            up = up + 1;
            down = down + 1;
        elseif (death(i) > death(j) && rank(i) < rank(j)) || (death(i) < death(j) && rank(i) > rank(j))
            down = down + 1;
        end
    end
end

rate = up / down