## 🚀 Processamento Digital de Imagens: Filtragem Espacial e de Mediana

Este projeto faz parte das atividades da disciplina de **Processamento Digital de Imagens** na **Universidade Federal do Amazonas (UFAM)**. O objetivo principal é a implementação manual de algoritmos de filtragem espacial para manipulação de transições de intensidade e redução de ruído.

### 📋 Visão Geral

O projeto consiste no desenvolvimento de funções customizadas em **MATLAB** para realizar filtragem 2D, aplicando conceitos de convolução/correlação e estatística de ordem (mediana).

### 🛠️ Funcionalidades Implementadas

* **`twodSFilter(f, w)`**: Função para filtragem espacial linear.
* Utiliza **replicate padding** por padrão para tratar as bordas da imagem.
* Realiza a normalização automática dos dados para o intervalo $[0, 1]$.
* **`medianSFilter(f, w)`**: Função para filtragem de mediana.
* Focada na preservação de bordas enquanto remove ruído impulsivo.
* Implementada com preenchimento por replicação.

### 🧪 Testes e Resultados

Foram realizados testes utilizando a imagem padrão `Fig3.37(a).jpg` e a `testpattern1024.tif`, aplicando diferentes configurações de kernels:
* **Filtro Passa-Baixa (Média):** Testado com máscaras de tamanhos $3\times3$, $11\times11$ e $21\times21$ para suavização de transições bruscas.
* **Filtro de Mediana:** Testado com vizinhança $3\times3$ para avaliar a eficácia na redução de ruído sem degradar severamente a nitidez.

