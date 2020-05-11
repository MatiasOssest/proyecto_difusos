function [out] = mu2(fun,x)
%inputs
%x: entre -1 y 1
%fun: valores

if x < -1 || x > 1
    error('x fuera de rango')
end

dom = linspace(-1,1,length(fun));
dom = abs(dom - x);
[~,indice] = min(dom);

out = fun(indice);
end

