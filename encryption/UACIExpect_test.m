%���ͼ����UACI����ֵ
clc;clear;close all;
P1 = imread('lena512color.tiff');%����ͼ��
P2 = imread('Baboon.tiff');
P3 = imread('Peppers.tiff');

P1 = rgb2gray(P1); %��ɫͼ��Ҫת��Ϊ�Ҷ�ͼ��
P2 = rgb2gray(P2);
P3 = rgb2gray(P3);
u1 = UACIExpect(P1);
u2 = UACIExpect(P2);
u3 = UACIExpect(P3);

