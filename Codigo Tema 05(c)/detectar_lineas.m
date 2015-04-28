clear all; close all

%X = imread('Tema06b.bmp','bmp');
X = imread('BinariaBB.bmp','bmp');
figure; imshow(X)

% coeficiente determinar la porcion de la parte inferior de la imagen a
% detectar
coeficiente = 0.4;
[f] = extract_white_region_mio(X);

theta=1; 
rho = 1;
[H,Theta,Rho] = hough_Gonzalez(f,theta,rho);

% la parte grafica esta tomada del help de Matlab (disco 2)
figure, imagesc(Theta, Rho, H); colormap(hot);
xlabel('\theta (grados)'); ylabel('\rho');
title('R_{\theta} (\rho)');
colorbar

numPicos = 11;
Trheshold = 200; 
%vecindad = por defecto 
[filas,columnas,Hnew] = houghpeaks_Gonzalez(H,numPicos,Trheshold);
hold on
plot(Theta(columnas),Rho(filas), 'linestyle', 'none', 'marker', 's', 'color', 'b');
figure, imagesc(Theta, Rho, Hnew); colormap(hot);

% parametros para unir lineas muy similares y longitud minima de las lineas
FillGap = 100; Minima_longitud = 80;

lineas = houghlines_Gonzalez(f,Theta,Rho,filas,columnas,FillGap,Minima_longitud);
figure, imshow(f), hold on

% procedimiento para eliminar las lineas con similar theta y rho,
% fusionandolas en una unica linea
for k = 1:length(lineas)
    theta_vector(k) = lineas(k).theta;
    rho_vector(k) = lineas(k).rho;
end
theta_v = sort(theta_vector);
rho_v = sort(rho_vector);
dtheta = diff(theta_v);
drho = diff(rho_v);


for k = 1:length(lineas)
    xy = [lineas(k).point1; lineas(k).point2];
    plot(xy(:,2),xy(:,1), 'LineWidth', 3, 'Color','r');
end


