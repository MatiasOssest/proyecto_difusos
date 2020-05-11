function [valor] = desdifusion(espacio, metodo)
%DESDIFUSION Summary of this function goes here
%   Detailed explanation goes here

    [~,b] = size(espacio);
    x = linspace(-1,1,b);
    fun = max(espacio);

    if metodo == 'h'
        valor = alturas(espacio,x);
    elseif metodo == "MoM"
        valor = MoM(fun,x);
    elseif metodo == "CG"
        valor = centro_x(fun,x);
    else
        error('El método solicitado es incorrecto')
    end
end

