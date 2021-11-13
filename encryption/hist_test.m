%图像直方图的卡方检验

%图像直方图统计分析
clear;clc;close all;
K = [4.0349 3.7979 4.2980 3.9282]; %读入混沌系统的初始值
P1 = imread('lena512color.tiff');%读入图像
P2 = imread('boat.tiff');
P3 = imread('Tree.tiff');

P1 = rgb2gray(P1); %彩色图像要转化为灰度图像
P3 = rgb2gray(P3); %彩色图像要转化为灰度图像
figure(1);imshow(P1);figure(2);imshow(P2);figure(3);imshow(P3);

C1 = TpEncrypt(P1,K);C2 = TpEncrypt(P2,K);C3 = TpEncrypt(P3,K);
figure(4);imshow(C1);figure(5);imshow(C2);figure(6);imshow(C3);

P1 = double(P1);P2 = double(P2);P3 = double(P3);
figure(7);histogram(P1(:),256);set(gca,'fontsize',18);
figure(8);hist(P2(:),256);set(gca,'fontsize',18);
figure(9);hist(P3(:),256);set(gca,'fontsize',18);

C1 = double(C1);C2 = double(C2);C3 = double(C3);
figure(10);hist(C1(:),256);set(gca,'fontsize',18);
figure(11);hist(C2(:),256);set(gca,'fontsize',18);
figure(12);hist(C3(:),256);set(gca,'fontsize',18);

[M,N] = size(P1);g = M * N/256;%计算每个灰度值的平均像素点数
fp1 = hist(P1(:),256);fp2 = hist(P2(:),256);fp3 = hist(P3(:),256);
chai1 = sum((fp1 - g).^2)/g;chai2 = sum((fp2 - g).^2)/g;chai3 = sum((fp3 - g).^2)/g;
fc1 = hist(C1(:),256);fc2 = hist(C2(:),256);fc3 = hist(C3(:),256);
chai4 = sum((fc1 - g).^2)/g;chai5 = sum((fc2 - g).^2)/g;chai6 = sum((fc3 - g).^2)/g;

