function [Y] = saturacion(X)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    if X < -15
        Y = -15;
    elseif X > 15
        Y = 15;
    else
        Y=X;
    end
end

