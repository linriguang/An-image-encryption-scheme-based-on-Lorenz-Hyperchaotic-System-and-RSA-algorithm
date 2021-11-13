%直方图的方差分析

%图像直方图统计分析
clear;clc;close all;
K = [4.0349 3.7979 4.2980 3.9282]; %读入混沌系统的初始值
K1 = [29.0349 3.7979 4.2980 3.9282]; %读入混沌系统的初始值

P1 = imread('Lena.bmp');%读入图像
[M,N] = size(P1);
%P1 = rgb2gray(P1); %彩色图像要转化为灰度图像

C1 = TpEncrypt(P1,K);C2 = TpEncrypt(P1,K1);
[y1,x1] = imhist(P1(:),256);
var(y1(:))
[y2,x2] = imhist(C1(:),256);
var(y2(:))
[y3,x3] = imhist(C2(:),256);
%计算方差
var_y = 0;
for i = 1:256
    for j = 1:256
        var_y = var_y + (y2(i)-y3(j))^2/2;
    end
end
format long
var_z = var_y/(256*256)%方差值


    






