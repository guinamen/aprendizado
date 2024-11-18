# Cluster de imóveis
O DBSCAN (Density-Based Spatial Clustering of Applications with Noise) é um algoritmo de agrupamento baseado na densidade. Ele é amplamente utilizado para identificar clusters de formas arbitrárias em conjuntos de dados, mesmo na presença de ruído.

Para os imóveis de qualidade de acabamento P5, o mesmo foi utilizado para identificar os agrupamentos de imóveis na regional Centro-Sul. O resultado foi ajustado obtendo 6 clusters, os imóveis estão detacados na cor preta e os seis clusters destacados conforme legenda.

Parâmetros usados: eps = 0.17 e MinPts = 5

## Mapa
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/main/Imagens/cluster.png)

## Bairros

|  Cluster | Bairros | Total de Imóveis |
|---|---|---|
|  1 | Sion, Belvedere, Marçola, Comiteco, Mangabeiras, Serra, Carmo, Anchieta e Cruzeiro | 2.776 |
|  2 | Cidade Jardim, Santo Agostinho, Savassi, Santo Antônio, Lourdes e São Pedro | 4.972 |
|  3 | Belvedere, São Bento, Coração de Jesus, Mangabeiras, Santa Lúcia e Vila Paris | 2.771 |
|  4 | Funcionários, Savassi, Serra, Santa Efigênia, Cruzeiro | 2078 |
|  5 | Boa Viagem, Lourdes | 75 |
|  6 | Luxemburgo, Vila Paris | 219 |
