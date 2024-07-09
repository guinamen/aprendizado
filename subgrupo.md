# Descoberta de Subgrupo

Para descoberta de subgrupos foi utilizado o programa [Cortana](https://datamining.liacs.nl/cortana.html) utilizando toda a base de imóveis residenciais que não seja uma vaga de garagem. Com as seguintes configurações:
Medida WRAcc, variável alvo Padrão de Acabamento, valor alvo P5, profundidade 6, cobertura mínima 2, cobertura máxima 100%, número de subgrupos 0, tempo de execução máximo um minuto, estratégia depht first, largura de procura 100, estratégia numérica best e operadores <=, >= e =.
As variáveis X e Y representam, respectivamente, latitude e longitude no referencial [SIRGAS 2000](https://www.ibge.gov.br/geociencias/informacoes-sobre-posicionamento-geodesico/sirgas.html).

## Resultado
Nr.|Depth|Coverage|Quality|Probability|Positives|p-Value|Conditions
--|--|--|--|--|--|--|--
1|6|5474|0,052452|0,248082|1.358|-|AREA_TERRENO >= 449.5 AND AREA_CONSTRUCAO >= 400.0 AND Y <= 7796046.5 AND X <= 614244.56 AND X >= 608928.3 AND AREA_CONSTRUCAO <= 43316.2

### Mapa
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/main/Imagens/cortana.png)
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/main/Imagens/cortana2.png)

