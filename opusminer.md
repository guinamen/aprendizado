# Algoritmos escolhidos
Como o objetivo do trabalho é caracterizar o espaço urbano, demos preferência aos algroritmos de representação compacta. 

## Base 1
Para analizar esta base o algoritmo Opus-Miner foi utilizado para obter as representaçõe de alto valor estatístico de cada regional.

## OPUS Miner
Opus-Miner é um algoritmo de mineração de conjuntos de itens frequentes estatisticamente significativos, que são chamados de conjuntos de itens autossuficientes.
Esse algoritmo é interessante porque não apenas descobre conjuntos de itens frequentes, mas visa garantir que os padrões encontrados também sejam estatisticamente significativos (não ocorram com frequência por acaso).
Webb et al., argumentam que esse conjunto de itens poderia ser mais interessante do que conjuntos de itens frequentes. Para análise o algoritmo foi configurado para 10 regras de associação, com os parâmetros check independency (filter), search by lift, check redundancy e correction for multicompare como verdadeiros. O valor de p foi omitido porque em todos o seu valor foi muito próximo de zero.

### Barreiro

|REGIONAL   |ITEMSET                                                                                          | SUPORTE|       LIFT|       P|
|:----------|:------------------------------------------------------------------------------------------------|-------:|----------:|-------:|
|Norte      |SALA P3, SALA P3 OUTLIER                                                                         |       4| 134.571410| 0.0e+00|
|Norte      |APARTAMENTO P4, APARTAMENTO P4 OUTLIER                                                           |      10|  67.932690| 0.0e+00|
|Norte      |GALPÃO P2 OUTLIER, GALPÃO P3 OUTLIER                                                             |       5|  26.761360| 4.0e-07|
|Norte      |SALA P3 OUTLIER, LOJA P3 OUTLIER                                                                 |       5|  15.770089| 3.2e-06|
|Norte      |LOJA P4, LOJA P4 OUTLIER                                                                         |       7|  14.545588| 1.0e-07|
|Norte      |SALA P2, LOJA P4                                                                                 |       6|  13.246877| 2.3e-06|
|Norte      |SALA P2 OUTLIER, APARTAMENTO P2 OUTLIER                                                          |       6|  11.974575| 3.1e-06|
|Norte      |SALA P2, APARTAMENTO P2 OUTLIER                                                                  |       7|  10.477755| 1.3e-06|
|Norte      |LOJA P3 OUTLIER, LOJA P4 OUTLIER                                                                 |       8|  10.389706| 2.0e-07|
|Norte      |APARTAMENTO P3 OUTLIER, APARTAMENTO P4 OUTLIER                                                   |      11|  10.047188| 0.0e+00|
|Barreiro   |VAGA DE GARAGEM NÃO RESIDENCIAL P3 OUTLIER, SALA P3                                              |       3| 131.057140| 6.0e-07|
|Barreiro   |SALA P2, SALA P4 OUTLIER                                                                         |       4|  78.410255| 0.0e+00|
|Barreiro   |SALA P3, SALA P3 OUTLIER                                                                         |       6|  65.528570| 0.0e+00|
|Barreiro   |SALA P2, SALA P2 OUTLIER                                                                         |       6|  58.807693| 0.0e+00|
|Barreiro   |SALA P3 OUTLIER, SALA P2 OUTLIER                                                                 |       6|  38.225000| 0.0e+00|
|Barreiro   |SALA P4 OUTLIER, LOJA P4 OUTLIER                                                                 |       4|  36.404762| 1.3e-06|
|Barreiro   |SALA P2, SALA P3 OUTLIER                                                                         |       6|  35.284615| 0.0e+00|
|Barreiro   |GALPÃO P3 OUTLIER, GALPÃO P4 OUTLIER                                                             |       4|  31.854168| 3.8e-06|
|Barreiro   |VAGA DE GARAGEM NÃO RESIDENCIAL P3 OUTLIER, APARTAMENTO P1 OUTLIER                               |       4|  29.834145| 2.2e-06|
|Barreiro   |SALA P2 OUTLIER, LOJA P4 OUTLIER                                                                 |       6|  27.303572| 0.0e+00|
|Leste      |VAGA DE GARAGEM NÃO RESIDENCIAL P4, VAGA DE GARAGEM NÃO RESIDENCIAL P4 OUTLIER                   |       3| 104.249990| 9.0e-07|
|Leste      |VAGA DE GARAGEM NÃO RESIDENCIAL P4, SALA P4                                                      |       5|  77.222210| 0.0e+00|
|Leste      |VAGA DE GARAGEM NÃO RESIDENCIAL P3, SALA P3                                                      |       4|  38.156864| 9.0e-07|
|Leste      |VAGA DE GARAGEM NÃO RESIDENCIAL P3 OUTLIER, SALA P3 OUTLIER                                      |       6|  32.433334| 0.0e+00|
|Leste      |VAGA DE GARAGEM RESIDENCIAL P4, APARTAMENTO P4 OUTLIER                                           |       9|  17.103514| 0.0e+00|
|Leste      |SALA P2, SALA P2 OUTLIER                                                                         |       7|  10.811110| 1.0e-06|
|Leste      |VAGA DE GARAGEM RESIDENCIAL P4, APARTAMENTO P4                                                   |      16|   8.687500| 0.0e+00|
|Leste      |APARTAMENTO P4, APARTAMENTO P4 OUTLIER                                                           |      29|   7.873046| 0.0e+00|
|Leste      |SALA P2 OUTLIER, LOJA P4                                                                         |      11|   5.887239| 2.0e-07|
|Leste      |SALA P3 OUTLIER, LOJA P4                                                                         |      11|   5.298515| 7.0e-07|
|Venda Nova |VAGA DE GARAGEM NÃO RESIDENCIAL P3 OUTLIER, SALA P3                                              |       4|  79.792210| 0.0e+00|
|Venda Nova |VAGA DE GARAGEM NÃO RESIDENCIAL P3 OUTLIER, SALA P3 OUTLIER                                      |       6|  77.445380| 0.0e+00|
|Venda Nova |SALA P3, SALA P3 OUTLIER                                                                         |       8|  65.711235| 0.0e+00|
|Venda Nova |SALA P3, GALPÃO P1 OUTLIER                                                                       |       4|  31.030304| 4.2e-06|
|Venda Nova |GALPÃO P2 OUTLIER, GALPÃO P4 OUTLIER                                                             |       5|  26.482760| 4.0e-07|
|Venda Nova |GALPÃO P2 OUTLIER, GALPÃO P3 OUTLIER                                                             |       6|  21.186205| 1.0e-07|
|Venda Nova |SALA P2, SALA P2 OUTLIER                                                                         |       6|  19.361345| 2.0e-07|
|Venda Nova |SALA P3 OUTLIER, LOJA P4                                                                         |      13|  18.644258| 0.0e+00|
|Venda Nova |VAGA DE GARAGEM RESIDENCIAL P3, APARTAMENTO P1 OUTLIER                                           |       7|  17.066666| 0.0e+00|
|Venda Nova |GALPÃO P4, GALPÃO P4 OUTLIER                                                                     |       6|  16.457144| 3.0e-07|
|Noroeste   |SALA P3, SALA P3 OUTLIER                                                                         |       8|  24.311690| 0.0e+00|
|Noroeste   |VAGA DE GARAGEM RESIDENCIAL P4, APARTAMENTO P4                                                   |      17|  14.778947| 0.0e+00|
|Noroeste   |APARTAMENTO P4, APARTAMENTO P4 OUTLIER                                                           |      25|  13.195488| 0.0e+00|
|Noroeste   |SALA P3 OUTLIER, LOJA P4 OUTLIER                                                                 |       7|  11.755980| 8.0e-07|
|Noroeste   |CASA P5, CASA P4 OUTLIER                                                                         |       8|   8.445113| 1.9e-06|
|Noroeste   |CASA COM OCUPAÇÃO NÃO RESIDENCIAL P4, APARTAMENTO P4                                             |       9|   7.824149| 3.0e-07|
|Noroeste   |SALA P3 OUTLIER, LOJA P1 OUTLIER                                                                 |      12|   7.508022| 0.0e+00|
|Noroeste   |GALPÃO P1 OUTLIER, LOJA P4 OUTLIER                                                               |      11|   7.007260| 1.0e-07|
|Noroeste   |SALA P3 OUTLIER, LOJA P4                                                                         |      14|   6.820264| 0.0e+00|
|Noroeste   |SALA P3, LOJA P4                                                                                 |      13|   6.634678| 0.0e+00|
|Nordeste   |APARTAMENTO COM OCUPAÇÃO NÃO RESIDENCIAL P3, APARTAMENTO COM OCUPAÇÃO NÃO RESIDENCIAL P3 OUTLIER |       3| 209.875000| 1.0e-07|
|Nordeste   |VAGA DE GARAGEM NÃO RESIDENCIAL P4, SALA P4                                                      |       3| 209.875000| 1.0e-07|
|Nordeste   |SALA P4, SALA P4 OUTLIER                                                                         |       6| 179.892850| 0.0e+00|
|Nordeste   |VAGA DE GARAGEM NÃO RESIDENCIAL P4 OUTLIER, SALA P4                                              |       3| 157.406250| 3.0e-07|
|Nordeste   |VAGA DE GARAGEM RESIDENCIAL P5, APARTAMENTO P5                                                   |       3| 129.153840| 4.0e-07|
|Nordeste   |VAGA DE GARAGEM NÃO RESIDENCIAL P3, SALA P3                                                      |       8|  70.694740| 0.0e+00|
|Nordeste   |APARTAMENTO COM OCUPAÇÃO NÃO RESIDENCIAL P3 OUTLIER, SALA P3                                     |       4|  58.912277| 2.0e-07|
|Nordeste   |VAGA DE GARAGEM NÃO RESIDENCIAL P3 OUTLIER, SALA P3 OUTLIER                                      |       6|  57.238640| 0.0e+00|
|Nordeste   |APARTAMENTO COM OCUPAÇÃO NÃO RESIDENCIAL P3 OUTLIER, SALA P3 OUTLIER                             |       4|  50.878788| 3.0e-07|
|Nordeste   |SALA P3, SALA P3 OUTLIER                                                                         |      12|  48.200962| 0.0e+00|
|Pampulha   |APARTAMENTO COM OCUPAÇÃO NÃO RESIDENCIAL P4, APARTAMENTO COM OCUPAÇÃO NÃO RESIDENCIAL P4 OUTLIER |       2| 811.000060| 8.0e-07|
|Pampulha   |VAGA DE GARAGEM NÃO RESIDENCIAL P4, VAGA DE GARAGEM NÃO RESIDENCIAL P4 OUTLIER                   |       3| 139.028560| 5.0e-07|
|Pampulha   |VAGA DE GARAGEM NÃO RESIDENCIAL P4, SALA P4                                                      |       6|  99.306114| 0.0e+00|
|Pampulha   |VAGA DE GARAGEM NÃO RESIDENCIAL P4, SALA P4 OUTLIER                                              |       6|  73.172935| 0.0e+00|
|Pampulha   |VAGA DE GARAGEM NÃO RESIDENCIAL P4 OUTLIER, SALA P4 OUTLIER                                      |       4|  68.294730| 1.0e-07|
|Pampulha   |APARTAMENTO P5, APARTAMENTO P5 OUTLIER                                                           |       4|  67.583330| 1.0e-07|
|Pampulha   |SALA P4, SALA P4 OUTLIER                                                                         |      10|  60.977448| 0.0e+00|
|Pampulha   |GALPÃO P3 OUTLIER, GALPÃO P4 OUTLIER                                                             |      10|  27.538202| 0.0e+00|
|Pampulha   |VAGA DE GARAGEM NÃO RESIDENCIAL P4, SALA P3                                                      |       5|  25.746030| 3.0e-07|
|Pampulha   |VAGA DE GARAGEM NÃO RESIDENCIAL P3, SALA P3 OUTLIER                                              |      14|  24.899124| 0.0e+00|
|Oeste      |APARTAMENTO COM OCUPAÇÃO NÃO RESIDENCIAL P4, APARTAMENTO COM OCUPAÇÃO NÃO RESIDENCIAL P4 OUTLIER |       2| 542.333300| 2.3e-06|
|Oeste      |VAGA DE GARAGEM NÃO RESIDENCIAL P5 OUTLIER, SALA P5                                              |       5|  82.171715| 0.0e+00|
|Oeste      |VAGA DE GARAGEM NÃO RESIDENCIAL P5, VAGA DE GARAGEM NÃO RESIDENCIAL P5 OUTLIER                   |       7|  79.643360| 0.0e+00|
|Oeste      |VAGA DE GARAGEM NÃO RESIDENCIAL P5, SALA P5                                                      |       5|  69.529915| 0.0e+00|
|Oeste      |SALA P5, SALA P5 OUTLIER                                                                         |       7|  63.272220| 0.0e+00|
|Oeste      |VAGA DE GARAGEM NÃO RESIDENCIAL P5, SALA P5 OUTLIER                                              |      10|  62.576927| 0.0e+00|
|Oeste      |VAGA DE GARAGEM RESIDENCIAL P5, APARTAMENTO P5 OUTLIER                                           |       7|  57.520203| 0.0e+00|
|Oeste      |VAGA DE GARAGEM NÃO RESIDENCIAL P5 OUTLIER, SALA P5 OUTLIER                                      |       7|  51.768180| 0.0e+00|
|Oeste      |VAGA DE GARAGEM NÃO RESIDENCIAL P4, SALA P4                                                      |      22|  41.717950| 0.0e+00|
|Oeste      |VAGA DE GARAGEM RESIDENCIAL P5, APARTAMENTO P5                                                   |       8|  40.172840| 0.0e+00|
|Centro-Sul |GALPÃO P2 OUTLIER, GALPÃO P3 OUTLIER                                                             |       7|  22.367058| 0.0e+00|
|Centro-Sul |VAGA DE GARAGEM NÃO RESIDENCIAL P5 OUTLIER, SALA P5                                              |      28|  16.460608| 0.0e+00|
|Centro-Sul |VAGA DE GARAGEM NÃO RESIDENCIAL P5, SALA P5                                                      |      47|  16.117678| 0.0e+00|
|Centro-Sul |VAGA DE GARAGEM NÃO RESIDENCIAL P5, VAGA DE GARAGEM NÃO RESIDENCIAL P5 OUTLIER                   |      20|  12.933333| 0.0e+00|
|Centro-Sul |BARRACÃO P1, BARRACÃO P1 OUTLIER                                                                 |       9|  11.530190| 0.0e+00|
|Centro-Sul |VAGA DE GARAGEM NÃO RESIDENCIAL P5 OUTLIER, SALA P5 OUTLIER                                      |      25|  11.411765| 0.0e+00|
|Centro-Sul |SALA P5, SALA P5 OUTLIER                                                                         |      39|   9.440642| 0.0e+00|
|Centro-Sul |CASA COM OCUPAÇÃO NÃO RESIDENCIAL P4, CASA COM OCUPAÇÃO NÃO RESIDENCIAL P5                       |       9|   9.100521| 1.0e-07|
|Centro-Sul |VAGA DE GARAGEM NÃO RESIDENCIAL P5, SALA P5 OUTLIER                                              |      34|   9.053333| 0.0e+00|
|Centro-Sul |VAGA DE GARAGEM RESIDENCIAL P5 OUTLIER, APARTAMENTO P5 OUTLIER                                   |      11|   8.766432| 0.0e+00|

