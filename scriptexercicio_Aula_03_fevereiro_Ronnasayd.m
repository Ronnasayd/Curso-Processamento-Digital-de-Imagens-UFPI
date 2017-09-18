% %%% T_1
% f = imread('mammogram.bmp');
% imfinfo mammogram.bmp
% imshow(f)
% figure
% imhist(f)

% %%% E_1 / E_2
% h = imhist(f);
% figure
% bar(h,10);
% title('histograma-bar')
% xlabel('valores-pixels')
% ylabel('ocorrência')
% text(100,1600,'Visualização do histograma no formato bar')
% axis([0 280 0 2000])
% figure
% stem(h)
% title('histograma-stem')
% xlabel('valores-pixels')
% ylabel('ocorrência')
% text(100,1600,'Visualização do histograma no formato stem')
% axis([0 280 0 2000])
% figure
% plot(h)
% title('histograma-plot')
% xlabel('valores-pixels')
% ylabel('ocorrência')
% text(100,1600,'Visualização do histograma no formato plot')
% axis([0 280 0 2000])

% %%% E_3
% g1 = imadjust(f, [0 1], [1 0]);
% figure
% imshow(g1)
% g2 = imadjust(f, [0.5 0.75], [0 1]);
% figure
% imshow(g2)
% g3 = imadjust(f, [ ], [ ], 2);
% figure
% imshow(g3)

% %%% T_2 / E_4
% g = imread('polem.bmp');
% figure, imshow(g)
% figure, imhist(g)
% ylim('auto') %% ajusta os limites do eixo Y de forma automatica
% 
% % Equalizar o histograma significa obter a máxima variancia do histograma de uma imagem,
% % obtendo assim uma imagem com o melhor contraste. 
% % O contraste é uma medida qualitativa e que está relacionada com a distribuição dos tons de cinza em uma imagem.
% geq = histeq(g,256); 
% figure, imshow(geq)
% figure, imhist(geq)
% ylim('auto')
% 
% % caso faça-se uma nova equalização de histograma em uma imagem no qual já
% % foi feito essa operação anteriormente, não se nota qualquer modificação
% % entre as imagens.
% geq2 = histeq(geq,256);
% figure, imshow(geq2)
% figure, imhist(geq2)
% ylim('auto')

% %%% E_5
% g = imread('polem.bmp'); % obtem a imagem do disco rígido
% figure, imshow(g)  % mostra a imagem
% figure,imhist(g)   % mostra o histograma
% ylim('auto')       % ajusta o eixo y de forma automatica
% hnorm = imhist(g)./numel(g);  % divisão do numero de ocorrências de cada valor pelo numero de elementos 
% cdf = cumsum(hnorm);  % calcula a soma cumulativa
% x = linspace(0, 1, 256); % cria um vetor de 0 a 256 com intervalo de 1
% figure,plot(x,cdf) % mostra A Função de Transformação da Equalização de Histograma
% axis([0 1 0 1])    % ajust os valores máximos e minimos dos eixos
% set(gca, 'xtick', 0:.2:1) % ajusta o intervalo do eixo X
% set(gca, 'ytick', 0:.2:1) % ajusta o intervalo do eixo Y
% xlabel('Valores de Intensidade de Entrada', 'fontsize', 9) % etiqueta para o eixo X
% ylabel('Valores de Intensidade de Saída', 'fontsize', 9) % etiqueta para o eixo Y
% text(0.18, 0.5, 'Função de Transfomação', 'fontsize', 9) % texto explicativo

% %%% T_3 / E_6
% g1 = imread('Image2.bmp')
% g2 = imread('Image3.bmp')
% g3 = imabsdiff(g2,g1);  % computa a diferença absoluta entre 2 imagens. Usa se por so ser possivel utilizar valores positivos para representar uma imagem
% g4 = imcomplement(g3);  % computa o complemento da imagem (Máx - valor: para cada pixel)
% figure('Name', 'Imagem Original'),imshow(g1)
% figure('Name', 'Histograma da Imagem Original'), imhist(g1)
% figure('Name','Imagem do Fundo'), imshow(g2)
% figure('Name','Histograma da Imagem do Fundo'), imhist(g2)
% figure('Name', 'Imagem Diferença'), imshow(g3)
% figure('Name', 'Histograma da Imagem Diferença'), imhist(g3)
% figure('Name','Imagem resultado da subtração complementada'), imshow(g4)
% figure('Name','Histograma da Imagem complementada'), imhist(g4)
% g31 = g2 - g1;
% g32 = g1 - g2;
% figure,imshow(g31) 
% figure,imshow(g32) %% A imagem fica totalmente preta devido aos valores
% negativos assumirem o valor 0 para uint8

