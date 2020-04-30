function [out] = area(fun,x)
%AREA Summary of this function goes here
%   Detailed explanation goes here
dx = x(2)-x(1);
out=0;
for i =1:length(x)-1
   out= out + fun(i)*dx; 
end
end

