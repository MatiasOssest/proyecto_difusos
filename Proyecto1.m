%% Proyecto 1
% Profesor: Claudio Held
% Auxiliar: Leonardo Causa
% Estudiante: Matías Osses
% Estudiante: Alvaro Toledo

%% Condicion Inicial P=650

PO = 750;
P = 650; %Presión inicial
EP = P - PO; %Error inicial
TP = 0; %Tasa de error inicial
dH = 0; %Delta calor

t = 30;
Error = zeros(1,t);
TasaError = zeros(1,t);
Presion = zeros(1,t);
Calor = zeros(1,t);
reglas1=zeros(1,17);
reglas2=zeros(1,17);
rules = zeros(17,t);
tiempo = 1:t;
for i=1:t
   %Se guarda los valores actuales de cada variable
   Error(1,i) = EP;
   TasaError(1,i)= TP;
   Presion(1,i) = P;
   Calor(1,i) = dH;
   
   %Sensor
   EP = saturacion(EP);
   TP = saturacion(TP);
   
   %Fuzzificación
   EP = EP/15;
   TP = TP/15;
   
   %CLD
   [SS,a,b]= inferencia(EP, TP);
   r = importancia_reglas(SS); 
   for j=1:17 
    rules(j,i) = r(j);
   end
   reglas1=a+reglas1;
   reglas2=b+reglas2;
   
   dH = desdifusion(SS,'CG');
   
   %desfuzzificación
   dH = dH*15;
   EP = EP*15;
   
   %Actualización
   P = P + 0.7*dH;
   aux = P - PO;
   TP = aux - EP;
   EP = aux;
   
end

figure(1)
hold on
ax1 = subplot(3,1,1);
hold on
for i=1:6
plot(tiempo,rules(i,:));
end
hold off
legend("regla 1", "regla 2", "regla 3",...
    "regla 4", "regla 5", "regla 6")

subplot(3,1,2)
hold on
for i=7:12
plot(tiempo,rules(i,:));
end
hold off
legend("regla 7", "regla 8", "regla 9",...
    "regla 10", "regla 11", "regla 12")

subplot(3,1,3)
hold on
for i=13:17
plot(tiempo,rules(i,:));
end
hold off
legend("regla 13", "regla 14", "regla 15",...
    "regla 16", "regla 17")

reglas1CG650=reglas1;
reglas2CG650=reglas2;
ErrorCG650=Error;
TasaErrorCG650=TasaError;



PO = 750;
P = 650; %Presión inicial
EP = P - PO; %Error inicial
TP = 0; %Tasa de error inicial
dH = 0; %Delta calor

t = 30;
Error = zeros(1,t);
TasaError = zeros(1,t);
Presion = zeros(1,t);
Calor = zeros(1,t);
reglas1=zeros(1,17);
reglas2=zeros(1,17);
rules = zeros(17,t);
tiempo = 1:t;
for i=1:t
   %Se guarda los valores actuales de cada variable
   Error(1,i) = EP;
   TasaError(1,i)= TP;
   Presion(1,i) = P;
   Calor(1,i) = dH;
   
   %Sensor
   EP = saturacion(EP);
   TP = saturacion(TP);
   
   %Fuzzificación
   EP = EP/15;
   TP = TP/15;
   
   %CLD
   [SS,a,b]= inferencia(EP, TP);
   r = importancia_reglas(SS); 
   for j=1:17 
    rules(j,i) = r(j);
   end
   reglas1=a+reglas1;
   reglas2=b+reglas2;

   dH = desdifusion(SS,'MoM');
   
   %desfuzzificación
   dH = dH*15;
   EP = EP*15;
   
   %Actualización
   P = P + 0.7*dH;
   aux = P - PO;
   TP = aux - EP;
   EP = aux;
   
end

reglas1MoM650=reglas1;
reglas2MoM650=reglas2;
ErrorMoM650=Error;
TasaErrorMoM650=TasaError;

