function [output] = limitar(array,top)
%LIMITAR Summary of this function goes here
%   Detailed explanation goes here

for i=1:length(array)
    if array(i) > top
        array(i) = top;
    end
end

output = array;
end

