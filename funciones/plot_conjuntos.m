function [] = plot_conjuntos(Conjuntos,n)
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here
[a,~] = size(Conjuntos);
figure(n)
hold on
for i=1:a
   [x,y] = trapecio(Conjuntos(i,:));
   plot(x,y)
end
ylabel("Grado de pertenencia", 'Fontsize',12)
xlabel("Entrada", 'Fontsize',12)
title("Conjuntos difusos", 'Fontsize',13)
grid()
legend("ng", "nm", "np", "ni", "ce", "pi", "pp", "pm", "pg")
end