figure(2)
ax2 = subplot(3,1,1);
hold on
for i=1:6
plot(tiempo,rules(i,:));
end
hold off
legend("regla 1", "regla 2", "regla 3",...
    "regla 4", "regla 5", "regla 6")

subplot(3,1,2)
hold on
for i=7:12
plot(tiempo,rules(i,:));
end
hold off
legend("regla 7", "regla 8", "regla 9",...
    "regla 10", "regla 11", "regla 12")

subplot(3,1,3)
hold on
for i=13:17
plot(tiempo,rules(i,:));
end
hold off
legend("regla 13", "regla 14", "regla 15",...
    "regla 16", "regla 17")


PO = 750;
P = 650; %Presión inicial
EP = P - PO; %Error inicial
TP = 0; %Tasa de error inicial
dH = 0; %Delta calor

t = 30;
Error = zeros(1,t);
TasaError = zeros(1,t);
Presion = zeros(1,t);
Calor = zeros(1,t);
reglas1=zeros(1,17);
reglas2=zeros(1,17);
rules = zeros(17,t);
tiempo = 1:t;
for i=1:t
   %Se guarda los valores actuales de cada variable
   Error(1,i) = EP;
   TasaError(1,i)= TP;
   Presion(1,i) = P;
   Calor(1,i) = dH;
   
   %Sensor
   EP = saturacion(EP);
   TP = saturacion(TP);
   
   %Fuzzificación
   EP = EP/15;
   TP = TP/15;
   
   %CLD
   [SS,a,b]= inferencia(EP, TP);
   r = importancia_reglas(SS); 
   for j=1:17 
    rules(j,i) = r(j);
   end
   reglas1=a+reglas1;
   reglas2=b+reglas2;

   dH = desdifusion(SS,'h');
   
   %desfuzzificación
   dH = dH*15;
   EP = EP*15;
   
   %Actualización
   P = P + 0.7*dH;
   aux = P - PO;
   TP = aux - EP;
   EP = aux;
   
end

reglas1h650=reglas1;
reglas2h650=reglas2;
Errorh650=Error;
TasaErrorh650=TasaError;

figure(3)
ax3 = subplot(3,1,1);
hold on
for i=1:6
plot(tiempo,rules(i,:));
end
hold off
legend("regla 1", "regla 2", "regla 3",...
    "regla 4", "regla 5", "regla 6")
subplot(3,1,2)
hold on
for i=7:12
plot(tiempo,rules(i,:));
end
hold off
legend("regla 7", "regla 8", "regla 9",...
    "regla 10", "regla 11", "regla 12")
subplot(3,1,3)
hold on
for i=13:17
plot(tiempo,rules(i,:));
end
hold off
legend("regla 13", "regla 14", "regla 15",...
    "regla 16", "regla 17")

%%
%%Figuras con P=650

t = 1:30;

figure(4)
subplot(3,1,1)
bar(reglas1CG650)
title('CG')
ylabel('Veces activada')
subplot(3,1,2)
bar(reglas1MoM650)
title('MoM')
ylabel('Veces activada')
subplot(3,1,3)
bar(reglas1h650)
title('h')
suptitle('Reglas activadas de la entrada 1 para P=650')
xlabel('Reglas')
ylabel('Veces activada')

figure(5)
subplot(3,1,1)
bar(reglas2CG650)
title('CG')
ylabel('Veces activada')
subplot(3,1,2)
bar(reglas2MoM650)
title('MoM')
ylabel('Veces activada')
subplot(3,1,3)
bar(reglas2h650)
title('h')
xlabel('Reglas')
ylabel('Veces activada')
suptitle('Reglas activadas de la entrada 2 para P=650')

figure(6)
hold on
plot(t,ErrorCG650)
plot(t,ErrorMoM650)
plot(t,Errorh650)
ylabel('Porcentaje')
xlabel('t')
title('Evolución del Error con P=650')
legend('CG','MoM','h')
hold off

