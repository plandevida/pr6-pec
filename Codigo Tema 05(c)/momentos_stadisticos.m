function [v, unv] = momentos_stadisticos(p,n)

% esta funcion implementa los momentos centrales del histograma
% segun la funcion del libro de MATLAB pp. 590

Lp = length(p);
if (Lp ~= 256) & (Lp ~= 65536)
    error('P debe ser un vector de 256 o 65536 elementos');
end
G = Lp - 1;
p = p/sum(p); p = p(:);
z = 0:G;
z = z./G;
m = z*p;
z = z - m;
v = zeros(1,n);
v(1) = m;
for j= 2:n
    v(j) = (z.^j)*p;
end

if nargout > 1
    unv = zeros(1,n);
    unv(1)=m.*G;
    for j=2:n
        unv(j) = ((z*G).^j)*p;
    end
end