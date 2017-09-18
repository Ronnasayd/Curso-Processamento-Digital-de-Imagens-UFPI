image = imread('grade.bmp');
%image = imnoise(image,'gaussian');

figure('name','Original'),imshow(image)
h3 = fspecial('average',3);
image_f3 = imfilter(image,h3);  % filtro de m�dia aritm�tica janela x3
figure('name','filtro x3'),imshow(image_f3)

h7 = fspecial('average',7);
image_f7 = imfilter(image,h7);  % filtro de m�dia aritm�tica janela x7
figure('name','filtro x7'),imshow(image_f7)

h9 = fspecial('average',9);
image_f9 = imfilter(image,h9);  % filtro de m�dia aritm�tica janela x9
figure('name','filtro x9'),imshow(image_f9)

image_geo = imgmean(image,5);   % filtro de m�dia geometrica
figure('name','filtro geom�trico'),imshow(image_geo)

image_har = imhmean(image,5);   % filtro de m�dia harm�nica
figure('name','filtro harm�nico'),imshow(image_har)

image_char = imchmean(image,5,1);  % filtro de m�dia contra-harm�nica
figure('name','filtro contra-harm�nico'),imshow(image_char)

image_char2 = imchmean(image,5,-1);  % filtro de m�dia contra-harm�nica
figure('name','filtro contra-harm�nico2'),imshow(image_char2)

image_median = immedian(image,11);  % filtro de m�dia mediana
figure('name','filtro mediana'),imshow(image_median)

image_max = imMaxFilter(image,5);  % filtro de m�ximo
figure('name','filtro m�ximo'),imshow(image_max)

image_min = imMinFilter(image,5);   % filtro de minimo
figure('name','filtro minimo'),imshow(image_min)

image_mid = imMidPointFilter(image,5);   % filtro de ponto-m�dio
figure('name','filtro  ponto-medio'),imshow(image_mid)