figure(7)
hold on
plot(t,TasaErrorCG650)
plot(t,TasaErrorMoM650)
plot(t,TasaErrorh650)
xlabel('t')
ylabel('Tasa')
title('Evolución de la Tasa del Error con P=650')
legend('CG','MoM','h')
hold off

%%
%%Condicion Inicial P=730
PO = 750;
P = 730; %Presión inicial
EP = P - PO; %Error inicial
TP = 0; %Tasa de error inicial
dH = 0; %Delta calor

t = 30;
Error = zeros(1,t);
TasaError = zeros(1,t);
Presion = zeros(1,t);
Calor = zeros(1,t);
reglas1=zeros(1,17);
reglas2=zeros(1,17);
tiempo = 1:t;
for i=1:t
   %Se guarda los valores actuales de cada variable
   Error(1,i) = EP;
   TasaError(1,i)= TP;
   Presion(1,i) = P;
   Calor(1,i) = dH;
   
   %Sensor
   EP = saturacion(EP);
   TP = saturacion(TP);
   
   %Fuzzificación
   EP = EP/15;
   TP = TP/15;
   
   %CLD
   [SS,a,b]= inferencia(EP, TP);
   r = importancia_reglas(SS); 
   for j=1:17 
    rules(j,i) = r(j);
   end
   reglas1=a+reglas1;
   reglas2=b+reglas2;
   
   dH = desdifusion(SS,'CG');
   
   %desfuzzificación
   dH = dH*15;
   EP = EP*15;
   
   %Actualización
   P = P + 0.7*dH;
   aux = P - PO;
   TP = aux - EP;
   EP = aux;
end


reglas1CG730=reglas1;
reglas2CG730=reglas2;
ErrorCG730=Error;
TasaErrorCG730=TasaError;

figure(8)
ax4 = subplot(3,1,1);
hold on
for i=1:6
plot(tiempo,rules(i,:));
end
hold off
legend("regla 1", "regla 2", "regla 3",...
    "regla 4", "regla 5", "regla 6")
subplot(3,1,2)
hold on
for i=7:12
plot(tiempo,rules(i,:));
end
hold off
legend("regla 7", "regla 8", "regla 9",...
    "regla 10", "regla 11", "regla 12")
subplot(3,1,3)
hold on
for i=13:17
plot(tiempo,rules(i,:));
end
hold off
legend("regla 13", "regla 14", "regla 15",...
    "regla 16", "regla 17")

PO = 750;
P = 730; %Presión inicial
EP = P - PO; %Error inicial
TP = 0; %Tasa de error inicial
dH = 0; %Delta calor

t = 30;
Error = zeros(1,t);
TasaError = zeros(1,t);
Presion = zeros(1,t);
Calor = zeros(1,t);
reglas1=zeros(1,17);
reglas2=zeros(1,17);
tiempo = 1:t;

for i=1:t
   %Se guarda los valores actuales de cada variable
   Error(1,i) = EP;
   TasaError(1,i)= TP;
   Presion(1,i) = P;
   Calor(1,i) = dH;
   
   %Sensor
   EP = saturacion(EP);
   TP = saturacion(TP);
   
   %Fuzzificación
   EP = EP/15;
   TP = TP/15;
   
   %CLD
   [SS,a,b]= inferencia(EP, TP);
   r = importancia_reglas(SS); 
   for j=1:17 
    rules(j,i) = r(j);
   end
   reglas1=a+reglas1;
   reglas2=b+reglas2;
   dH = desdifusion(SS,'MoM');
   %desfuzzificación
   dH = dH*15;
   EP = EP*15;
   
   %Actualización
   P = P + 0.7*dH;
   aux = P - PO;
   TP = aux - EP;
   EP = aux;
end


reglas1MoM730=reglas1;
reglas2MoM730=reglas2;
ErrorMoM730=Error;
TasaErrorMoM730=TasaError;


figure(9)
ax5 = subplot(3,1,1);
hold on
for i=1:6
plot(tiempo,rules(i,:));
end
hold off
legend("regla 1", "regla 2", "regla 3",...
    "regla 4", "regla 5", "regla 6")
