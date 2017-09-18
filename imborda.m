function [ new_im_P, new_im_B ] = imborda( image,T )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[l c] = size(image);
new_im_P = zeros(2*T + l, 2*T + c, 'uint8');
new_im_B = 255*ones(2*T + l, 2*T + c, 'uint8');
new_im_P(T+1:l+T,T+1:c+T) = image;
new_im_B(T+1:l+T,T+1:c+T) = image;

end

