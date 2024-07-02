# Descoberta de Subgrupo

Para descoberta de subgrupos foi utilizado o programa [Cortana](https://datamining.liacs.nl/cortana.html) utilizando toda a base de imóveis residenciais que não seja uma vaga de garagem. Com as seguintes configurações:
Medida WRAcc, variável alvo Padrão de Acabamento, valor alvo P5, profundidade 4, cobertura mínima 10.000, cobertura máxima 70%, número de subgrupos 1, tempo de execução máximo um minuto, estratégia bean, largura de procura 100, estratégia numérica intervalos.
As variáveis X e Y representam, respectivamente, latitude e longitude no referencial [SIRGAS 2000](https://www.ibge.gov.br/geociencias/informacoes-sobre-posicionamento-geodesico/sirgas.html).

## Resultado
Nr.|Depth|Coverage|Quality|Probability|Positives|p-Value|Conditions
--|--|--|--|--|--|--|--
1|4|22076|0.057697780430316925|0.42598296792897267|9404.0|NaN|AREA_CONSTRUCAO in (240.36, 6946.03] AND AREA_TERRENO in (449.49, 21167.36] AND X in (608895.7, 614244.56] AND Y in (-inf, 7796310.0]

### Mapa
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/main/Imagens/cortana.png)
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/main/Imagens/cortana2.png)
