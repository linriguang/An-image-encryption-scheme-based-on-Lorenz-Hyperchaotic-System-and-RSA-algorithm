% ��ɫͼ��RGB ���ܺͽ��ܲ���
clear;clc;close all;
K = [4.0349 3.7979 4.2980 3.9282]; %�������ϵͳ�ĳ�ʼֵ
%img = imread('lena512color.tiff');%����ͼ��
%img = imread('Baboon.tiff');
%img = imread('Peppers.tiff');
%img = imread('House.tiff');
img = imread('Tree.tiff');
figure(1);imshow(img);

%�ֳ� R G B�����ֱַ���ܺͽ���
R = img(:,:,1);%red
G = img(:,:,2);%green
B = img(:,:,3);%blue
%�ֱ����R,G,B��Ȼ���ڰ�R,G,B�ϵ�һ��
tic;
R1 = TpEncrypt(R,K);
G1 = TpEncrypt(G,K);
B1 = TpEncrypt(B,K);
toc;
C(:,:,1) = R1;
C(:,:,2) = G1;
C(:,:,3) = B1;
figure(2);imshow(C);%���ܼ�ʱ����ʾ����ͼ��
tic;
R2 = TpDecrypt(R1,K);
G2 = TpDecrypt(G1,K);
B2 = TpDecrypt(B1,K);
toc;
P(:,:,1) = R2;
P(:,:,2) = G2;
P(:,:,3) = B2;
figure(3);imshow(P);%���ܼ�ʱ����ʾ���ܺ������ͼ��