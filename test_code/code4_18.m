%随机图像间的UACI期望值
clc;clear;close all;
P1 = imread('lena512color.tiff');%读入图像
P2 = imread('Baboon.tiff');
P3 = imread('Peppers.tiff');

P1 = rgb2gray(P1); %彩色图像要转化为灰度图像
P2 = rgb2gray(P2);
P3 = rgb2gray(P3);
b1 = BACIExpect(P1);
b2 = BACIExpect(P2);
b3 = BACIExpect(P3);