# Descoberta de Subgrupo

Para descoberta de subgrupos foi utilizado o programa [Cortana](https://datamining.liacs.nl/cortana.html). Os registros foram agrupados pelo centroide do terreno, sendo coletadas as seguintes informações: X (latitude), Y (longitude), área do terreno, área média construída, tipo de construção e o padrão de qualidade máximo. Somente a regional Centro-Sul foi analizada em busca de imóveis que podem estar em situação social vulnerável. Ao todo foram encontrados 6.748 apartamentos (45,1%).

O software foi configurado da seguinte forma:
Medida WRAcc com valor mínimo de 0.09, variável alvo Tipo Construtivo, valor alvo Apartamento, profundidade 5, cobertura mínima 2, cobertura máxima 100%, número de subgrupos 0, tempo de execução máximo um minuto, estratégia best first, estratégia numérica best.
As variáveis X e Y representam, respectivamente, latitude e longitude no referencial [SIRGAS 2000](https://www.ibge.gov.br/geociencias/informacoes-sobre-posicionamento-geodesico/sirgas.html).

## Resultado
Nr.|Depth|Coverage|Quality|Probability|Positives|Conditions
--|--|--|--|--|--|--
1|5|5984|11,86%|74,77%|4474|Y >= 7793407.0 AND AREA_TERRENO >= 361.46 AND X <= 613161.7 AND AREA_CONSTRUCAO <= 738.49 AND AREA_CONSTRUCAO >= 40.01
2|5|5984|11,86%|74,77%|4474|Y >= 7793407.0 AND AREA_TERRENO >= 361.46 AND X <= 613161.7 AND AREA_CONSTRUCAO >= 40.01 AND AREA_CONSTRUCAO <= 738.49
3|5|5970|11,85%|74,81%|4466|Y >= 7793407.0 AND AREA_TERRENO >= 361.46 AND AREA_CONSTRUCAO >= 52.9 AND X <= 613161.7 AND AREA_CONSTRUCAO <= 738.49
4|5|5956|11,85%|74,87%|4459|Y >= 7793407.0 AND AREA_TERRENO >= 361.46 AND X <= 613161.7 AND Y <= 7797546.5 AND AREA_CONSTRUCAO <= 738.49
5|5|5956|11,85%|74,87%|4459|Y >= 7793407.0 AND AREA_TERRENO >= 361.46 AND X <= 613161.7 AND AREA_CONSTRUCAO <= 738.49 AND Y <= 7797546.5
6|5|5956|11,85%|74,87%|4459|Y >= 7793407.0 AND AREA_TERRENO >= 361.46 AND Y <= 7797546.5 AND X <= 613161.7 AND AREA_CONSTRUCAO <= 738.49

O resultado 2 foi escolhido para filtrar a base dos registros imoboliários para selecionar os imóveis que se enquadram neste resultado e que possui padrão de qualidade P1. Os resulgados foram agrupados pela zona homogenia e o campo número de economias, que para o caso de residências significa o total de famílias, foi somado gerando a seguinte tabela.
Zone Homogenia| Total
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
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/master/Imagens/gentrificacao.png)

### Mapa
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/master/Imagens/cortana-ap.png)

