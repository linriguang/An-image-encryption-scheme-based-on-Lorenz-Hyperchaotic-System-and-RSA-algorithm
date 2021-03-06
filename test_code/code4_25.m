% 信息熵计算
clc;clear;close all;
P1 = imread('Male.tiff');%读入图像
P2 = imread('Boat.tiff');
P3 = imread('Clock.tiff');

%P1 = rgb2gray(P1); %彩色图像要转化为灰度图像
%P2 = rgb2gray(P2);
%P3 = rgb2gray(P3);
%[M,N] = size(P3);

x0 = rand(1,3) * 80 - 40;y0 = rand(1,3) * 80 - 40;
z0 = rand(1,3) * 80 + 1;w0 = rand(1,3) * 500 - 250;

K1 = [x0(1) y0(1) z0(1) w0(1)];
K2 = [x0(2) y0(2) z0(2) w0(2)];
K3 = [x0(3) y0(3) z0(3) w0(3)];

C1 = TpEncrypt(P1,K1);C2 = TpEncrypt(P2,K2);C3 = TpEncrypt(P3,K3);
C1 = double(C1);C2 = double(C2);C3 = double(C3);
H11 = ENTROPYtest(P1);H12 = ENTROPYtest(C1);
H21 = ENTROPYtest(P2);H22 = ENTROPYtest(C2);
H31 = ENTROPYtest(P3);H32 = ENTROPYtest(C3);