Padrões de Associação Mais Relevantes
    Sala e Vaga de Garagem:
        Norte: SALA P3 OUTLIER e VAGA DE GARAGEM NÃO RESIDENCIAL P3 OUTLIER são combinados com um suporte significativo e lift elevado.
        Venda Nova: VAGA DE GARAGEM NÃO RESIDENCIAL P3 OUTLIER e SALA P3 também aparecem juntos com um suporte razoável e lift elevado.
    Sala e Outras Salas:
        Barreiro: SALA P3 combinada com SALA P3 OUTLIER e SALA P2 com SALA P2 OUTLIER têm alta frequência e lift considerável, indicando uma forte relação entre diferentes tipos de salas.
    Apartamento e Outras Salas/Vagas:
        Leste: APARTAMENTO P4 frequentemente aparece junto com APARTAMENTO P4 OUTLIER, com lift relativamente alto.
        Pampulha: APARTAMENTO P5 combinado com APARTAMENTO P5 OUTLIER e VAGA DE GARAGEM NÃO RESIDENCIAL P4 com SALA P4 mostram uma associação significativa.
    Galpão e Outras Salas:
        Centro-Sul: GALPÃO P2 OUTLIER e GALPÃO P3 OUTLIER aparecem frequentemente juntos, indicando uma relação forte entre diferentes tipos de galpões.
    Vaga de Garagem e Tipos Residenciais:
        Oeste: VAGA DE GARAGEM NÃO RESIDENCIAL P5 com SALA P5 OUTLIER e VAGA DE GARAGEM RESIDENCIAL P5 com APARTAMENTO P5 mostram associações significativas.
        Centro-Sul: VAGA DE GARAGEM NÃO RESIDENCIAL P5 com SALA P5 OUTLIER apresentou alto suporte.

Observações Adicionais
    Outliers: Itens com OUTLIER (área construída muito acima da média) têm uma presença notável em muitas combinações, indicando que padrões extremos são comuns e podem estar relacionados com certos tipos de imóveis.
    Lift: Alguns padrões de associação têm lifts muito altos, sugerindo uma forte relação entre os itens em contextos específicos.

Esses padrões podem indicar preferências ou tendências em diferentes regiões de Belo Horizonte, como a prevalência de certas combinações de tipos de imóveis e características associadas. Se precisar de mais detalhes sobre alguma associação específica ou de outra análise, estou à disposição!
