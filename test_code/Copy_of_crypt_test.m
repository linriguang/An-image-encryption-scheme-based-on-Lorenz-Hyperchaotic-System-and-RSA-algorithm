% ���ܺͽ��ܲ���
clear;clc;close all;
K1 = [4.0349 3.7979 4.2980 3.9282]; %�������ϵͳ�ĳ�ʼֵ
K2 = [3.5739 3.7979 4.2980 3.9282];
img = imread('lena512color.tiff');%����ͼ��
%img = imread('Baboon.tiff');
%img = imread('Peppers.tiff');
%img = imread('boat.tiff');
%img = imread('Clock.tiff');
%img = imread('House.tiff');
%img = imread('Male.tiff');
%img = imread('Tree.tiff');

P = rgb2gray(img); %��ɫͼ��Ҫת��Ϊ�Ҷ�ͼ��
figure(1);imshow(P);

tic;C1 = TpEncrypt(P,K1);toc;figure(2);imshow(C1);%���ܼ�ʱ����ʾ����ͼ��
tic;P1 = TpDecrypt(C1,K2);toc;figure(3);imshow(P1);%���ܼ�ʱ����ʾ���ܺ������ͼ��

tic;C2 = TpEncrypt(P,K2);toc;figure(4);imshow(C2);%���ܼ�ʱ����ʾ����ͼ��
tic;P2 = TpDecrypt(C2,K2);toc;figure(5);imshow(P2);%���ܼ�ʱ����ʾ���ܺ������ͼ��

%C1��C2���ͼ
C1C2 = abs(C1-C2);
figure(6);imshow(C1C2)