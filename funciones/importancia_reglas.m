function [output] = importancia_reglas(salidas)
%Entrega la importancia de las reglas
%Relativo a la regla de mayor área activada.
    [n_reglas, puntos] = size(salidas);
    x = linspace(-1,1,puntos);
    output = zeros(n_reglas,1);
    A_t=0;
    for regla=1:n_reglas
        A = area(salidas(regla,:),x);
        output(regla) = A;
        A_t = A_t + A;
    end   
    output = output*100/A_t;
end

