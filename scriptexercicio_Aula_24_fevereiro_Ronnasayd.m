% % T_1
% f = imread('Flor.bmp');
% fR = f(:, :, 1);
% fG = f(:, :, 2);
% fB = f(:, :, 3);
% subplot(2,3,1);imshow(f)
% subplot(2,3,2);imshow(fR)
% subplot(2,3,3);imshow(fG)
% subplot(2,3,4);imshow(fB)
% 
% % T_2
% g = cat(3, fR, fG, fB);
% subplot(2,3,1);imshow(fR)
% subplot(2,3,2);imshow(fG)
% subplot(2,3,3);imshow(fB)
% subplot(2,3,4);imshow(g)

% % T_3
% RGB = imread('peppers.png');
% [X,map] = rgb2ind(RGB,256);
% figure
% imshow(X,map)

% % E_1/E_2/T_4
% RGB = imread('peppers.png');
% [X,map] = rgb2ind(RGB,256);
% o = figure;imshow(X,map)
% [Y, newmap] = imapprox(X, map, 10);
% nm = figure,imshow(Y,newmap)
% k = 1:255;
% cmap = abs([cos(k)' sin(k)' (cos(k)' + sin(k)')/2]);
% cm = figure,imshow(X,cmap)
% whitebg(o,'g')
% whitebg(nm,'red')
% whitebg(cm,[0 0 0])


% para n maior que 256 nenhuma modifica��o e feita � imagem j� que o
% limite para o colormap � 256. No entanto, para valores menores que 256 percebe-se que a
% imagem passa a apresentar menos tonalidades e varia��es mais bruscas entre essas tonalidades
%  Sup�e-se que isso se deve a redu��o do espa�o de valores que cada pixel poderia ocupar.


% % T_5/E_4
% RGB = imread('peppers.png');
% [X,map] = rgb2ind(RGB,256);
% GR = ind2gray(X,map);
% RGB2 = ind2rgb(X,map);
% figure, imshow(GR)
% figure, imshow(RGB2)
% 
% [X1, map1]= rgb2ind(RGB, 16, 'nodither');
% [X2, map2]= rgb2ind(RGB, 16, 'dither');
% G1 = dither(GR);
% figure;imshow(RGB)
% figure;imshow(X1,map1)
% figure;imshow(X2,map2)
% figure;imshow(G1)

% A fun��o dither cria uma imagem RGB em que se intercalam p�xeis de duas 
% cores diferentes entre duas �reas adjacentes, a fim de ali se criar uma
% tonalidade variante dos tons dessas �reas adjacentes, assim fazendo um degrad� entre elas.

% % T_6
% RGB = imread('peppers.png');
% YIQ = rgb2ntsc(RGB);
% subplot(2,2,1);imshow(YIQ)
% subplot(2,2,2);imshow(YIQ(:,:,1))
% subplot(2,2,3);imshow(YIQ(:,:,2))
% subplot(2,2,4);imshow(YIQ(:,:,3))

% % E_5
% RGB = imread('peppers.png');
% YIQ = rgb2ycbcr(RGB);
% subplot(2,2,1);imshow(YIQ)
% subplot(2,2,2);imshow(YIQ(:,:,1))
% subplot(2,2,3);imshow(YIQ(:,:,2))
% subplot(2,2,4);imshow(YIQ(:,:,3))

% No espa�o de cor ycbcr ,y � a luminescencia, cb � a componente azul
% menos y e cr � a componente vermelha menos y.

% % E_6
% RGB = imread('peppers.png');
% YIQ = rgb2hsv(RGB);
% subplot(2,2,1);imshow(YIQ)
% subplot(2,2,2);imshow(YIQ(:,:,1))
% subplot(2,2,3);imshow(YIQ(:,:,2))
% subplot(2,2,4);imshow(YIQ(:,:,3))

% HSV � a abreviatura para o sistema de cores formadas pelas componentes
% hue (matiz), saturation (satura��o) e value (valor).
% Matiz (tonalidade): Verifica o tipo de cor, abrangendo todas as cores do
% espectro, desde o vermelho at� o violeta, mais o magenta. Atinge valores
% de 0 a 360, mas para algumas aplica��es, esse valor � normalizado de 0 a 100%.
% Satura��o: Tamb�m chamado de "pureza". Quanto menor esse valor, mais com
% tom de cinza aparecer� a imagem. Quanto maior o valor, mais "pura" � a imagem. Atinge valores de 0 a 100%
% Valor (brilho): Define o brilho da cor. Atinge valores de 0 a 100%

% % E_7
% RGB = imread('peppers.png');
% YIQ = imcomplement(RGB);
% subplot(2,2,1);imshow(YIQ)
% subplot(2,2,2);imshow(YIQ(:,:,1))
% subplot(2,2,3);imshow(YIQ(:,:,2))
% subplot(2,2,4);imshow(YIQ(:,:,3))

% CMY � a abreviatura do sistema de cores subtrativas formado por Ciano (Cyan), Magenta (Magenta)e Amarelo (Yellow)

% % E_9
% RGB = imread('peppers.png');
% w = fspecial('average',25);
% R = RGB(:,:,1);
% G = RGB(:,:,2);
% B = RGB(:,:,3);
% RGBf = imfilter(RGB,w);
% Rf = imfilter(R,w);
% Gf = imfilter(G,w);
% Bf = imfilter(B,w);
% RGBfs = cat(3,Rf,Gf,Bf);
% subplot(2,2,1);imshow(RGBf)
% subplot(2,2,2);imshow(RGBfs)

% resultados semelhantes para filtragem direta ou por canais.

% % E_11
% RGB = imread('peppers.png');
% w = fspecial('laplacian');
% R = RGB(:,:,1);
% G = RGB(:,:,2);
% B = RGB(:,:,3);
% Rf = imfilter(R,w);
% Gf = imfilter(G,w);
% Bf = imfilter(B,w);
% RGBfs = cat(3,Rf,Gf,Bf);
% imshow(RGBfs)
% realiza a detec��o de bordas.
