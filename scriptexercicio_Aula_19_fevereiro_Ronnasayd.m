ruidos = {'gaussian','localvar','poisson','salt & pepper','speckle'};
for i = 1: length(ruidos)
    im  = imread('lena.bmp');
    figure('name', 'Imagem Original'),imshow(im);
    if strcmp(ruidos{i},'localvar')
        im_ruido = imnoise(im,ruidos{i},0.01*ones(size(im)));  % aplica��o do ru�do 
    else
        im_ruido = imnoise(im,ruidos{i});  % aplica��o do ru�do 
    end
    figure('name','Imagem com Ru�do'),imshow(im_ruido)
    h1 = fspecial('gaussian',3); % filtro gaussiano 
    h2 = fspecial('average',3);   % filtro da media  aritmetica
    im_restaurada_gauss = imfilter(im_ruido,h1);
    figure('name','Imagem Restaurada Filtro Gaussiano'),imshow(im_restaurada_gauss)
    im_restaurada_average = imfilter(im_ruido,h2);
    figure('name','Imagem Restaurada Filtro M�dia Aritmetica'),imshow(im_restaurada_average)
    im_restaurada_gmean = imgmean(im_ruido,3);  % Filtro de m�dia geometrica
    figure('name','Imagem Restaurada Filtro M�dia Geometrica'),imshow(im_restaurada_gmean)
    im_restaurada_hmean = imhmean(im_ruido,3);  % Filtro de m�dia harm�nica
    figure('name','Imagem Restaurada Filtro M�dia Harm�nica'),imshow(im_restaurada_hmean)
    im_restaurada_median = immedian(im_ruido,3);  % Filtro de mediana
    figure('name','Imagem Restaurada Filtro de Mediana'),imshow(im_restaurada_median)
    im_restaurada_max = imMaxFilter(im_ruido,3);  % Filtro de maximo
    figure('name','Imagem Restaurada Filtro de M�ximo'),imshow(im_restaurada_max)
    im_restaurada_min = imMinFilter(im_ruido,3);  % Filtro de minimo
    figure('name','Imagem Restaurada Filtro de Minimo'),imshow(im_restaurada_min)
    im_restaurada_mid = imMidPointFilter(im_ruido,3);  % Filtro de ponto m�dio
    figure('name','Imagem Restaurada Filtro de Ponto M�dio'),imshow(im_restaurada_mid)
    im_restaurada_fft_ideal = imfftFilter(im_ruido,imfftIdeal(size(im_ruido),0,110));  % Filtro passa baixa ideal em Fourier
    figure('name','Imagem Restaurada Filtro Passa Baixa Ideal'),imshow(im_restaurada_fft_ideal)
    im_restaurada_fft_butter = imfftFilter(im_ruido,1 - imfftButterworth(size(im_ruido),50,1)); % Filtro Butterworth em Fourier
    figure('name','Imagem Restaurada Filtro Butterworth'),imshow(im_restaurada_fft_butter)
    im_restaurada_fft_gauss = imfftFilter(im_ruido, 1 - imfftGaussian(size(im_ruido),50));  % Filtro Gaussiano em Fourier
    figure('name','Imagem Restaurada Filtro Gaussiano Fourier'),imshow(im_restaurada_fft_gauss)
    
    pause
end

% Para o ru�do Gaussiano os filtros que demostraram melhor performace foram
% os filtros gaussianos tanto no dominio espacial como no da frequ�ncia e o
% filtro de m�dia aritmetica. Percebe-se que n�o se pode eliminar o ru�do
% completamente apenas suaviza-lo. O filtro de m�dia tem uma perda de
% nitidez em rela��o aos gaussianos, no entanto os gaussianos apresentam um
% aspecto mais ruidoso.


% O ru�do de variancia local, por ser um tipo de ruido gaussiano particular
% com media zero, apresenta resultados semelhantes ao demostrado para o
% ruido gaussiano, tendo portanto tamb�m o filtro de media e gaussiano com
% melhores performaces.

% Para Poisson que apresenta um ru�do de certa forma mais suave do que os
% vistos anteriormente, al�m do filtro de m�dia aritm�tica e gaussiano,
% tamb�m podemos destacar os filtro de Mediana e o filtro Butterworth, que
% apresentaram boa performace. Deve-se salientar que o filtro de mediana
% possui menos ru�dos que o gaussiano e butterworth e apresenta uma nitidez
% melhor que o de m�dia aritm�tica.

% Para o ru�do tipo sal e pimenta o filtro de mediana � indiscutivelmente
% melhor que os demais, apresenta  uma elimina��o quase que total do ru�do
% e preserva a nitidez da imagem.

% Para o ru�do speckle o filtro gaussiano apresentou melhor performace.
