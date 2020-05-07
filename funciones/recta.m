function [m,c] = recta(x1,x2)
%PENDIENTE Summary of this function goes here
%   Detailed explanation goes her

if x1 == x2
    m=0;
else
    m=1/(x2- x1);
end

c = 1 - m*x2;
end
    
