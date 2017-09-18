function [ new_image ,spectrum] = imfftFilter( image,h)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
imf = fft2(image);
spectrum = uint8(15*log(abs(fftshift(imf)) + 1));
new_image = uint8(abs(ifft2(imf.*h)));

end

