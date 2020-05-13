function [Presion,Calor, Error, TasaError, rules, reglas_acum] = Controlador2(Presion_inicial,metodo_desdif, iteraciones)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    PO = 750;
    P = Presion_inicial; %Presión inicial
    EP = P - PO; %Error inicial
    TP = 0; %Tasa de error inicial
    dH = 0; %Delta calor

    t = iteraciones;
    Error = zeros(1,t);
    TasaError = zeros(1,t);
    Presion = zeros(1,t);
    Calor = zeros(1,t);
    rules = zeros(17,t);
    reglas_acum = zeros(1,17);
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
       [SS,a]= inferencia2(EP, TP);
       r = importancia_reglas(SS);  
       rules(:,i) = r;
       reglas_acum=a+reglas_acum;

       dH = desdifusion(SS,metodo_desdif);

       %desfuzzificación
       dH = dH*15;
       EP = EP*15;

       %Actualización
       P = P + 0.7*dH;
       aux = P - PO;
       TP = aux - EP;
       EP = aux;

    end
end