subplot(3,1,2)
hold on
for i=7:12
plot(tiempo,rules(i,:));
end
hold off
legend("regla 7", "regla 8", "regla 9",...
    "regla 10", "regla 11", "regla 12")
subplot(3,1,3)
hold on
for i=13:17
plot(tiempo,rules(i,:));
end
hold off
legend("regla 13", "regla 14", "regla 15",...
    "regla 16", "regla 17")

PO = 750;
P = 730; %Presión inicial
EP = P - PO; %Error inicial
TP = 0; %Tasa de error inicial
dH = 0; %Delta calor

t = 30;
Error = zeros(1,t);
TasaError = zeros(1,t);
Presion = zeros(1,t);
Calor = zeros(1,t);
reglas1=zeros(1,17);
reglas2=zeros(1,17);
rules = zeros(17,t);
tiempo = 1:t;
for i=1:t
   %Se guarda los valores actuales de cada variable
   Error(1,i) = EP;
   TasaError(1,i)= TP;
   Presion(1,i) = P;
   Calor(1,i) = dH;
   
   %Sensor
   EP = saturacion(EP);
   TP = saturacion(TP);
   
   %Fuzzificación
   EP = EP/15;
   TP = TP/15;
   
   %CLD
   [SS,a,b]= inferencia(EP, TP);
   r = importancia_reglas(SS); 
   for j=1:17 
    rules(j,i) = r(j);
   end
   reglas1=a+reglas1;
   reglas2=b+reglas2;

   dH = desdifusion(SS,'h');
   
   %desfuzzificación
   dH = dH*15;
   EP = EP*15;
   
   %Actualización
   P = P + 0.7*dH;
   aux = P - PO;
   TP = aux - EP;
   EP = aux;
   
end

reglas1h730=reglas1;
reglas2h730=reglas2;
Errorh730=Error;
TasaErrorh730=TasaError;

figure(10)
ax6 = subplot(3,1,1);
hold on
for i=1:6
plot(tiempo,rules(i,:));
end
hold off
legend("regla 1", "regla 2", "regla 3",...
    "regla 4", "regla 5", "regla 6")
subplot(3,1,2)
hold on
for i=7:12
plot(tiempo,rules(i,:));
end
hold off
legend("regla 7", "regla 8", "regla 9",...
    "regla 10", "regla 11", "regla 12")
subplot(3,1,3)
hold on
for i=13:17
plot(tiempo,rules(i,:));
end
hold off
legend("regla 13", "regla 14", "regla 15",...
    "regla 16", "regla 17")
%%
%%Figuras con P=730

t = 1:30;

figure(11)
subplot(3,1,1)
bar(reglas1CG730)
title('CG')
ylabel('Veces activada')
subplot(3,1,2)
bar(reglas1MoM730)
title('MoM')
ylabel('Veces activada')
subplot(3,1,3)
bar(reglas1h730)
title('h')
suptitle('Reglas activadas de la entrada 1 para P=730')
xlabel('Reglas')
ylabel('Veces activada')

figure(12)
subplot(3,1,1)
bar(reglas2CG730)
title('CG')
ylabel('Veces activada')
subplot(3,1,2)
bar(reglas2MoM730)
title('MoM')
ylabel('Veces activada')
subplot(3,1,3)
bar(reglas2h730)
title('h')
xlabel('Reglas')
ylabel('Veces activada')
suptitle('Reglas activadas de la entrada 2 para P=730')

figure(13)
hold on
plot(t,ErrorCG730)
plot(t,ErrorMoM730)
plot(t,Errorh730)
ylabel('Porcentaje')
xlabel('t')
title('Evolución del Error con P=730')
legend('CG','MoM','h')
hold off

figure(14)
hold on
plot(t,TasaErrorCG730)
plot(t,TasaErrorMoM730)
plot(t,TasaErrorh730)
xlabel('t')
ylabel('Tasa')
title('Evolución de la Tasa del Error con P=730')
legend('CG','MoM','h')
hold off

