function g = imagePad4e(f, r, c, padtype)
% imagePad4e realiza o preenchimento de bordas em uma imagem.
% f: imagem de entrada
% r: número de linhas para adicionar acima e abaixo 
% c: número de colunas para adicionar à esquerda e à direita 
% padtype: 'zeros' (padrão) ou 'replicate' 

% Define 'zeros' como padrão se padtype for omitido
if nargin < 4 || isempty(padtype)
    padtype = 'zeros';
end

[M, N] = size(f);
% Calcula as novas dimensões
newM = M + 2*r;
newN = N + 2*c;

if strcmpi(padtype, 'zeros')
    % Implementação de Zero Padding 
    g = zeros(newM, newN, class(f));
    g(r+1:r+M, c+1:c+N) = f;

elseif strcmpi(padtype, 'replicate')
    % Implementação de Replicate Padding 
    g = zeros(newM, newN, class(f));

    % Coloca a imagem original no centro
    g(r+1:r+M, c+1:c+N) = f;

    % Replica as linhas (Topo e Baixo)
    g(1:r, c+1:c+N) = repmat(f(1, :), r, 1);
    g(r+M+1:end, c+1:c+N) = repmat(f(end, :), r, 1);

    % Replica as colunas (Esquerda e Direita)
    g(:, 1:c) = repmat(g(:, c+1), 1, c);
    g(:, c+N+1:end) = repmat(g(:, c+N), 1, c);
else
    error('Tipo de padding não suportado. Use ''zeros'' ou ''replicate''.');
end
end

% Script principal para execução do Projeto #4 
clear; clc; close all;

% 1. Carregar imagem de teste 
f = imread('cameraman.tif');

% 2. Parâmetros de padding
r = 40; 
c = 40;

% 3. Executar a função para os dois tipos 
g_zeros = imagePad4e(f, r, c, 'zeros');
g_replicate = imagePad4e(f, r, c, 'replicate');

% 4. Exibição dos Resultados para o Relatório 
figure;
subplot(1,3,1); imshow(f); title('Original');
subplot(1,3,2); imshow(g_zeros); title('Zero Padding');
subplot(1,3,3); imshow(g_replicate); title('Replicate Padding');


imwrite(g_zeros, 'resultado_zeros.png');
imwrite(g_replicate, 'resultado_replicate.png');