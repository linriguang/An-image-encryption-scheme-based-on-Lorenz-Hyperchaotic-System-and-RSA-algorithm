% ���ܺͽ��ܲ���
clear;clc;close all;
%K = [4.0349 3.7979 4.2980 3.9282]; %�������ϵͳ�ĳ�ʼֵ
K = [3.5739 3.7979 4.2980 3.9282];
img = imread('lena256.bmp');%����ͼ��
%img = imread('Baboon.tiff');
%img = imread('Peppers.tiff');
%img = imread('boat.tiff');
%img = imread('Clock.tiff');
%img = imread('House.tiff');
%img = imread('Male.tiff');
%img = imread('Tree.tiff');

%P = rgb2gray(img); %��ɫͼ��Ҫת��Ϊ�Ҷ�ͼ��
P = img;
figure(1);imshow(P);

tic;C = TpEncrypt(P,K);toc;figure(2);imshow(C);%���ܼ�ʱ����ʾ����ͼ��
tic;P1 = TpDecrypt(C,K);toc;figure(3);imshow(P1);%���ܼ�ʱ����ʾ���ܺ������ͼ��