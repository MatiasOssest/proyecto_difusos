function [C] = de_a(A,B)
%DE_A Summary of this function goes here
%   Detailed explanation goes here
C = [];
C(1) = min(A(1),B(1));
C(2) = min(A(2),B(2));
C(3) = max(A(3),B(3));
C(4) = max(A(4),B(4));
end
