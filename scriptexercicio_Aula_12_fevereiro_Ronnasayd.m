images = {'ferramentas.bmp','Image2.bmp','Lena_ruido.bmp','mammogram.bmp','polem.bmp','Moon.tif','teste.bmp'};
d = [50,100,150,200,250];
for i = 1:length(images)
    for j = 1:length(d)
        im = imread(images{i});
        figure('name',images{i}),subplot(2,2,1),imshow(im);
        fm = fft2(double(im));
        f = fftshift(fm);
        f = abs(f);
        f = 15*log(1 + f);
        subplot(2,2,2),imshow(uint8(f))
        h = iflp(size(fm),d(j));
        subplot(2,2,3),imshow(h)
        imf = uint8(abs(ifft2(fm.*h)));
        subplot(2,2,4),imshow(imf)
    end
    pause
end
            