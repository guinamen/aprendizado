# Algoritmos escolhidos
Como o objetivo do trabalho é caracterizar o espaço urbano, demos preferência aos algroritmos de representação compacta. 

## Base 2
Para analizar esta base o algoritmo FHMFreq foi utilizado para obter as representaçõe com utilidade mínima e alta frequência. Para tanto configura-se a utilidade mínima como 1 Km², ou seja o itemset deve ter no mínimo este valor total de metros quadrados e no mínimo 30% de suporte.  

### Barreiro
Itemset| Utilidade (m²)| Suporte
--|--|--
BARRACAO_P2, CASA_P1, CASA_P3|2.056.244|431
BARRACAO_P2, CASA_P1, CASA_P2|2.193.074|438
BARRACAO_P2, CASA_P3|1.925.733|521
BARRACAO_P2, CASA_P3, CASA_P2|3.820.418|515
BARRACAO_P2, CASA_P2|2.006.769|532
LOJA_P1, CASA_P3|1.787.271|480
LOJA_P1, CASA_P3, CASA_P2|3.566.585|477
LOJA_P1, CASA_P2|1.886.265|497
LOJA_P3, CASA_P3|2.121.446|481
LOJA_P3, CASA_P3, CASA_P2|3.902.519|473
LOJA_P3, CASA_P2|2.064.161|494
LOJA_P2, CASA_P1, CASA_P3|2.176.829|429
LOJA_P2, CASA_P1, CASA_P2|2.234.830|435
LOJA_P2, CASA_P3|2.107.713|540
LOJA_P2, CASA_P3, CASA_P2|4.053.194|534
LOJA_P2, CASA_P2|2.098.971|553
CASA_P1, CASA_P3|2.937.989|827
CASA_P1, CASA_P3, CASA_P2|5.434.070|810
CASA_P1, CASA_P2|3.088.545|862
CASA_P3|2.985.327|1.174
CASA_P3, CASA_P2|5.824.804|1.115
CASA_P2|2.951.415|1.255

### Centro-Sul
Itemset| Utilidade (m²)| Suporte
--|--|--
CASA_P4, CASA_P3|1.492.455|400
LOJA_P3_TRUE|1.634.776|394
LOJA_P4,LOJA_P3|1.083.081|416
CASA_P3, APARTAMENTO_P3|5.073.641|470
APARTAMENTO_P4|6.992.504|510
APARTAMENTO_P4, APARTAMENTO_P3|10.415.851|435
LOJA_P3, APARTAMENTO_P3|4.913.285|453
APARTAMENTO_P3|5.914.111|672


