function [output] = mu(valor,Cjto)
% Entrega la pertenencia de 'valor' al 'Cjto'
% Valor entre -1 y 1
% Cjto arreglo de 4 puntos

a = Cjto(1);
b = Cjto(2);
c = Cjto(3);
d = Cjto(4);

[m1, c1] = recta(a,b);
[m2, c2] = recta(d,c);

if valor < a
    output=0;
elseif valor < b 
    output = m1*valor + c1;
elseif (valor < c)  
    output = 1;
elseif valor <= d
    output = m2*valor + c2;
else
    output = 0;
end
end

