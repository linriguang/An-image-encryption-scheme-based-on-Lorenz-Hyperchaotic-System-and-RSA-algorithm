%����������Lena�����ͼ�񣬵�����Lena�������õ�NPCR��UACI
clc;clear;close all;
K = [4.0349 3.7979 4.2980 3.9282]; %�������ϵͳ�ĳ�ʼֵ
P1 = imread('Lake.tiff');%����ͼ��
P1 = rgb2gray(P1); %��ɫͼ��Ҫת��Ϊ�Ҷ�ͼ��
%figure(1);imshow(P1);
%P1 = double(P1);%[M,N] = size(P1);
C1 = TpEncrypt(P1,K);P1(255,255)= 150;
C2 = TpEncrypt(P1,K);
%figure(2);imshow(uint8(C2));

nu = NPCRUACI(C1,C2);
