%秘钥敏感性定性分析
clc;clear;close all;
P = imread('lena512color.tiff');%读入图像
P = rgb2gray(P);
figure(1);imshow(P);
K = [1.1 2.2 3.3 4.4];
K1 = K; 
K1(1) = K1(1) + 10^(-13);
K2 = K;
K2(1) = K2(1) + 10^(-13);
K3 = K;
K3(1) = K3(1) + 10^(-13);
K4 = K;
K4(1) = 10^(-12);
C1 = TpEncrypt(P,K);
C2 = TpEncrypt(P,K1);
C3 = TpEncrypt(P,K2);
C4 = TpEncrypt(P,K3);
C5 = TpEncrypt(P,K4);

figure(2);imshow(uint8(C1));
figure(3);imshow(uint8(C2));
figure(4);imshow(uint8(C3));
figure(5);imshow(uint8(C4));
figure(6);imshow(uint8(C5));

DC1 = abs(C1 - C2);
DC2 = abs(C1 - C3);
DC3 = abs(C1 - C4);
DC4 = abs(C1 - C5);
figure(7);imshow(uint8(DC1));
figure(8);imshow(uint8(DC2));
figure(9);imshow(uint8(DC3));
figure(10);imshow(uint8(DC4));
