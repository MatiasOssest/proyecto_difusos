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
hold on
ax1 = subplot(3,1,1);
for i=1:6
plot(tiempo,rules(i,:));
end
legend("regla 1", "regla 2", "regla 3",...
    "regla 4", "regla 5", "regla 6")

subplot(3,1,2)
for i=7:12
plot(tiempo,rules(i,:));
end
legend("regla 7", "regla 8", "regla 9",...
    "regla 10", "regla 11", "regla 12")

subplot(3,1,3)
for i=13:17
plot(tiempo,rules(i,:));
end
legend("regla 13", "regla 14", "regla 15",...
    "regla 16", "regla 17")

hold off
%%
figure(1)
bar(reglas1)
title('Evolución de la secuencia de reglas 1 P0=650 y defuzz CG')

figure(2)
bar(reglas2)
title('Evolución de la secuencia de reglas 2 P0=650 y defuzz CG')

figure(3)
plot(t,Error)
title('Evolución del Error con P0=650 y defuzz CG')

figure(4)
plot(t,TasaError)
title('Evolución Tasa del Error con P0=650 y defuzz CG')
    
figure(5)
plot(t,Presion)
title('Evolución de la Presion con P0=650 y defuzz CG')

figure(6)
plot(t,Calor)
title('Evolución del Calor con P0=650 y defuzz CG')


PO = 750;
P = 650; %Presión inicial
EP = P - PO; %Error inicial
TP = 0; %Tasa de error inicial
dH = 0; %Delta calor

t = 200;
Error = zeros(1,t);
TasaError = zeros(1,t);
Presion = zeros(1,t);
Calor = zeros(1,t);
reglas1=zeros(1,17);
reglas2=zeros(1,17);
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

t = 1:200;


figure(7)
bar(reglas1)
title('Evolución de la secuencia de reglas 1 P0=650 y defuzz MoM')

figure(8)
bar(reglas2)
title('Evolución de la secuencia de reglas 2 P0=650 y defuzz MoM')

figure(9)
plot(t,Error)
title('Evolución del Error con P0=650 y defuzz MoM')

figure(10)
plot(t,TasaError)
title('Evolución Tasa del Error con P0=650 y defuzz MoM')

figure(11)
plot(t,Presion)
title('Evolución de la Presion con P0=650 y defuzz MoM')

figure(12)
plot(t,Calor)
title('Evolución del Calor con P0=650 y defuzz MoM')


%%
%%Condicion Inicial P=730
PO = 750;
P = 730; %Presión inicial
EP = P - PO; %Error inicial
TP = 0; %Tasa de error inicial
dH = 0; %Delta calor

t = 200;
Error = zeros(1,t);
TasaError = zeros(1,t);
Presion = zeros(1,t);
Calor = zeros(1,t);
reglas1=zeros(1,17);
reglas2=zeros(1,17);
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

t = 1:200;

figure(13)
bar(reglas1)
title('Evolución de la secuencia de reglas 1 P0=730 y defuzz CG')

figure(14)
bar(reglas2)
title('Evolución de la secuencia de reglas 2 P0=730 y defuzz CG')

figure(15)
plot(t,Error)
title('Evolución del Error con P0=730 y defuzz CG')

figure(16)
plot(t,TasaError)
title('Evolución Tasa del Error con P0=730 y defuzz CG')

figure(17)
plot(t,Presion)
title('Evolución de la Presion con P0=730 y defuzz CG')

figure(18)
plot(t,Calor)
title('Evolución del Calor con P0=730 y defuzz CG')

PO = 750;
P = 730; %Presión inicial
EP = P - PO; %Error inicial
TP = 0; %Tasa de error inicial
dH = 0; %Delta calor

t = 200;
Error = zeros(1,t);
TasaError = zeros(1,t);
Presion = zeros(1,t);
Calor = zeros(1,t);
reglas1=zeros(1,17);
reglas2=zeros(1,17);
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

t = 1:200;

figure(19)
bar(reglas1)
title('Evolución de la secuencia de reglas 1 P0=730 y defuzz MoM')

figure(20)
bar(reglas2)
title('Evolución de la secuencia de reglas 2 P0=730 y defuzz MoM')

figure(21)
plot(t,Error)
title('Evolución del Error con P0=730 y defuzz MoM')

figure(22)
plot(t,TasaError)
title('Evolución Tasa del Error con P0=730 y defuzz MoM')

figure(23)
plot(t,Presion)
title('Evolución de la Presion con P0=730 y defuzz MoM')

figure(24)
plot(t,Calor)
title('Evolución del Calor con P0=730 y defuzz MoM')

%%
%%Condicion Inicial P=840
PO = 750;
P = 840; %Presión inicial
EP = P - PO; %Error inicial
TP = 0; %Tasa de error inicial
dH = 0; %Delta calor

t = 200;
Error = zeros(1,t);
TasaError = zeros(1,t);
Presion = zeros(1,t);
Calor = zeros(1,t);
reglas1=zeros(1,17);
reglas2=zeros(1,17);
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

t = 1:200;

figure(25)
bar(reglas1)
title('Evolución de la secuencia de reglas 1 P0=840 y defuzz CG')

figure(26)
bar(reglas2)
title('Evolución de la secuencia de reglas 2 P0=840 y defuzz CG')

figure(27)
plot(t,Error)
title('Evolución del Error con P0=840 y defuzz CG')

figure(28)
plot(t,TasaError)
title('Evolución Tasa del Error con P0=840 y defuzz CG')

figure(29)
plot(t,Presion)
title('Evolución de la Presion con P0=840 y defuzz CG')

figure(30)
plot(t,Calor)
title('Evolución del Calor con P0=840 y defuzz CG')

%%Condicion Inicial P=840
PO = 750;
P = 840; %Presión inicial
EP = P - PO; %Error inicial
TP = 0; %Tasa de error inicial
dH = 0; %Delta calor

t = 200;
Error = zeros(1,t);
TasaError = zeros(1,t);
Presion = zeros(1,t);
Calor = zeros(1,t);
reglas1=zeros(1,17);
reglas2=zeros(1,17);
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
   reglas1=a+reglas1;
   reglas2=b+reglas2;
   dH = desdifusion(SS,"MoM");
   
   %desfuzzificación
   dH = dH*15;
   EP = EP*15;
   
   %Actualización
   P = P + 0.7*dH;
   aux = P - PO;
   TP = aux - EP;
   EP = aux;
end

t = 1:200;

figure(31)
bar(reglas1)
title('Evolución de la secuencia de reglas 1 P0=840 y defuzz MoM')

figure(32)
bar(reglas2)
title('Evolución de la secuencia de reglas 2 P0=840 y defuzz MoM')

figure(33)
plot(t,Error)
title('Evolución del Error con P0=840 y defuzz MoM')

figure(34)
plot(t,TasaError)
title('Evolución Tasa del Error con P0=840 y defuzz MoM')

figure(35)
plot(t,Presion)
title('Evolución de la Presion con P0=840 y defuzz MoM')

figure(36)
plot(t,Calor)
title('Evolución del Calor con P0=840 y defuzz MoM')