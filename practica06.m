% Autores: Daniel Serrano Torres, Emilio Álvarez Piñeiro
% Práctica 06
clear all; close all;
%% 1) Descripción de bordes
% 1.a) Minimos cuadrados


B = imread('Tema06a.bmp','bmp');
I = B(:,:,1);

figure(1)
subplot(1,2,1); imshow(I); impixelinfo

[M,N,a] = size(I);

n = 1;
for i=1:1:M
    for j=1:1:N
       if I(i,j) == 0
          Y(n,1) = 1; Y(n,2) = j;
          b(n) = i;
          n = n + 1;
       end
    end
end
    
a = pinv(Y)*b';

x1 = 0; x2 = N;
y1 = a(1) + a(2)*x1;
y2 = a(1) + a(2)*x2;


hold on
line ([x1, x2], [y1, y2], 'LineWidth',4)
% 1.b) Detectar líneas

detectar_lineas

%% 2) Descripción de regiones
clear all;
% 2.a)
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

% 2.b)
clear all;

% primer 0
F0a = imread('Cero_a.bmp','bmp');
phi = invmoments(F0a);
%escalado
phi = abs(log10(abs(phi)));
disp('phi primer cero ='); disp(phi);

% segundo 0
F0b = imread('Cero_b.bmp','bmp');
phi = invmoments(F0b);
%escalado
phi = abs(log10(abs(phi)));
disp('phi segundo cero ='); disp(phi);

% tercer 0
F0c = imread('Cero_c.bmp','bmp');
phi = invmoments(F0c);
%escalado
phi = abs(log10(abs(phi)));
disp('phi tercer cero ='); disp(phi);

% cuarto 0
F0d = imread('Cero_d.bmp','bmp');
phi = invmoments(F0d);
%escalado
phi = abs(log10(abs(phi)));
disp('phi cuarto cero ='); disp(phi);


% primer 7
F7a = imread('Siete_a.bmp','bmp');
phi = invmoments(F7a);
%escalado
phi = abs(log10(abs(phi)));
disp('phi primer siete ='); disp(phi);

% segundo 7
F7b = imread('Siete_b.bmp','bmp');
phi = invmoments(F7b);
%escalado
phi = abs(log10(abs(phi)));
disp('phi segundo siete ='); disp(phi);

% tercer 7
F7c = imread('Siete_c.bmp','bmp');
phi = invmoments(F7c);
%escalado
phi = abs(log10(abs(phi)));
disp('phi tercer siete ='); disp(phi);

% cuarto 6
F7d = imread('Siete_d.bmp','bmp');
phi = invmoments(F7d);
%escalado
phi = abs(log10(abs(phi)));
disp('phi cuarto siete ='); disp(phi);

subplot(4,2,1); imshow(F0a)
subplot(4,2,2); imshow(F0b)
subplot(4,2,3); imshow(F0c)
subplot(4,2,4); imshow(F0d)
subplot(4,2,5); imshow(F7a)
subplot(4,2,6); imshow(F7b)
subplot(4,2,7); imshow(F7c)
subplot(4,2,8); imshow(F7d)

%% 3) Opcionales
% 3.a)
Demo1

% 3.b)
clear all;

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