%%
%%Condicion Inicial P=840
PO = 750;
P = 840; %Presión inicial
EP = P - PO; %Error inicial
TP = 0; %Tasa de error inicial
dH = 0; %Delta calor

t = 30;
Error = zeros(1,t);
TasaError = zeros(1,t);
Presion = zeros(1,t);
Calor = zeros(1,t);
reglas1=zeros(1,17);
reglas2=zeros(1,17);
rules = zeros(17,t);
tiempo = 1:t;

for i=1:t
   %Se guarda los valores actuales de cada variable
   Error(1,i) = EP;
   TasaError(1,i)= TP;
   Presion(1,i) = P;
   Calor(1,i) = dH;
   
   %Sensor
   EP = saturacion(EP);
   TP = saturacion(TP);
   
   %Fuzzificación
   EP = EP/15;
   TP = TP/15;
   
   %CLD
   [SS,a,b]= inferencia(EP, TP);
   r = importancia_reglas(SS); 
   for j=1:17 
    rules(j,i) = r(j);
   end
   reglas1=a+reglas1;
   reglas2=b+reglas2;
   dH = desdifusion(SS,'CG');
   
   %desfuzzificación
   dH = dH*15;
   EP = EP*15;
   
   %Actualización
   P = P + 0.7*dH;
   aux = P - PO;
   TP = aux - EP;
   EP = aux;
end

reglas1CG840=reglas1;
reglas2CG840=reglas2;
ErrorCG840=Error;
TasaErrorCG840=TasaError;

figure(15)
ax7 = subplot(3,1,1);
hold on
for i=1:6
plot(tiempo,rules(i,:));
end
hold off
legend("regla 1", "regla 2", "regla 3",...
    "regla 4", "regla 5", "regla 6")
subplot(3,1,2)
hold on
for i=7:12
plot(tiempo,rules(i,:));
end
hold off
legend("regla 7", "regla 8", "regla 9",...
    "regla 10", "regla 11", "regla 12")
subplot(3,1,3)
hold on
for i=13:17
plot(tiempo,rules(i,:));
end
hold off
legend("regla 13", "regla 14", "regla 15",...
    "regla 16", "regla 17")

%%Condicion Inicial P=840
PO = 750;
P = 840; %Presión inicial
EP = P - PO; %Error inicial
TP = 0; %Tasa de error inicial
dH = 0; %Delta calor

t = 30;
Error = zeros(1,t);
TasaError = zeros(1,t);
Presion = zeros(1,t);
Calor = zeros(1,t);
reglas1=zeros(1,17);
reglas2=zeros(1,17);
rules = zeros(17,t);
tiempo = 1:t;
for i=1:t
   %Se guarda los valores actuales de cada variable
   Error(1,i) = EP;
   TasaError(1,i)= TP;
   Presion(1,i) = P;
   Calor(1,i) = dH;
   
   %Sensor
   EP = saturacion(EP);
   TP = saturacion(TP);
   
   %Fuzzificación
   EP = EP/15;
   TP = TP/15;
   
   %CLD
   [SS,a,b]= inferencia(EP, TP);
   r = importancia_reglas(SS); 
   for j=1:17 
    rules(j,i) = r(j);
   end
   reglas1=a+reglas1;
   reglas2=b+reglas2;
   dH = desdifusion(SS,'MoM');
   
   %desfuzzificación
   dH = dH*15;  
   EP = EP*15;
   
   %Actualización
   P = P + 0.7*dH;
   aux = P - PO;
   TP = aux - EP;
   EP = aux;
end

reglas1MoM840=reglas1;
reglas2MoM840=reglas2;
ErrorMoM840=Error;
TasaErrorMoM840=TasaError;


figure(16)
ax8 = subplot(3,1,1);
hold on
for i=1:6
plot(tiempo,rules(i,:));
end
hold off
legend("regla 1", "regla 2", "regla 3",...
    "regla 4", "regla 5", "regla 6")
