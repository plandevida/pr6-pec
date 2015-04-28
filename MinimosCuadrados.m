
clear all; close all;

% Ajuste de rectas por mínimos cuadrados
B = imread('Tema06aa.bmp','bmp');
I = B(:,:,1);

figure; imshow(I); impixelinfo

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