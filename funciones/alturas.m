function [output] = alturas(espacio,x)
%Método de desdifusión de alturas
%Inputs:
%espacio: Salida reglas difusas
%x: rango de entradas equidistante

    [a,~] = size(espacio);
    alturas_tot = 0;
    for i=1:a
        fun = espacio(i,:); %Salida Regla i
        centro = centro_x(fun,x); %Centro de gravedad
        h = mu2(fun,centro); %Altura del CoG
        alturas_tot = alturas_tot + h;
        output = output + h*centro;
    end
    %Si no hay reglas nulas, se calcula promedio ponderado
    if alturas_tot > 0
        output = output/alturas_tot;
    else
        output=0;
    end
end