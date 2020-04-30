function [out] = centro_x(fun,x)
%AREA Summary of this function goes here
%   Detailed explanation goes here
dx = x(2)-x(1);
out=0;
for i =1:length(x)-1
   out= out + x(i)*fun(i)*dx; 
end
if area(fun,x) == 0
    out=0;
else
    out=round(out/area(fun,x),2);
end
end

