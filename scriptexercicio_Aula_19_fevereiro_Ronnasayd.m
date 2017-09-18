ruidos = {'gaussian','localvar','poisson','salt & pepper','speckle'};
for i = 1: length(ruidos)
    im  = imread('lena.bmp');
    figure('name', 'Imagem Original'),imshow(im);
    if strcmp(ruidos{i},'localvar')
        im_ruido = imnoise(im,ruidos{i},0.01*ones(size(im)));  % aplicação do ruído 
    else
        im_ruido = imnoise(im,ruidos{i});  % aplicação do ruído 
    end
    figure('name','Imagem com Ruído'),imshow(im_ruido)
    h1 = fspecial('gaussian',3); % filtro gaussiano 
    h2 = fspecial('average',3);   % filtro da media  aritmetica
    im_restaurada_gauss = imfilter(im_ruido,h1);
    figure('name','Imagem Restaurada Filtro Gaussiano'),imshow(im_restaurada_gauss)
    im_restaurada_average = imfilter(im_ruido,h2);
    figure('name','Imagem Restaurada Filtro Média Aritmetica'),imshow(im_restaurada_average)
    im_restaurada_gmean = imgmean(im_ruido,3);  % Filtro de média geometrica
    figure('name','Imagem Restaurada Filtro Média Geometrica'),imshow(im_restaurada_gmean)
    im_restaurada_hmean = imhmean(im_ruido,3);  % Filtro de média harmônica
    figure('name','Imagem Restaurada Filtro Média Harmônica'),imshow(im_restaurada_hmean)
    im_restaurada_median = immedian(im_ruido,3);  % Filtro de mediana
    figure('name','Imagem Restaurada Filtro de Mediana'),imshow(im_restaurada_median)
    im_restaurada_max = imMaxFilter(im_ruido,3);  % Filtro de maximo
    figure('name','Imagem Restaurada Filtro de Máximo'),imshow(im_restaurada_max)
    im_restaurada_min = imMinFilter(im_ruido,3);  % Filtro de minimo
    figure('name','Imagem Restaurada Filtro de Minimo'),imshow(im_restaurada_min)
    im_restaurada_mid = imMidPointFilter(im_ruido,3);  % Filtro de ponto médio
    figure('name','Imagem Restaurada Filtro de Ponto Médio'),imshow(im_restaurada_mid)
    im_restaurada_fft_ideal = imfftFilter(im_ruido,imfftIdeal(size(im_ruido),0,110));  % Filtro passa baixa ideal em Fourier
    figure('name','Imagem Restaurada Filtro Passa Baixa Ideal'),imshow(im_restaurada_fft_ideal)
    im_restaurada_fft_butter = imfftFilter(im_ruido,1 - imfftButterworth(size(im_ruido),50,1)); % Filtro Butterworth em Fourier
    figure('name','Imagem Restaurada Filtro Butterworth'),imshow(im_restaurada_fft_butter)
    im_restaurada_fft_gauss = imfftFilter(im_ruido, 1 - imfftGaussian(size(im_ruido),50));  % Filtro Gaussiano em Fourier
    figure('name','Imagem Restaurada Filtro Gaussiano Fourier'),imshow(im_restaurada_fft_gauss)
    
    pause
end

% Para o ruído Gaussiano os filtros que demostraram melhor performace foram
% os filtros gaussianos tanto no dominio espacial como no da frequência e o
% filtro de média aritmetica. Percebe-se que não se pode eliminar o ruído
% completamente apenas suaviza-lo. O filtro de média tem uma perda de
% nitidez em relação aos gaussianos, no entanto os gaussianos apresentam um
% aspecto mais ruidoso.


% O ruído de variancia local, por ser um tipo de ruido gaussiano particular
% com media zero, apresenta resultados semelhantes ao demostrado para o
% ruido gaussiano, tendo portanto também o filtro de media e gaussiano com
% melhores performaces.

% Para Poisson que apresenta um ruído de certa forma mais suave do que os
% vistos anteriormente, além do filtro de média aritmética e gaussiano,
% também podemos destacar os filtro de Mediana e o filtro Butterworth, que
% apresentaram boa performace. Deve-se salientar que o filtro de mediana
% possui menos ruídos que o gaussiano e butterworth e apresenta uma nitidez
% melhor que o de média aritmética.

% Para o ruído tipo sal e pimenta o filtro de mediana é indiscutivelmente
% melhor que os demais, apresenta  uma eliminação quase que total do ruído
% e preserva a nitidez da imagem.

% Para o ruído speckle o filtro gaussiano apresentou melhor performace.
