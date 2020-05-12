function [output,reglas_activadas] = inferencia(x1,x2)
%% valores difusos
ng = [-1.0 -1.0 -0.7 -0.55];
nm = [-0.7 -0.5 -0.4 -0.2];
np = [-0.4 -0.3 -0.2 -0.1];
ni = [-0.2 -0.1 0.0 0.0];
ce = [-0.25 0 0 0.25];
pi = [0.0 0.0 0.1 0.2];
pp = [0.1 0.2 0.3 0.4];
pm = [0.2 0.4 0.5 0.7];
pg = [0.55 0.7 1.0 1.0];

%% de_a's
ng_nm = de_a(ng,nm);
ng_np = de_a(ng,np); 
ng_pp = de_a(ng,pp);
np_pi = de_a(np,pi);
np_pg = de_a(np,pg);
ni_pi = de_a(ni,pi);
ni_pp = de_a(ni,pp);
pp_pg = de_a(pp,pg);
pm_pg = de_a(pm,pg);

%% Conjunto de Reglas
E1 =[ng; ng_nm; np; ni; ni; ni_pi; pi; pi; pp; pm_pg; pg; ni; ni; pi; ...
    pi; ng_np; pp_pg]; %Error de presion (EP)
E2 = [ng_pp; ng_np; np_pi; ng_nm; pm_pg; ce; ng_nm; pm_pg; ni_pp; pp_pg;...
    np_pg; pp; np; np; pp; pm_pg; ng_nm]; %Tasa cambio Error de P (TP)
S = [pg; pm; pm; pm; np; ce; pp; nm; nm; nm; ng; ce; pp; ce; np; pg; ng]; %Salida

output=zeros(17,1000);
reglas_activadas=zeros(1,17);
%% Salidas
for i=1:17
    y1 = mu(x1,E1(i,:));
    y2 = mu(x2,E2(i,:));
    [~,y]= trapecio(S(i,:));
    aux = min(y1,y2);
    y = limitar(y,aux);
    output(i,:) = y;
    
    if max(y) > 0
        reglas_activadas(i) =+1;
    end
end
end

