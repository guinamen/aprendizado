# Algoritmos escolhidos
Como o objetivo do trabalho é caracterizar o espaço urbano, demos preferência aos algroritmos de representação compacta. 

## Base 1
Para analizar esta base o algoritmo Opus-Miner foi utilizado para obter as representaçõe de alto valor estatístico de cada regional.

## OPUS Miner
Opus-Miner é um algoritmo de mineração de conjuntos de itens frequentes estatisticamente significativos, que são chamados de conjuntos de itens autossuficientes.
Esse algoritmo é interessante porque não apenas descobre conjuntos de itens frequentes, mas visa garantir que os padrões encontrados também sejam estatisticamente significativos (não ocorram com frequência por acaso).
Webb et al., argumentam que esse conjunto de itens poderia ser mais interessante do que conjuntos de itens frequentes. Para análise o algoritmo foi configurado para 10 regras de associação, com os parâmetros check independency (filter), search by lift, check redundancy e correction for multicompare como verdadeiros.

### Barreiro

Itemset | Suporte| Lift | p
--|--|--|--|
SALA P5, VAGA DE GARAGEM NAO RESIDENCIAL P4|2.0|1434.5001|2.4306380959627753E-7
APARTAMENTO COM OCUPACAO NAO RESIDENCIAL P2, LOJA P5 OUTLIER|2.0|1434.5001|2.4306380959627753E-7
SALA P4, VAGA DE GARAGEM NAO RESIDENCIAL P4|2.0|478.1667|3.6459571439486853E-6
LOJA P5, LOJA P5 OUTLIER|2.0|478.1667|3.6459571439486853E-6
SALA P4, SALA P5|2.0|478.1667|3.6459571439486853E-6
APARTAMENTO COM OCUPACAO NAO RESIDENCIAL P2, LOJA P5|2.0|478.1667|3.6459571439486853E-6
SALA P4, SALA P4 OUTLIER|4.0|159.3889|2.6239252547118786E-9
SALA P3, VAGA DE GARAGEM NAO RESIDENCIAL P2|3.0|153.69643|3.6925236411297514E-7
SALA P3, VAGA DE GARAGEM NAO RESIDENCIAL P3|6.0|122.957146|8.106411050194711E-13
BARRACAO COM OCUPACAO NAO RESIDENCIAL P3 OUTLIER, SALA P3 |4.0|102.46429|2.459636738899683E-8

### Centro-Sul

Itemset | Suporte| Lift | p
--|--|--|--|
APARTAMENTO COM OCUPACAO NAO RESIDENCIAL P4, APARTAMENTO COM OCUPACAO NAO RESIDENCIAL P4 OUTLIER|	4.0|89.20833|3.098944746329544E-8
APARTAMENTO COM OCUPACAO NAO RESIDENCIAL P3, APARTAMENTO COM OCUPACAO NAO RESIDENCIAL P3 OUTLIER|4.0|53.525|3.792411872369537E-7
GALPAO P2 OUTLIER, GALPAO P3 OUTLIER|15.0|23.021503|1.262815719946167E-18
APARTAMENTO COM OCUPACAO NAO RESIDENCIAL P2 OUTLIER, VAGA DE GARAGEM NAO RESIDENCIAL P2 OUTLIER|6.0|22.536842|5.2811275528104986E-8
GALPAO P3 OUTLIER, GALPAO P4 OUTLIER|5.0|19.184587|3.4168913159038297E-6
SALA P5, VAGA DE GARAGEM NAO RESIDENCIAL P5 OUTLIER|55.0|16.688633|1.999766696838514E-68
APARTAMENTO COM OCUPACAO NAO RESIDENCIAL P3, LOJA P1 OUTLIER|6.0|16.554125|1.933515515031099E-7
SALA P5, VAGA DE GARAGEM NAO RESIDENCIAL P5|82.0|15.675177|6.552764012423399E-104
VAGA DE GARAGEM RESIDENCIAL P2, VAGA DE GARAGEM RESIDENCIAL P2 OUTLIER|7.0|15.418725|1.1229066223243914E-7
VAGA DE GARAGEM NAO RESIDENCIAL P2 OUTLIER, VAGA DE GARAGEM RESIDENCIAL P2 OUTLIER|7.0|14.607212|1.6533838842622184E-7

### Leste
Itemset | Suporte| Lift | p
--|--|--|--|


### Nordeste
Itemset | Suporte| Lift | p
--|--|--|--|

### Noroeste
Itemset | Suporte| Lift | p
--|--|--|--|

### Norte
Itemset | Suporte| Lift | p
--|--|--|--|

### Oeste
Itemset | Suporte| Lift | p
--|--|--|--|

### Pampulha
Itemset | Suporte| Lift | p
--|--|--|--|

### Venda Nova
Itemset | Suporte| Lift | p
--|--|--|--|