subplot(3,1,2)
hold on
for i=7:12
plot(tiempo,rules(i,:));
end
hold off
legend("regla 7", "regla 8", "regla 9",...
    "regla 10", "regla 11", "regla 12")
subplot(3,1,3)
hold on
for i=13:17
plot(tiempo,rules(i,:));
end
hold off
legend("regla 13", "regla 14", "regla 15",...
    "regla 16", "regla 17")

PO = 750;
P = 840; %Presión inicial
EP = P - PO; %Error inicial
TP = 0; %Tasa de error inicial
dH = 0; %Delta calor

t = 30;
Error = zeros(1,t);
TasaError = zeros(1,t);
Presion = zeros(1,t);
Calor = zeros(1,t);
reglas1=zeros(1,17);
reglas2=zeros(1,17);
rules = zeros(17,t);
tiempo = 1:t;
for i=1:t
   %Se guarda los valores actuales de cada variable
   Error(1,i) = EP;
   TasaError(1,i)= TP;
   Presion(1,i) = P;
   Calor(1,i) = dH;
   
   %Sensor
   EP = saturacion(EP);
   TP = saturacion(TP);
   
   %Fuzzificación
   EP = EP/15;
   TP = TP/15;
   
   %CLD
   [SS,a,b]= inferencia(EP, TP);
   r = importancia_reglas(SS); 
   for j=1:17 
    rules(j,i) = r(j);
   end
   reglas1=a+reglas1;
   reglas2=b+reglas2;

   dH = desdifusion(SS,'h');
   
   %desfuzzificación
   dH = dH*15;
   EP = EP*15;
   
   %Actualización
   P = P + 0.7*dH;
   aux = P - PO;
   TP = aux - EP;
   EP = aux;
   
end

reglas1h840=reglas1;
reglas2h840=reglas2;
Errorh840=Error;
TasaErrorh840=TasaError;

figure(17)
ax9 = subplot(3,1,1);
hold on
for i=1:6
plot(tiempo,rules(i,:));
end
hold off
legend("regla 1", "regla 2", "regla 3",...
    "regla 4", "regla 5", "regla 6")
subplot(3,1,2)
hold on
for i=7:12
plot(tiempo,rules(i,:));
end
hold off
legend("regla 7", "regla 8", "regla 9",...
    "regla 10", "regla 11", "regla 12")
subplot(3,1,3)
hold on
for i=13:17
plot(tiempo,rules(i,:));
end
hold off
legend("regla 13", "regla 14", "regla 15",...
    "regla 16", "regla 17")
%%
%%Figuras con P=840

t = 1:30;

figure(18)
subplot(3,1,1)
bar(reglas1CG840)
title('CG')
ylabel('Veces activada')
subplot(3,1,2)
bar(reglas1MoM840)
title('MoM')
ylabel('Veces activada')
subplot(3,1,3)
bar(reglas1h840)
title('h')
suptitle('Reglas activadas de la entrada 1 para P=840')
xlabel('Reglas')
ylabel('Veces activada')

figure(19)
subplot(3,1,1)
bar(reglas2CG840)
title('CG')
ylabel('Veces activada')
subplot(3,1,2)
bar(reglas2MoM840)
title('MoM')
ylabel('Veces activada')
subplot(3,1,3)
bar(reglas2h840)
title('h')
xlabel('Reglas')
ylabel('Veces activada')
suptitle('Reglas activadas de la entrada 2 para P=840')

figure(20)
hold on
plot(t,ErrorCG840)
plot(t,ErrorMoM840)
plot(t,Errorh840)
ylabel('Porcentaje')
xlabel('t')
title('Evolución del Error con P=840')
legend('CG','MoM','h')
hold off

figure(21)
hold on
plot(t,TasaErrorCG840)
plot(t,TasaErrorMoM840)
plot(t,TasaErrorh840)
xlabel('t')
ylabel('Tasa')
title('Evolución de la Tasa del Error con P=840')
legend('CG','MoM','h')
hold off