% %%% E_7
% p = imread('polem.bmp');
% imshow(p)
% title('imagem original')
% figure,imhist(p)
% title('histograma imagem original')
% pc1 = imadd(p,128);
% figure,imshow(pc1)
% title('imagem clareada 128')
% figure,imhist(pc1)
% title('histograma imagem clareada 128')
% pc2 = imadd(p,200);
% figure,imshow(pc2)
% title('imagem clareada 200')
% figure,imhist(pc2)
% title('histograma imagem clareada 200')
% pe = histeq(p,256);
% imshow(pe)
% title('imagem original equalizada')
% figure,imhist(pe)
% title('histograma imagem original equalizada')
% pc1e = histeq(pc1,256);
% figure,imshow(pc1e)
% title('imagem clareada 128 equalizada')
% figure,imhist(pc1e)
% title('histograma imagem clareada 128 equalizada')
% pc2e = histeq(pc2,256);
% figure,imshow(pc2e)
% title('imagem clareada 200 equalizada')
% figure,imhist(pc2e)
% title('histograma imagem clareada 200 equalizada')
% % para a imagem com adição de 128 niveis de cinza a equalização de
% % histograma se mostrou similar a da imagem original, já para a imagem com
% % adição de 200 niveis de cinza a equaização de histograma mostrou-se
% % bastante diferente.

% %%% E_8
% f = imread('ferramentas.bmp');
% imshow(f)
% title('ferramentas')
% for i = 2:6
%     fb = im2bw(f,i/10);
%     figure,imshow(fb)
%     title(sprintf('ferramentas %.2f%%',i*10))
%     figure,imhist(fb)
%     title(sprintf('histograma ferramentas %.2f%%',i*10))
% end
% p = imread('polem.bmp')
% imshow(p)
% title('polem')
% level = graythresh(p);
% pb = im2bw(p,level);
% figure,imshow(pb)
% title(sprintf('polem binarizada - %f%%',level*100))
% figure,imhist(pb)
% title('histograma polem binarizada')
% % graythresh usa o método de Otsu, que escolhe o limite para minimizar a variância intra-classe do limiar entre pixels pretos e brancos.

% %%% E_9
% lr = imread('Lena_ruido.bmp');
% imshow(lr)
% title('lena ruido')
% a = [5 7 9 25 31];
% for i = a
%     H = fspecial('average',[i i]);
%     lf = imfilter(lr,H);
%     figure,imshow(lf)
%     title(sprintf('lena media - vizinhaça:%d',i))
% end
% lfm = medfilt2(lr, [5 5]);
% figure,imshow(lfm)
% title('lena mediana - vizinhaça:5')
% lfm = medfilt2(lr, [7 7]);
% figure,imshow(lfm)
% title('lena mediana - vizinhaça:7')
% % Os filtros de mediana apresentam um melhor contraste que os filtros de
% % media, porem os dois reduzem os ruidos da imagem

% %%% T_4 / E_10
% f = imread('Moon.tif');
% w4 = fspecial('laplacian',0);
% w8 = [1 1 1; 1 -8 1; 1 1 1];
% f = im2double(f);
% g4 = f - imfilter(f, w4, 'replicate');
% g8 = f - imfilter(f, w8, 'replicate');
% imshow(f)
% figure, imshow(g4)
% figure, imshow(g8)
% % É necessário se converter a classe de imagem para double devido ao metodo imfilter ter como o tipo de dado de retorno double 
% % W4 é o filtro laplaciano o qual tem a finalidade de detecção de bordas
% % W8 é filtragem passa-alta que elimina baixas frequências, portanto realça detalhes, produzindo uma "agudização" ("sharpering") da imagem,
% % isto é, as transições entre
% % regiões diferentes tornam-se mais nítidas. Estes filtros podem ser usados para realçar certas características presentes na imagem,
% % tais como bordas, linhas curvas ou manchas, mas enfatizam o ruído existente na imagem.
% 
% f = imread('ferramentas.bmp');
% lr = imread('Lena_ruido.bmp');
% m = imread('Moon.tif');
% t = imread('teste.bmp');
% 
% S1 = fspecial('sobel');
% S2 = S1';
% P1 = fspecial('prewitt');
% P2 = P1';
% vet = {f lr m t};
% for i = 1:4
%     f1 = imfilter(vet{i},S1);
%     figure,imshow(f1)
%     title('vertical sobel')
%     f2 = imfilter(vet{i},S2);
%     figure,imshow(f2)
%     title('Horizontal sobel')
%     f1 = im2double(f1);
%     f2 = im2double(f2);
%     f3 = sqrt(f1.^2 + f2.^2);
%     figure,imshow(f3)
%     title('global sobel')
%     
%      f1 = imfilter(vet{i},P1);
%     figure,imshow(f1)
%     title('vertical prewitt')
%     f2 = imfilter(vet{i},P2);
%     figure,imshow(f2)
%     title('Horizontal prewitt')
%     f1 = im2double(f1);
%     f2 = im2double(f2);
%     f3 = sqrt(f1.^2 + f2.^2);
%     figure,imshow(f3)
%     title('global prewitt')
%     pause
% end
% % O detector sobel parece apresentar um melhor contraste

