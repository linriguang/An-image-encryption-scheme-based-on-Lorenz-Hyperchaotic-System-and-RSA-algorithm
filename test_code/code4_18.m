%���ͼ����UACI����ֵ
clc;clear;close all;
P1 = imread('lena512color.tiff');%����ͼ��
P2 = imread('Baboon.tiff');
P3 = imread('Peppers.tiff');

P1 = rgb2gray(P1); %��ɫͼ��Ҫת��Ϊ�Ҷ�ͼ��
P2 = rgb2gray(P2);
P3 = rgb2gray(P3);
b1 = BACIExpect(P1);
b2 = BACIExpect(P2);
b3 = BACIExpect(P3);