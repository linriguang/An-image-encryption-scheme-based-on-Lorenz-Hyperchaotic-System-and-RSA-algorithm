%两幅随机图像间的BACI期望值
clc;clear;
p = [128,255:-1:1] * 2;
pn = zeros(1,256);
for i = 0:255
    for j = 0:255
        pn(abs(i - j) + 1) = pn(abs(i - j) + 1) + p(i + 1) * p(j + 1);
    end
end
pr = sum((0:255).*pn)/power(256,4)/255 * 100;
