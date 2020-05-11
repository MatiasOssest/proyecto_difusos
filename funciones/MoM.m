function [out] = MoM(fun,x)
%AREA Summary of this function goes here
%   Detailed explanation goes here
maxf=max(fun);
out=NaN(1,length(x));
for i =1:length(x)
   if fun(i)==maxf
       out(i)=x(i);
   end
end
out=round(nanmean(out),2);
end