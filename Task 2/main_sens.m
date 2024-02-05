clear;close;clc

i = 0;
for x = 0.1:0.01:0.8
    i = i + 1;
    sex(i) = num_sex(x);
    birth(i) = num_birth(x);
end

i = 0;
for x = 1:0.1:10
    i = i + 1;
    r(i) = num_r(x);
end

x1 = 0.1:0.01:0.8;
x2 = 1:0.1:10;

figure(1)
plot(x1,sex);
xlabel('sumnum');
ylabel('sex');
title('sex');
figure(2)
plot(x1,birth);
xlabel('sumnum');
ylabel('birth');
title('birth');
figure(3)
plot(x2,r);
xlabel('sumnum');
ylabel('gamma');
title('gamma');