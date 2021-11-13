% 相关性测试
%图像直方图统计分析
clear;clc;close all;
K = [4.0349 3.7979 4.2980 3.9282]; %读入混沌系统的初始值
P = imread('Lake.tiff');%读入图像
P1 = P(:,:,1);
P2 = P(:,:,2);
P3 = P(:,:,3);


figure(1);imshow(P1);figure(2);imshow(P2);figure(3);imshow(P3);

C1 = TpEncrypt(P1,K);C2 = TpEncrypt(P2,K);C3 = TpEncrypt(P3,K);
figure(4);imshow(C1);figure(5);imshow(C2);figure(6);imshow(C3);

P1 = double(P1);P2 = double(P2);P3 = double(P3);
%figure(7);hist(P1(:),256);set(gca,'fontsize',18);
%figure(8);hist(P2(:),256);set(gca,'fontsize',18);
%figure(9);hist(P3(:),256);set(gca,'fontsize',18);

C1 = double(C1);C2 = double(C2);C3 = double(C3);
%figure(10);hist(C1(:),256);set(gca,'fontsize',18);
%figure(11);hist(C2(:),256);set(gca,'fontsize',18);
%figure(12);hist(C3(:),256);set(gca,'fontsize',18);

r1 = ImCoef(P1,2000);
r2 = ImCoef(P2,2000);
r3 = ImCoef(P3,2000);
r4 = ImCoef(C1,2000);
r5 = ImCoef(C2,2000);
r6 = ImCoef(C3,2000);