function [output] = inferencia(x1,x2)
ng = [-1.0 -1.0 -0.75 -0.5];
np = [-0.75 -0.5 -0.25 0];
ce = [-0.3 0 0 0.3];
pp = [0.0 0.25 0.5 0.75];
pg = [0.5 0.75 1.0 1.0];

ng_np = de_a(ng,np); 
ng_pp = de_a(ng,pp);
np_pg = de_a(np,pg);
pp_pg = de_a(pp,pg);

E1 = [ng_np;np_pg;pp_pg;ce;ce;ng_np;ng_pp; pp_pg];
E2 = [ng_np;ng;np;np;pp;pp;ng;pp_pg];
S = [pg;pg;pp;ce;ce;np;ng;ng];

output=zeros(8,length(x1));
for i=1:8
    y1 = mu(x1,E1(i,:));
    y2 = mu(x2,E2(i,:));
    [~,y]= trapecio(S(i,:));
    aux = min(y1,y2);
    y = limitar(y,aux);
    for j=1:1000
        output(i,j) = y(1,j);
    end
end
output = max(output);
end

