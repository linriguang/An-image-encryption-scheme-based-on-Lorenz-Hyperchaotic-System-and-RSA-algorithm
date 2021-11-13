% 彩色图像RGB 加密和解密测试
clear;clc;close all;
K = [4.0349 3.7979 4.2980 3.9282]; %读入混沌系统的初始值
%img = imread('lena512color.tiff');%读入图像
%img = imread('Baboon.tiff');
%img = imread('Peppers.tiff');
%img = imread('House.tiff');
img = imread('Tree.tiff');
figure(1);imshow(img);

%分成 R G B三部分分别加密和解密
R = img(:,:,1);%red
G = img(:,:,2);%green
B = img(:,:,3);%blue
%分别加密R,G,B，然后在把R,G,B合到一起
tic;
R1 = TpEncrypt(R,K);
G1 = TpEncrypt(G,K);
B1 = TpEncrypt(B,K);
toc;
C(:,:,1) = R1;
C(:,:,2) = G1;
C(:,:,3) = B1;
figure(2);imshow(C);%加密计时，显示密文图像
tic;
R2 = TpDecrypt(R1,K);
G2 = TpDecrypt(G1,K);
B2 = TpDecrypt(B1,K);
toc;
P(:,:,1) = R2;
P(:,:,2) = G2;
P(:,:,3) = B2;
figure(3);imshow(P);%解密计时，显示解密后的明文图像