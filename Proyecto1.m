%% Proyecto 1
% Profesor: Claudio Held
% Auxiliar: Leonardo Causa
% Estudiante: Matías Osses
% Estudiante: Alvaro Toledo

%% Condicion Inicial P=650

%Centro de Gravedad
[PresionCG650,CalorCG650, ErrorCG650, TasaErrorCG650,...
    rulesCG650, reglas_acumCG650] =  Controlador1(650,"CG",30);

%MoM 
[PresionMoM650,CalorMoM650, ErrorMoM650, TasaErrorMoM650,...
    rulesMoM650, reglas_acumMoM650] =  Controlador1(650,"MoM",30);

%Alturas
[Presionh650,Calorh650, Errorh650, TasaErrorh650,...
    rulesh650, reglas_acumh650] =  Controlador1(650,"h",30);

%%Figuras 
graficar_reglas(rulesCG650,1)
graficar_reglas(rulesMoM650,2)
graficar_reglas(rulesh650,3)
graficar_activacion(reglas_acumCG650, reglas_acumMoM650,...
    reglas_acumh650,650,4)

graficar_variables(ErrorCG650, ErrorMoM650, Errorh650, ...
    "Evolución del Error con P(0) = 650", "Error Absoluto",5)

graficar_variables(TasaErrorCG650, TasaErrorMoM650, TasaErrorh650, ...
    "Evolución de la Tasa Error con P(0) = 650", "Tasa de Error",6)

graficar_variables(PresionCG650, PresionMoM650, Presionh650, ...
    "Evolución de la Tasa Error con P(0) = 650", "Presión",7)


%% Condicion Inicial P=730

%Centro de Gravedad
[PresionCG730,CalorCG730, ErrorCG730, TasaErrorCG730,...
    rulesCG730, reglas_acumCG730] =  Controlador1(730,"CG",30);

%MoM 
[PresionMoM730,CalorMoM730, ErrorMoM730, TasaErrorMoM730,...
    rulesMoM730, reglas_acumMoM730] =  Controlador1(730,"MoM",30);

%Alturas
[Presionh730,Calorh730, Errorh730, TasaErrorh730,...
    rulesh730, reglas_acumh730] =  Controlador1(730,"h",30);

%%Figuras 
graficar_reglas(rulesCG730,8)
graficar_reglas(rulesMoM730,9)
graficar_reglas(rulesh730,10)
graficar_activacion(reglas_acumCG730, reglas_acumMoM730,...
    reglas_acumh730,730,11)

graficar_variables(ErrorCG730, ErrorMoM730, Errorh730, ...
    "Evolución del Error con P(0) = 730", "Error Absoluto",12)

graficar_variables(TasaErrorCG730, TasaErrorMoM730, TasaErrorh730, ...
    "Evolución de la Tasa Error con P(0) = 730", "Tasa de Error",13)

graficar_variables(PresionCG730, PresionMoM730, Presionh730, ...
    "Evolución de la Tasa Error con P(0) = 730", "Presión",14)


%% Condicion Inicial P=840

%Centro de Gravedad
[PresionCG840,CalorCG840, ErrorCG840, TasaErrorCG840,...
    rulesCG840, reglas_acumCG840] =  Controlador1(840,"CG",30);

%MoM 
[PresionMoM840,CalorMoM840, ErrorMoM840, TasaErrorMoM840,...
    rulesMoM840, reglas_acumMoM840] =  Controlador1(840,"MoM",30);

%Alturas
[Presionh840,Calorh840, Errorh840, TasaErrorh840,...
    rulesh840, reglas_acumh840] =  Controlador1(840,"h",30);

%%Figuras 
graficar_reglas(rulesCG840,15)
graficar_reglas(rulesMoM840,16)
graficar_reglas(rulesh840,17)
graficar_activacion(reglas_acumCG840, reglas_acumMoM840,...
    reglas_acumh840,840,18)

graficar_variables(ErrorCG840, ErrorMoM840, Errorh840, ...
    "Evolución del Error con P(0) = 840", "Error Absoluto",19)

graficar_variables(TasaErrorCG840, TasaErrorMoM840, TasaErrorh840, ...
    "Evolución de la Tasa Error con P(0) = 840", "Tasa de Error",20)

graficar_variables(PresionCG840, PresionMoM840, Presionh840, ...
    "Evolución de la Tasa Error con P(0) = 840", "Presión",21)
