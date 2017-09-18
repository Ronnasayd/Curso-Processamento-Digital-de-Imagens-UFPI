function [ new_im ] = imMaxFilter( im,s )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[iml imc] = size(im);
sb = floor(s/2);
new_im_aux = zeros(iml+2*sb,imc+2*sb);
new_im_aux(sb+1:iml+sb,sb+1:imc+sb) = im ;
new_im = im;
for i = 1:iml
    for j = 1:imc
         new_im(i,j) = max(max(new_im_aux(i:i+s-1,j:j+s-1)));
    end
end
end