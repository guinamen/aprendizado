# Descoberta de Subgrupo

Para descoberta de subgrupos foi utilizado o programa [Cortana](https://datamining.liacs.nl/cortana.html). Os registros foram agrupados pelo centroide do terreno, sendo coletadas as seguintes informações: X (latitude), Y (longitude), área do terreno, área média construída, tipo de construção e o padrão de qualidade máximo. Somente a regional Centro-Sul foi analizada em busca de imóveis que podem estar em situação social vulnerável. Ao todo foram encontrados 6.748 apartamentos (45,1%).

O software foi configurado da seguinte forma:
Para configurar o Cortana foi escolhida a vari ́avel padrão de acabamento com o valor alvo P5; com a medida de qualidade de Jaccard com valor mínimo de 0,2; com a profundidade 5; estratégia best first; estratégia numérica beest first; estratégia numérica best.
As variáveis X e Y representam, respectivamente, latitude e longitude no referencial [SIRGAS 2000](https://www.ibge.gov.br/geociencias/informacoes-sobre-posicionamento-geodesico/sirgas.html).

## Resultado
Nr.|Depth|Coverage|Quality|Probability|Positives|Conditions
--|--|--|--|--|--|--
1|5|2209|0,442873507738113|0,5246717971933|1159|NaN|AREA_CONSTRUCAO <= 3444.27 AND AREA_CONSTRUCAO >= 423.0 AND X <= 614227.2 AND AREA_TERRENO >= 441.0 AND Y <= 7796076.5
2|5|2209|0,442873507738113|0,5246717971933|1159|NaN|AREA_CONSTRUCAO <= 3444.27 AND AREA_CONSTRUCAO >= 423.0 AND AREA_TERRENO >= 441.0 AND X <= 614227.2 AND Y <= 7796076.5
3|5|2209|0,442873507738113|0,5246717971933|1159|NaN|AREA_CONSTRUCAO <= 3444.27 AND AREA_CONSTRUCAO >= 423.0 AND AREA_TERRENO >= 441.0 AND Y <= 7796076.5 AND X <= 614227.2
4|5|2209|0,442873507738113|0,5246717971933|1159|NaN|AREA_CONSTRUCAO >= 423.0 AND X <= 614227.2 AND X >= 608975.7 AND AREA_TERRENO >= 441.0 AND Y <= 7796076.5
5|5|2209|0,442873507738113|0,5246717971933|1159|NaN|AREA_CONSTRUCAO >= 423.0 AND X <= 614227.2 AND AREA_TERRENO >= 441.0 AND X >= 608975.7 AND Y <= 7796076.5
6|5|2209|0,442873507738113|0,5246717971933|1159|NaN|AREA_CONSTRUCAO >= 423.0 AND X <= 614227.2 AND AREA_TERRENO >= 441.0 AND Y <= 7796076.5 AND X >= 608975.7
7|5|2209|0,442873507738113|0,5246717971933|1159|NaN|AREA_CONSTRUCAO >= 423.0 AND X <= 614227.2 AND AREA_TERRENO >= 441.0 AND Y <= 7796076.5 AND AREA_CONSTRUCAO <= 3444.27
8|5|2209|0,442873507738113|0,5246717971933|1159|NaN|AREA_CONSTRUCAO >= 423.0 AND X <= 614227.2 AND AREA_TERRENO >= 441.0 AND AREA_CONSTRUCAO <= 3444.27 AND Y <= 7796076.5
9|5|2209|0,442873507738113|0,5246717971933|1159|NaN|AREA_CONSTRUCAO >= 423.0 AND X <= 614227.2 AND AREA_CONSTRUCAO <= 3444.27 AND AREA_TERRENO >= 441.0 AND Y <= 7796076.5
10|5|2209|0,442873507738113|0,5246717971933|1159|NaN|AREA_CONSTRUCAO >= 423.0 AND X >= 608975.7 AND X <= 614227.2 AND AREA_TERRENO >= 441.0 AND Y <= 7796076.5


O resultado 2 foi escolhido para filtrar a base dos registros imoboliários para selecionar os imóveis que se enquadram neste resultado e que possui padrão de qualidade P1. Os resulgados foram agrupados pela zona homogenia e o campo número de economias, que para o caso de residências significa o total de famílias, foi somado gerando a seguinte tabela.
Zona Homogenia| Total
--|--
CS101, CS111, CS120, CS124, CS206, CS213, CS302, CS409, CS418|1
CS117, CS129, CS208, CS406, CS416|2
CS118, CS315, LE225|3
CS305|5
CS106|7
CS306|8
CS412|9
CS407|10
CS313|12
CS210, CS212|13
CS411|23

### Exmplo de Imóvel Encontrado
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/main/Imagens/gentrificacao.png)

### Mapa
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/main/Imagens/cortana-ap.png)

