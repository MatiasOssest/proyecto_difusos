function [] = graficar_variables(v1,v2,v3,tit,yl,n)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

t = 1:length(v1);
figure(n)
grid()
hold on
plot(t,v1)
plot(t,v2, 'r')
plot(t,v3,'g')
ylabel(yl,'Fontsize',13)
xlabel('t', 'Fontsize',13)
title(tit,'Fontsize',14)
legend(["CG","MoM","h"], 'Fontsize',14,'Location','east');
hold off
end

