close all; clear all;

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

