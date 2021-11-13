%ͼ��ֱ��ͼͳ�Ʒ���
clear;clc;close all;
K = [4.0349 3.7979 4.2980 3.9282]; %�������ϵͳ�ĳ�ʼֵ
P1 = imread('lena512color.tiff');%����ͼ��
P2 = imread('Baboon.tiff');
P3 = imread('Peppers.tiff');

P1 = rgb2gray(P1); %��ɫͼ��Ҫת��Ϊ�Ҷ�ͼ��
P2 = rgb2gray(P2);
P3 = rgb2gray(P3);
figure(1);imshow(P1);figure(2);imshow(P2);figure(3);imshow(P3);

C1 = TpEncrypt(P1,K);C2 = TpEncrypt(P2,K);C3 = TpEncrypt(P3,K);
figure(4);imshow(C1);figure(5);imshow(C2);figure(6);imshow(C3);

P1 = double(P1);P2 = double(P2);P3 = double(P3);
figure(7);histogram(P1(:),256);set(gca,'fontsize',18);
figure(8);histogram(P2(:),256);set(gca,'fontsize',18);
figure(9);histogram(P3(:),256);set(gca,'fontsize',18);

C1 = double(C1);C2 = double(C2);C3 = double(C3);
figure(10);histogram(C1(:),256);set(gca,'fontsize',18);
figure(11);histogram(C2(:),256);set(gca,'fontsize',18);
figure(12);histogram(C3(:),256);set(gca,'fontsize',18);