# Equalização de Histograma - Processamento Digital de Imagens

Este projeto consiste na implementação de funções para cálculo de histograma e equalização de histograma em imagens de tons de cinza (8 bits) utilizando o **MATLAB**. O trabalho foi desenvolvido como parte da disciplina de **Processamento Digital de Imagens** na **Universidade Federal do Amazonas (UFAM)**.

## 📋 Descrição do Projeto

O objetivo é manipular imagens digitais para melhorar sua aparência visual através da distribuição uniforme das intensidades de pixels. O projeto está dividido em duas funções principais:

1. **`imageHist4e(f, mode)`**: Calcula o histograma de uma imagem. Pode retornar o histograma normalizado (padrão) ou não normalizado.
2. **`histEqual4e(f)`**: Realiza a equalização de histograma para expandir o contraste da imagem de entrada.

## 📂 Estrutura de Arquivos

`imageHist4e.m`: Função que computa o histograma.
 
`histEqual4e.m`: Função que realiza a equalização.
 
`main.m`: Script principal que carrega as imagens, executa as funções e exibe os resultados.
 
`/images`: Pasta contendo as imagens de teste (`rose1024.tif`, `spillway-dark.tif`, `hidden-horse.tif`).


## 📊 Resultados Esperados

Ao rodar o script, o programa gerará figuras comparativas contendo:

* A imagem original e seu respectivo histograma.
* A imagem processada (equalizada) e seu novo histograma, demonstrando a melhoria no contraste e a distribuição das intensidades.
