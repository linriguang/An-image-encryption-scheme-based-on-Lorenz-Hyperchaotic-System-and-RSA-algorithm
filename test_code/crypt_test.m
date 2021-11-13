% 加密和解密测试
clear;clc;close all;
%K = [4.0349 3.7979 4.2980 3.9282]; %读入混沌系统的初始值
K = [3.5739 3.7979 4.2980 3.9282];
img = imread('lena256.bmp');%读入图像
%img = imread('Baboon.tiff');
%img = imread('Peppers.tiff');
%img = imread('boat.tiff');
%img = imread('Clock.tiff');
%img = imread('House.tiff');
%img = imread('Male.tiff');
%img = imread('Tree.tiff');

%P = rgb2gray(img); %彩色图像要转化为灰度图像
P = img;
figure(1);imshow(P);

tic;C = TpEncrypt(P,K);toc;figure(2);imshow(C);%加密计时，显示密文图像
tic;P1 = TpDecrypt(C,K);toc;figure(3);imshow(P1);%解密计时，显示解密后的明文图像