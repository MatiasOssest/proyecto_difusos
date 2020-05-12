function [] = graficar_activacion(c1,c2,c3,P0,n)
%UNTITLED5 Summary of this function goes here
%   Detailed explanatio

figure(n)
subplot(3,1,1)

bar(c1)
title('Desdifusión CG','Fontsize',12)
xticks(1:17)
grid()

subplot(3,1,2)
bar(c2)
xticks(1:17)
grid()
ylabel('Veces activada','Fontsize',16)
title('Desdifusión MoM','Fontsize',12)
subplot(3,1,3)
bar(c3)
xticks(1:17)
grid()
title('Desdifusión alturas','Fontsize',12)
xlabel('Reglas','Fontsize',14)
sup = "Reglas activadas para P(0)= " + P0;
suptitle(sup)
end