% %%% T_5 / E_11
% k = imread('ferramentas.bmp');
% f = im2double(k);
% f1 = imnoise(f,'salt & pepper', 0.6);
% f2 = imnoise(f,'salt & pepper', 0.6);
% f3 = imnoise(f,'salt & pepper', 0.6);
% f4 = imnoise(f,'salt & pepper', 0.6);
% f5 = imnoise(f,'salt & pepper', 0.6);
% f6 = imnoise(f,'salt & pepper', 0.6);
% f7 = imnoise(f,'salt & pepper', 0.6);
% f8 = imnoise(f,'salt & pepper', 0.6);
% f9 = imnoise(f,'salt & pepper', 0.6);
% f10 = imnoise(f,'salt & pepper', 0.6);
% fm = (f1 + f2 + f3 + f4 + f5 + f6 + f7 + f8 + f9 + f10)/10;
% subplot(2,3,1);imshow(f)
% subplot(2,3,2);imshow(f1)
% subplot(2,3,3);imshow(f2)
% subplot(2,3,4);imshow(f3)
% subplot(2,3,5);imshow(f4)
% subplot(2,3,6);imshow(f5)
% figure
% subplot(2,3,1);imshow(f6)
% subplot(2,3,2);imshow(f7)
% subplot(2,3,3);imshow(f8)
% subplot(2,3,4);imshow(f9)
% subplot(2,3,5);imshow(f10)
% subplot(2,3,6);imshow(fm)
% 
% k = imread('ferramentas.bmp');
% f = im2double(k);
% f1 = imnoise(f,'salt & pepper', 0.1);
% f2 = imnoise(f,'salt & pepper', 0.2);
% f3 = imnoise(f,'salt & pepper', 0.3);
% f4 = imnoise(f,'salt & pepper', 0.4);
% f5 = imnoise(f,'salt & pepper', 0.5);
% f6 = imnoise(f,'salt & pepper', 0.6);
% f7 = imnoise(f,'salt & pepper', 0.7);
% f8 = imnoise(f,'salt & pepper', 0.8);
% f9 = imnoise(f,'salt & pepper', 0.9);
% f10 = imnoise(f,'salt & pepper', 1.0);
% fm = (f1 + f2 + f3 + f4 + f5 + f6 + f7 + f8 + f9 + f10)/10;
% figure
% subplot(2,3,1);imshow(f)
% subplot(2,3,2);imshow(f1)
% subplot(2,3,3);imshow(f2)
% subplot(2,3,4);imshow(f3)
% subplot(2,3,5);imshow(f4)
% subplot(2,3,6);imshow(f5)
% figure
% subplot(2,3,1);imshow(f6)
% subplot(2,3,2);imshow(f7)
% subplot(2,3,3);imshow(f8)
% subplot(2,3,4);imshow(f9)
% subplot(2,3,5);imshow(f10)
% subplot(2,3,6);imshow(fm)
% 
% % a media de multiplas comadas permite uma definição sobre o que se trata a
% % imagem apesar de também apresentar bastante ruídos.
% 
% k = imread('ferramentas.bmp');
% f = im2double(k);
% f1 = imnoise(f,'gaussian', 0.0);
% f2 = imnoise(f,'gaussian', 0.0);
% f3 = imnoise(f,'gaussian', 0.0);
% f4 = imnoise(f,'gaussian', 0.0);
% f5 = imnoise(f,'gaussian', 0.0);
% f6 = imnoise(f,'gaussian', 0.0);
% f7 = imnoise(f,'gaussian', 0.0);
% f8 = imnoise(f,'gaussian', 0.0);
% f9 = imnoise(f,'gaussian', 0.0);
% f10 = imnoise(f,'gaussian', 0.0);
% fm = (f1 + f2 + f3 + f4 + f5 + f6 + f7 + f8 + f9 + f10)/10;
% figure
% subplot(2,3,1);imshow(f)
% subplot(2,3,2);imshow(f1)
% subplot(2,3,3);imshow(f2)
% subplot(2,3,4);imshow(f3)
% subplot(2,3,5);imshow(f4)
% subplot(2,3,6);imshow(f5)
% figure
% subplot(2,3,1);imshow(f6)
% subplot(2,3,2);imshow(f7)
% subplot(2,3,3);imshow(f8)
% subplot(2,3,4);imshow(f9)
% subplot(2,3,5);imshow(f10)
% subplot(2,3,6);imshow(fm)
% 
% % para o ruído gaussiano a media se mostra muito mais nitida, tendo menos
% % ruído que as imagens que a compõem.