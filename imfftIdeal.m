function [ filtro ] = imfftIdeal( siz, ini ,fin )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

filtro = ones(siz);
for x = 1:siz(1)
    for y = 1:siz(2) 
        if sqrt((x - siz(1)/2)^2 + (y - siz(2)/2)^2) >= ini  && sqrt((x - siz(1)/2)^2 + (y - siz(2)/2)^2) <= fin
            filtro(x,y) = 0;
        end
    end
end


end

