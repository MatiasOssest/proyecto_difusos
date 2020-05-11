function [out] = MoM(fun,x)
%AREA Summary of this function goes here
%   Detailed explanation goes here
maxf=max(fun);
out=[];
for i =1:length(x)-1
   if fun(i)==maxf
       out(i)=x(i);
   end
end
out=mean(out);
end