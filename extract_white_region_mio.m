function [y_image] = extract_white_region_mio(image)
% extract_yellow_region: Determines the yellow regions in the picture using
% the CIE-XYZ color system, and returns a black and white picture which is
% set on the yellow regions only.

pic = double(image)+1;
% utilizando tecnicas de color la imagen se segmenta separando dos clases.
%lineas_reales1
y1 = ((pic(:,:,1) > 150)&(pic(:,:,2) > 150)&(pic(:,:,3) > 150));  %para lineas simuladas y lineas_reales1
% lineas_reales2
%y1 =  ((pic(:,:,1) > 200)&(pic(:,:,2) > 200)&(pic(:,:,3) > 200)) | ((pic(:,:,1) < pic(:,:,3))&(pic(:,:,2) < pic(:,:,3))&(pic(:,:,3) > 100)) | ((pic(:,:,1) > pic(:,:,2))&(pic(:,:,1) > pic(:,:,3))&(pic(:,:,1) > 200));   % tonos rojos
% Ahora es preciso refinar el umbral de binarizacion
f = rgb2gray(image);

% implementacion del libro de MATLAB pp. 406
T = 0.5*(double(min(f(:))) + double(max(f(:))));
done = false;
while ~done
    g = f >= T;
    Tnext = 0.5*(mean(f(g)) + mean(f(~g)));
    done = abs (T - Tnext) < 0.5;
    T = Tnext;
end
% extraer y ampliar un poquito los bordes para luego identificar las lineas que definen la
% region de la matricula
%BW1 = edge(g,'sobel');
%se require ese tamño de dilatacion porque sino hay una cierta densidad de
%puntos no se detecta exactamente una linea recta.
y2 = bwmorph(g,'dilate',5);

%calcular valores estadisticos de la imagen de entrada para detectar si el
%histogrma es o no luminoso y disperso.
h1 = hist(double(f(:)),256);
[v b] = momentos_stadisticos (h1,3);
%v(1) == media; v(2) = varianza; v(3) = moemento de tercer orden
if v(2) < 0.1
  y_image = y1 & y2;    
else
  y_image = y2;    
end
% esto es para eliminar los reflejos en tonalidades blancas y grises claras

return;