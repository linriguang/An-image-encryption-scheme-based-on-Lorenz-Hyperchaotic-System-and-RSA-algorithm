% 加密和解密测试
clear;clc;close all;
K1 = [4.0349 3.7979 4.2980 3.9282]; %读入混沌系统的初始值
K2 = [3.5739 3.7979 4.2980 3.9282];
img = imread('lena512color.tiff');%读入图像
%img = imread('Baboon.tiff');
%img = imread('Peppers.tiff');
%img = imread('boat.tiff');
%img = imread('Clock.tiff');
%img = imread('House.tiff');
%img = imread('Male.tiff');
%img = imread('Tree.tiff');

P = rgb2gray(img); %彩色图像要转化为灰度图像
figure(1);imshow(P);

tic;C1 = TpEncrypt(P,K1);toc;figure(2);imshow(C1);%加密计时，显示密文图像
tic;P1 = TpDecrypt(C1,K2);toc;figure(3);imshow(P1);%解密计时，显示解密后的明文图像

tic;C2 = TpEncrypt(P,K2);toc;figure(4);imshow(C2);%加密计时，显示密文图像
tic;P2 = TpDecrypt(C2,K2);toc;figure(5);imshow(P2);%解密计时，显示解密后的明文图像

%C1和C2差分图
C1C2 = abs(C1-C2);
figure(6);imshow(C1C2)