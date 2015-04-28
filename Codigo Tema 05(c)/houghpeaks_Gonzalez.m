function [r,c,hnew] = houghpeaks_Gonzalez(h,numpeaks,threshold,nhood)
%version del libro Gonzalez y Woods pp. 399 del Matlab
% detecta la fila (r) y la columna (c) donde se encuentran los picos
if nargin < 4
    nhood = size(h)/50;
    %asegurar que la dimension de la vecindad es impar
    nhood= max(2*ceil(nhood/2) + 1,1);
end

if nargin < 3
    threshold = 0.5*max(h(:));
end

if nargin < 2
    numpeaks = 1;
end

done = false;
hnew = h; r = []; c = [];

while ~done
    [p, q] = find(hnew == max(hnew(:)));
    p = p(1); q = q(1);
    if hnew(p,q) >= threshold
        r(end + 1) = p; c(end + 1) = q;
        %suprimir este maximo y sus vecinos proximos
        p1 = p - (nhood(1) - 1)/2; p2 = p + (nhood(1) - 1)/2;
        q1 = q - (nhood(2) - 1)/2; q2 = q + (nhood(2) - 1)/2;
        [pp,qq] = ndgrid(p1:p2, q1:q2);
        pp = pp(:); qq = qq(:);
        
        %alejarse de las coordenadas vecinas en la direccion de rho fuera
        badrho = find((pp< 1) | (pp > size(h,1)));
        pp(badrho) = []; qq(badrho) = [];
        
        theta_too_low = find(qq < 1);
        qq(theta_too_low) = size(h,2) + qq(theta_too_low);
        pp(theta_too_low) = size(h,1) - pp(theta_too_low) + 1;
        
        theta_too_high = find(qq > size(h,2));
        qq(theta_too_high) = qq(theta_too_high) - size(h,2);
        pp(theta_too_high) = size(h,1) - pp(theta_too_high) + 1;

        hnew(sub2ind(size(hnew), pp, qq)) = 0;
        done = length(r) == numpeaks;
    else
        done = true;
    end
end

