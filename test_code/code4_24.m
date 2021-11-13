%密文敏感性分析
clc;clear;close all;
P1 = imread('lena512color.tiff');%读入图像
P2 = imread('Baboon.tiff');
P3 = imread('Peppers.tiff');

P1 = rgb2gray(P1); %彩色图像要转化为灰度图像
P2 = rgb2gray(P2);
P3 = rgb2gray(P3);
[M,N] = size(P1);

x0 = rand(1,200) * 80 - 40;y0 = rand(1,200) * 80 - 40;
z0 = rand(1,200) * 80 + 1;w0 = rand(1,200) * 500 - 250;
nubLe = zeros(1,3);nubBa = zeros(1,3);nubPe = zeros(1,3);

for i = 1:200
    K = [x0(i) y0(i) z0(i) w0(i)];
    C1 = TpEncrypt(P1,K);C2 = TpEncrypt(P2,K);C3 = TpEncrypt(P3,K);
    C1 = double(C1);C2 = double(C2);C3 = double(C3);
    
    ix = mod(floor(rand * 10^8),M) + 1;
    iy = mod(floor(rand * 10^8),N) + 1;
    C1(ix,iy) = mod(C1(ix,iy) + 1,256);
    C2(ix,iy) = mod(C2(ix,iy) + 1,256);
    C3(ix,iy) = mod(C3(ix,iy) + 1,256);
    P1N = TpDecrypt(C1,K);P2N = TpDecrypt(C2,K);P3N = TpDecrypt(C3,K);
    
    nubLe = nubLe + NPCRUACIBACI(P1,P1N);
    nubBa = nubBa + NPCRUACIBACI(P2,P2N);
    nubPe = nubPe + NPCRUACIBACI(P3,P3N);
end
nubLe = nubLe / 200;
nubBa = nubBa / 200;
nubPe = nubPe / 200;