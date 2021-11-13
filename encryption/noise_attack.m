% 加密和解密测试

%噪声攻击测试

clear;clc;close all;
%K = [4.0349 3.7979 4.2980 3.9282]; %读入混沌系统的初始值
K = [3.5739 3.7979 4.2980 3.9282];
img = imread('ruler.512.tiff');%读入图像
%img = imread('Baboon.tiff');
%img = imread('Peppers.tiff');
%img = imread('boat.tiff');
%img = imread('Clock.tiff');
%img = imread('House.tiff');
%img = imread('Male.tiff');
%img = imread('Tree.tiff');

%P = rgb2gray(img); %彩色图像要转化为灰度图像
%figure(1);imshow(P);
P = img;

tic;C = TpEncrypt(P,K);toc;
C = uint8(C);
figure(1);
g = imnoise(C,'gaussian',0.01);%添加高斯噪声
g = uint8(g);
imshow(g);%加密计时，显示加了噪声的密文图像

tic;P1 = TpDecrypt(g,K);toc;figure(2);imshow(P1);%解密计时，显示解密后的明文图像