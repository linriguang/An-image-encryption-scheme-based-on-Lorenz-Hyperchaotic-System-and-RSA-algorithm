% ����Բ���
%ͼ��ֱ��ͼͳ�Ʒ���
clear;clc;close all;
K = [4.0349 3.7979 4.2980 3.9282]; %�������ϵͳ�ĳ�ʼֵ
P1 = imread('boat.tiff');%����ͼ��
%P1 = rgb2gray(P1);

figure(1);imshow(P1);

C1 = TpEncrypt(P1,K);
figure(2);imshow(C1);

P1 = double(P1);
%figure(7);hist(P1(:),256);set(gca,'fontsize',18);
%figure(8);hist(P2(:),256);set(gca,'fontsize',18);
%figure(9);hist(P3(:),256);set(gca,'fontsize',18);

C1 = double(C1);
%figure(10);hist(C1(:),256);set(gca,'fontsize',18);
%figure(11);hist(C2(:),256);set(gca,'fontsize',18);
%figure(12);hist(C3(:),256);set(gca,'fontsize',18);

r1 = ImCoef(P1,5000);
r2 = ImCoef(C1,5000);
