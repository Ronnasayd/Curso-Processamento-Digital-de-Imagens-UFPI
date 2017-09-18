function [ new_im ] = imchmean( im,s,Q )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[iml imc] = size(im);
sb = floor(s/2);
new_im_aux = zeros(iml+2*sb,imc+2*sb);
new_im_aux(sb+1:iml+sb,sb+1:imc+sb) = im ;
new_im = im;
for i = 1:iml
    for j = 1:imc
         new_im(i,j) = ((sum(sum(new_im_aux(i:i+s-1,j:j+s-1))))^(Q+1))/((sum(sum(new_im_aux(i:i+s-1,j:j+s-1))))^(Q));
    end
end
end