# Image Padding - Processamento Digital de Imagens (UFAM)

Este repositório contém a implementação da função `imagePad4e`, desenvolvida como parte da disciplina de **Processamento Digital de Imagens** no Centro de Tecnologia Eletrônica e da Computação (**CETELI**) da Universidade Federal do Amazonas (**UFAM**).

## 📋 Descrição do Projeto

O objetivo deste projeto é desenvolver uma função em MATLAB capaz de realizar o preenchimento (padding) de bordas em imagens digitais. O preenchimento é uma etapa essencial em operações de filtragem espacial para evitar artefatos nas bordas da imagem.

A função suporta dois tipos de preenchimento:

1. **Zero Padding**: Adiciona linhas e colunas com valor zero (preto) ao redor da imagem.
2. **Replicate Padding**: Replica os valores dos pixels das extremidades da imagem para as novas bordas.

## 🛠️ Requisitos de Entrega

De acordo com as especificações do projeto:

* **Script Principal**: Script que chama e executa a função.
* **Função .m**: Arquivo contendo a lógica da função devidamente comentada.
* **Resultados Visuais**: Exemplos de imagens demonstrando os dois tipos de preenchimento.
*  **Relatório**: Documentação técnica dos experimentos.


## 📂 Estrutura do Código

A função principal foi definida com a seguinte assinatura:

```matlab
g = imagePad4e(f, r, c, padtype)
```
`f`: Imagem de entrada.

`r`: Número de linhas acima e abaixo.

`c`: Número de colunas à esquerda e à direita.

`padtype`: Tipo de preenchimento ('zeros' ou 'replicate').
