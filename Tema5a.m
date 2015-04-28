clear all; close all;

% Extracción de propiedades de las regiones
I = imread('Tema06c.bmp','bmp');
I1 = I(:,:,1);

figure; imshow(I1); impixelinfo; title('Original');

T = graythresh(I1);
A = I1 < 255*T;

% N = número de etiquetas y valor de las Etiquetas de la imagen izquierda
[Etiquetas, N]=bwlabel(A,8);
figure; imshow(Etiquetas); impixelinfo; title('Etiquetas')

figure; imagesc(Etiquetas); colorbar

Prop =  regionprops(Etiquetas,'all');

for i=1:1:N
 disp(Prop(i));
end








