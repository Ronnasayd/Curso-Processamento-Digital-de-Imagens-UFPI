function [ filtro ] = imfftButterworth( siz, D0,n )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

filtro = ones(siz);
for x = 1:siz(1)
    for y = 1:siz(2) 
        filtro(x,y) = 1/(1 + (euclidDist(x,y,siz(1)/2,siz(2)/2)/D0)^(2*n));
    end
end


end

function [val] = euclidDist(x,y,xc,yc)

val = sqrt((x - xc)^2 + (y - yc)^2);
end

