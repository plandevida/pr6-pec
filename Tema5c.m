clear all; close all

% lectura de las imágenes
%I1 = imread('Figura-09-15a.jpg','jpg');
%I2 = imread('Figura-09-16a.jpg','jpg');

I1 = imread('Tema06d1.bmp','bmp');
I2 = imread('Tema06d2.bmp','bmp');

Ia1 = double(I1);
Ia2 = double(I2);

X1 = log(abs(fftshift(fft2(Ia1(:,:,1))))); 

X2 = log(abs(fftshift(fft2(Ia2(:,:,1))))); 

figure;  imshow(I1);
figure;  imagesc(X1); colorbar;
figure;  imshow(I2);
figure;  imagesc(X2); colorbar;
