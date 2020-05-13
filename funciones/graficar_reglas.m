function [] = graficar_reglas(rules, n)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

tiempo = 1:length(rules(1,:));
figure(n)
ax = subplot(3,1,1);
title("Importancia de cada regla",'Fontsize',13)
hold on
for i=1:6
plot(tiempo,rules(i,:),'o');
end
set(gca,'Fontsize',10)
yticks(0:25:100)
ylim([-0.1 100.1])
xticks(0:2:(length(rules(1,:))+1))
grid()
hold off
legend("regla 1", "regla 2", "regla 3",...
    "regla 4", "regla 5", "regla 6")

ax1=subplot(3,1,2);
hold on
for i=7:12
plot(tiempo,rules(i,:),'o');
end
set(gca,'Fontsize',10)
yticks(0:25:100)
ylim([-0.1 100.1])
ylabel("Importancia Regla [%]", 'Fontsize',13)
xticks(0:2:(length(rules(1,:))+1))
grid()
hold off
legend("regla 7", "regla 8", "regla 9",...
    "regla 10", "regla 11", "regla 12")

ax2=subplot(3,1,3);
hold on
for i=13:17
plot(tiempo,rules(i,:),'o');
end
set(gca,'Fontsize',10)
yticks(0:25:100)
ylim([-0.1 100.1])
xticks(0:2:(length(rules(1,:))+1))
xlabel("tiempo (t)",'Fontsize',13)
grid()
hold off
legend("regla 13", "regla 14", "regla 15",...
    "regla 16", "regla 17")
end
