function g = twodSFilter(f, w)
% twodSFilter: Realiza filtragem espacial 2D 
% f: imagem de entrada
% w: kernel de filtragem

% Converte para double e normaliza para o intervalo [0, 1] 
f = im2double(f);

% Aplica a filtragem com preenchimento por replicação (replicate padding) 
% imfilter com 'corr' realiza a correlação, que é o padrão para filtros espaciais
g = imfilter(f, w, 'replicate', 'corr');
end

function g = medianSFilter(f, w_size)
% medianSFilter: Realiza filtragem de mediana 2D 
% f: imagem de entrada
% w_size: tamanho da vizinhança (ex: 3 para uma janela 3x3)

% Garante que a entrada seja tratada corretamente
if ~isa(f, 'double')
    f = im2double(f);
end

% Define o preenchimento por replicação antes de aplicar a mediana 
% medfilt2 aceita o preenchimento como parâmetro
g = medfilt2(f, [w_size w_size], 'symmetric'); 
% Nota: 'symmetric' no medfilt2 equivale ao comportamento de replicação de borda.
end

%% Script Principal - Projeto #6 
clear; clc; close all;

% 1. Carregar a imagem Fig3.37(a).jpg 
% Certifique-se de que o arquivo está na mesma pasta do script
try
    f = imread('Fig3.37(a).jpg');
catch
    error('Arquivo Fig3.37(a).jpg não encontrado.');
end

%% II. Teste de Filtro Passa-Baixa (Média) 
sizes = [3, 11, 21];
figure('Name', 'Filtragem Espacial Linear (Averaging)');

subplot(2, 2, 1); imshow(f); title('Original');

for i = 1:length(sizes)
    n = sizes(i);
    % Cria o kernel de média (low-pass)
    w = ones(n, n) / (n * n);

    % Aplica a função desenvolvida 
    g_linear = twodSFilter(f, w);

    subplot(2, 2, i+1);
    imshow(g_linear);
    title(['Média ', num2str(n), 'x', num2str(n)]);
end

%% IV. Teste de Filtro de Mediana 
% Aplicando mediana com w = 3x3 conforme solicitado
g_median = medianSFilter(f, 3);

figure('Name', 'Filtragem de Mediana');
subplot(1, 2, 1); imshow(f); title('Original');
subplot(1, 2, 2); imshow(g_median); title('Mediana 3x3');

% Salvar resultados para o relatório 
imwrite(g_median, 'resultado_mediana_3x3.png');