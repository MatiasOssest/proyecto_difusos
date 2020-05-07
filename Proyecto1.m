%% Proyecto 1
% Profesor: Claudio Held
% Estudiante: Matías Osses
% Estudiante: 

%% Condiciones Iniciales

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
   SS = inferencia(EP, TP);
   dH = desdifusion(SS);
   
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

figure(1)
plot(t,Error)
title('Evolución del Error')

figure(2)
plot(t,TasaError)
title('Evolución Tasa del Error')

figure(3)
plot(t,Presion)
title('Evolución de la Presion')

figure(4)
plot(t,Calor)
title('Evolución del Calor')