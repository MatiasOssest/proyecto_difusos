function [valor] = desdifusion(espacio)
%DESDIFUSION Summary of this function goes here
%   Detailed explanation goes here

[a,b] = size(espacio);
x = linspace(-1,1,b);
valor=0;
area_total=0;
for i=1:a
   fun=espacio(i,:);
   area_total= area_total + area(fun,x);
   valor= valor + area(fun,x)*centro_x(fun,x);
end
if area_total == 0
    valor=0;
else
    valor = valor/area_total;
end
end

