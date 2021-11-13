%构造两幅与Lena相近的图像，但是与Lena间有良好的NPCR和UACI
clc;clear;close all;
K = [4.0349 3.7979 4.2980 3.9282]; %读入混沌系统的初始值
P1 = imread('Lake.tiff');%读入图像
P1 = rgb2gray(P1); %彩色图像要转化为灰度图像
%figure(1);imshow(P1);
%P1 = double(P1);%[M,N] = size(P1);
C1 = TpEncrypt(P1,K);P1(255,255)= 150;
C2 = TpEncrypt(P1,K);
%figure(2);imshow(uint8(C2));

nu = NPCRUACI(C1,C2);
