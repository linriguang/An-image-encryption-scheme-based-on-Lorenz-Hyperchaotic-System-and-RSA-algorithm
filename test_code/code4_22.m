% 图像解密系统的秘钥敏感性分析
clc;clear;close all;
P1 = imread('lena512color.tiff');%读入图像
P2 = imread('Baboon.tiff');
P3 = imread('Peppers.tiff');

P1 = rgb2gray(P1); %彩色图像要转化为灰度图像
P2 = rgb2gray(P2);
P3 = rgb2gray(P3);

x0 = rand(2,1000) * 80 - 40;y0 = rand(2,1000) * 80 - 40;
z0 = rand(2,1000) * 80 + 1;w0 = rand(2,1000) * 500 - 250;
nubLex = zeros(2,3);nubLey = zeros(2,3);nubLez = zeros(2,3);nubLew = zeros(2,3);
nubBax = zeros(2,3);nubBay = zeros(2,3);nubBaz = zeros(2,3);nubBaw = zeros(2,3);
nubPex = zeros(2,3);nubPey = zeros(2,3);nubPez = zeros(2,3);nubPew = zeros(2,3);

N = 1000;tic;
for i = 1:N
    K1 = [x0(1,i) y0(1,i) z0(1,i) w0(1,i)];
    C1 = TpEncrypt(P1,K1);C2 = TpEncrypt(P2,K1);C3 = TpEncrypt(P3,K1);
    K2 = K1;K2(1) = K2(1) + 10^(-13);
    P1N1 = TpDecrypt(C1,K2);P2N1 = TpDecrypt(C2,K2);P3N1 = TpDecrypt(C3,K2);
    K3 = K1;K3(2) = K3(2) + 10^(-13);
    P1N2 = TpDecrypt(C1,K3);P2N2 = TpDecrypt(C2,K3);P3N2 = TpDecrypt(C3,K3);
    K4 = K1;K4(3) = K4(3) + 10^(-13);
    P1N3 = TpDecrypt(C1,K4);P2N3 = TpDecrypt(C2,K4);P3N3 = TpDecrypt(C3,K4);
    K5 = K1;K5(4) = K5(4) + 10^(-12);
    P1N4 = TpDecrypt(C1,K5);P2N4 = TpDecrypt(C2,K5);P3N4 = TpDecrypt(C3,K5);
    
    nubLex(1,:) = nubLex(1,:) + NPCRUACIBACI(P1,P1N1);
    nubLey(1,:) = nubLey(1,:) + NPCRUACIBACI(P1,P1N2);
    nubLez(1,:) = nubLez(1,:) + NPCRUACIBACI(P1,P1N3);
    nubLew(1,:) = nubLew(1,:) + NPCRUACIBACI(P1,P1N4);
    
    nubBax(1,:) = nubBax(1,:) + NPCRUACIBACI(P2,P2N1);
    nubBay(1,:) = nubBay(1,:) + NPCRUACIBACI(P2,P2N2);
    nubBaz(1,:) = nubBaz(1,:) + NPCRUACIBACI(P2,P2N3);
    nubBaw(1,:) = nubBaw(1,:) + NPCRUACIBACI(P2,P2N4);
    
    nubPex(1,:) = nubPex(1,:) + NPCRUACIBACI(P3,P3N1);
    nubPey(1,:) = nubPey(1,:) + NPCRUACIBACI(P3,P3N2);
    nubPez(1,:) = nubPez(1,:) + NPCRUACIBACI(P3,P3N3);
    nubPew(1,:) = nubPew(1,:) + NPCRUACIBACI(P3,P3N4);
    
    
    KK1 = [x0(2,i) y0(2,i) z0(2,i) w0(2,i)];
    PP1 = TpDecrypt(C1,KK1);PP2 = TpDecrypt(C2,KK1);PP3 = TpDecrypt(C3,KK1);
    KK2 = KK1;KK2(1) = KK2(1) + 10^(-13);
    PP1N1 = TpDecrypt(C1,KK2);PP2N1 = TpDecrypt(C2,KK2);PP3N1 = TpDecrypt(C3,KK2);
    KK3 = KK1;KK3(2) = KK3(2) + 10^(-13);
    PP1N2 = TpDecrypt(C1,KK3);PP2N2 = TpDecrypt(C2,KK3);PP3N2 = TpDecrypt(C3,KK3);
    KK4 = KK1;KK4(3) = KK4(3) + 10^(-13);
    PP1N3 = TpDecrypt(C1,KK4);PP2N3 = TpDecrypt(C2,KK4);PP3N3 = TpDecrypt(C3,KK4);
    KK5 = KK1;KK5(4) = KK5(4) + 10^(-12);
    PP1N4 = TpDecrypt(C1,KK5);PP2N4 = TpDecrypt(C2,KK5);PP3N4 = TpDecrypt(C3,KK5);
    
    nubLex(2,:) = nubLex(2,:) + NPCRUACIBACI(PP1,PP1N1);
    nubLey(2,:) = nubLey(2,:) + NPCRUACIBACI(PP1,PP1N2);
    nubLez(2,:) = nubLez(2,:) + NPCRUACIBACI(PP1,PP1N3);
    nubLew(2,:) = nubLew(2,:) + NPCRUACIBACI(PP1,PP1N4);
    
    nubBax(2,:) = nubBax(2,:) + NPCRUACIBACI(PP2,PP2N1);
    nubBay(2,:) = nubBay(2,:) + NPCRUACIBACI(PP2,PP2N2);
    nubBaz(2,:) = nubBaz(2,:) + NPCRUACIBACI(PP2,PP2N3);
    nubBaw(2,:) = nubBaw(2,:) + NPCRUACIBACI(PP2,PP2N4);
    
    nubPex(2,:) = nubPex(2,:) + NPCRUACIBACI(PP3,PP3N1);
    nubPey(2,:) = nubPey(2,:) + NPCRUACIBACI(PP3,PP3N2);
    nubPez(2,:) = nubPez(2,:) + NPCRUACIBACI(PP3,PP3N3);
    nubPew(2,:) = nubPew(2,:) + NPCRUACIBACI(PP3,PP3N4);
end

nubLex = nubLex / N;
nubLey = nubLey / N;
nubLez = nubLez / N;
nubLew = nubLew / N;

nubBax = nubBax / N;
nubBay = nubBay / N;
nubBaz = nubBaz / N;
nubBaw = nubBaw / N;

nubPex = nubPex / N;
nubPey = nubPey / N;
nubPez = nubPez / N;
nubPew = nubPew / N;    
    
    
    