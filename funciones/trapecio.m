function [x,y] = trapecio(A,n)
%TRAPECIO Summary of this function goes here
%   Detailed explanation goes here
if ~exist('n','var')
    n = 1000;
end

x = linspace(-1,1,n);
y = zeros(1,n);
for i=1:n
    y(i) = mu(x(i),A);
end
end
