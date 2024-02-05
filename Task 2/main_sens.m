clear;close;clc

i = 0;
for x = -0.1:0.01:0.15
    i = i + 1;
    sex(i) = num_sex(x);
    birth(i) = num_birth(x);
end

i = 0;
for x = 0.1:0.2:5
    i = i + 1;
    r(i) = num_r(x);
end

x1 = -0.1:0.01:0.15;
x2 = 0.1:0.2:5;

figure(1)
plot(x1 + 0.8 ,sex);
xlabel('sumnum');
ylabel('sex');
title('sex');
figure(2)
plot(x1 + 1,birth);
xlabel('sumnum');
ylabel('birth');
title('birth');
figure(3)
plot(x2,r);
xlabel('beta');
ylabel('sum');
title('beta');

writematrix([(x1 + 0.8)', sex', (x1 + 1)', birth'], "task2敏感性分析.xlsx")
writematrix([x2', r'], "task2敏感性分析.xlsx", "Range", "E:F")