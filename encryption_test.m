% Encrypt and decrypt grayscale map tests
clear;clc;close all;
addpath("./libs");
addpath("./pictures");
show_banner();

K_1 = [1 1 1 1 1 1 1 1];
K_2 = [2 2 2 2 2 2 2 2];

% P = imread('lena256color.bmp');
P = imread('lena512color.bmp');
% P = imread('lena1024color.jpg');
% P = imread('lena2048color.jpg');
P = rgb2gray(P);
figure(1);imshow(P);

[C, K1, K2] = TpEncryptE(P, K_1, K_2);
figure(2);imshow(C);

D = TpDecryptE(C, K1, K2);
figure(3);imshow(D);