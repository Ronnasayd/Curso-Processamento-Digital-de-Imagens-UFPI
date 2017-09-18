function [ filtro ] = imfftGaussian( siz, D0 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

filtro = ones(siz);
for x = 1:siz(1)
    for y = 1:siz(2) 
        filtro(x,y) = exp((-eDist(x,y,siz(1)/2,siz(2)/2)^2)/(2*D0^2));
    end
end


end

function [val] = eDist(x,y,xc,yc)

val = sqrt((x - xc)^2 + (y - yc)^2);
end

