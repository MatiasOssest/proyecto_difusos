function [output] = importancia_reglas(salidas)
%Entrega la importancia de las reglas
%Relativo a la regla de mayor área activada.
    [n_reglas, puntos] = size(salidas);
    x = linspace(-1,1,puntos);
    area_max = 0;
    output = zeros(n_reglas,1);
    for regla=1:n_reglas
        A = area(salidas(regla),x);
        if A > area_max
            area_max = A;
        end
        output(regla,1) = A;
    end
    
    if area_max > 0
        output = output/area_max;
    else
        output = zeros(n_reglas,1);
    end
end

