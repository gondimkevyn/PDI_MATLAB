function h = imageHist4e(f, mode)
    % imageHist4e: Computa o histograma de uma imagem de 256 níveis 
    % f: imagem de entrada (intensidades não negativas) 
    % mode: 'n' para normalizado (default), 'u' para não normalizado 

    if nargin < 2
        mode = 'n'; % Define o padrão como normalizado [cite: 10]
    end

    [M, N] = size(f);
    h = zeros(256, 1);

    % Itera para contar cada nível de intensidade
    for i = 1:M
        for j = 1:N
            intensidade = f(i, j) + 1; % MATLAB indexa de 1 a 256
            h(intensidade) = h(intensidade) + 1;
        end
    end

    % Normalização (default) [cite: 10]
    if mode == 'n'
        h = h / (M * N);
    end
end

function g = histEqual4e(f)
% histEqual4e: Realiza a equalização de histograma em imagem 8-bit 

[M, N] = size(f);

% Obtém o histograma normalizado 
pr = imageHist4e(f, 'n');

% Calcula a Função de Distribuição Acumulada (CDF)
sk = cumsum(pr);

% Mapeia os níveis (L-1) * sk e arredonda
mapa = round(255 * sk);

% Aplica a transformação
g = uint8(zeros(M, N));
for i = 1:M
    for j = 1:N
        g(i, j) = mapa(f(i, j) + 1);
    end
end
end

% Script principal para o projeto de PDI 
clear; clc; close all;

% Imagens de teste solicitadas 
imagens = {'rose1024.tif', 'spillway-dark.tif', 'hidden-horse.tif'};

for k = 1:length(imagens)
    nome = imagens{k};

    if isfile(nome)
        f = imread(nome);
        if size(f, 3) > 1, f = rgb2gray(f); end

        % Executa as funções do projeto
        g = histEqual4e(f);
        h_orig = imageHist4e(f, 'n');
        h_equal = imageHist4e(g, 'n');

        % Plotagem dos resultados [cite: 32]
        figure('Name', ['Resultado: ' nome]);
        subplot(2,2,1); imshow(f); title('Original');
        subplot(2,2,2); bar(0:255, h_orig); title('Histograma Original');
        subplot(2,2,3); imshow(g); title('Equalizada');
        subplot(2,2,4); bar(0:255, h_equal); title('Histograma Equalizado');
    else
        fprintf('Aviso: Arquivo %s não encontrado na pasta atual.\n', nome);
    end
end
