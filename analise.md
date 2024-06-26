# Análise
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/main/area.png)
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/main/populacao.png)
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/main/area_construida.png)
## Distribuição da Área Construída. 

Ao analisar a área construída dos imóveis, foi constado que, ela varia muito em função dos tipos de imóveis. Sendo observado a existência de muitos valores fora do padrão (outliers). Sendo assim, uma nova dimensão binária foi adicionada aos dados, classificando-os em outliers caso estejam fora do intervalo I definido abaixo. Sendo IQR o valor interquartil e qn o valor do enésimo quartil.
I=[q0.25−1.5⋅IQR; q0.75+1.5⋅IQR]
Ao todo foram classficados 42.849 imóveis como sendo outiliers e 833.968 não.

## Total de Registros
Barreiro|Centro-Sul|Leste|Nordeste|Noroeste|Norte|Oeste|Pampulha|Venda Nova | **Total**
--|--|--|--|--|--|--|--|--|--
65390|220991|67561|87187|81741|51240|124864|108035|69808| **876817**

## Características dos Imóveis

||Barreiro|Centro-Sul|Leste|Nordeste|Noroeste|Norte|Oeste|Pampulha|Venda Nova
|--|--|--|--|--|--|--|--|--|--
|APARTAMENTO|19755| 112012| 31344| 38793| 35116| 18536| 77194| 55735| 20434
|APARTAMENTO COM OCUPACAO NAO RESIDENCIAL|2| 2511| 11| 506| 259| 0| 698| 373| 2
|BARRACAO|2179| 303| 2306| 2593| 2101| 1860| 1605| 1650| 2442
|BARRACAO COM OCUPACAO NAO RESIDENCIAL|120| 29| 83| 131| 104| 62| 77| 107| 104
|CASA|32324| 8380| 23160| 30937| 30452| 23111| 20188| 31721| 36172
|CASA COM OCUPACAO NAO RESIDENCIAL|314| 691| 432| 404| 587| 223| 650| 715| 347
|GALPAO|1507| 971| 986| 1702| 2969| 964| 1909| 2119| 1293
|LOJA|5114| 16854| 4674| 5628| 6301| 3417| 6529| 5528| 5145
|LOTE VAGO|3282| 2932| 2177| 4100| 2145| 2775| 3745| 6676| 3268
|SALA|530| 42464| 1081| 1154| 1028| 166| 5384| 1847| 438
|VAGA DE GARAGEM NAO RESIDENCIAL|186| 24612| 542| 670| 157| 69| 5421| 1112| 117
|VAGA DE GARAGEM RESIDENCIAL|77| 9230| 765| 569| 522| 57| 1464| 452| 46​

## Ocupação
||Barreiro|Centro-Sul|Leste|Nordeste|Noroeste|Norte|Oeste|Pampulha|Venda Nova
|--|--|--|--|--|--|--|--|--|--
|NAO RESIDENCIAL|7773|88132|7809|10195|11405|4901|20668|11801|7446
|RESIDENCIAL|54335|129925|57575|72892|68191|43564|100451|89558|59094
|TERRITORIAL|3282|2932|2177|4100|2145|2775|3745|6676|3268

## Tipo de Imóveis
||Barreiro|Centro-Sul|Leste|Nordeste|Noroeste|Norte|Oeste|Pampulha|Venda Nova
|--|--|--|--|--|--|--|--|--|--
|ALINHAMENTO|3418|31282|5313|5713|3725|2231|8504|3241|4264
|APART HOTEL|0|624|6|116|42|4|4|241|0
|APART HOTEL (FRACAO=1)|0|0|0|0|0|0|0|172|0
|CASA ADAPTADA|97|1589|299|239|254|91|500|291|80
|CASA ADAPTADA (FRACAO=1)|2|9|4|3|8|3|5|6|4
|CEMITERIO-PARQUE|0|0|0|0|0|2|1|0|0
|CENTRO DE COMERCIO POPULAR|5|11|0|1|0|0|0|0|3
|CINEMAS E TEATROS|0|14|2|0|3|0|0|0|0
|CINEMAS E TEATROS (FRACAO=1)|0|2|1|0|0|0|1|0|0
|CLUBE ESPORTIVOS E SOCIAIS|4|273|8|4|7|2|6|29|5
|CLUBE ESPORTIVOS E SOCIAIS (FRACAO=1)|0|1|0|0|0|0|1|4|1
|COLÉGIOS E CRECHES|67|108|52|62|58|39|92|68|50
|COLÉGIOS E CRECHES (FRACAO=1)|2|4|2|5|0|1|4|8|2
|DEMAIS CASOS|10106|38165|15298|16524|22495|8416|24229|24317|12042
|DEMAIS CASOS (FRACAO=1)|59|402|47|64|47|27|74|65|39
|ESQUINA|101|156|251|157|165|72|141|109|102
|FRENTE|37493|88491|35155|50746|41201|31677|77091|68471|41729
|FUNDOS|2041|141|926|2048|1747|1413|904|984|2774
|HOSPITAIS, CLINICAS E SIMILARES|22|96|17|12|22|8|31|11|14
|HOSPITAIS, CLINICAS E SIMILARES (FRACAO=1)|0|7|0|0|4|1|1|1|3
|HOTEIS, MOTEIS E SIMILARES|1|677|5|6|31|3|14|93|1
|HOTEIS, MOTEIS E SIMILARES (FRACAO=1)|0|2|0|0|4|0|0|2|0
|LOJA COM 1 FRENTE|1|0|0|0|1|1|1|0|6
|LOJA COM 1 FRENTE (FRACAO=1)|1|1|0|0|0|0|3|0|3
|LOJA COMUM|3898|2702|2970|3947|4628|2705|3257|3304|4355
|LOJA DESDOBRADA NÃO CONDOMINIAL|12|2|13|14|24|10|8|2|22
|LOJA EM EDIFICIO/GALERIA-FRENTE PARA RUA|237|6466|720|653|569|160|1575|1155|235
|LOJA EM EDIFICIO/GALERIA-FRENTE PARA RUA (FRACAO=1)|3|23|13|1|14|1|19|42|5
|LOJA EM EDIFICIO/GALERIA-INFERIOR|20|299|8|5|20|5|17|8|11
|LOJA EM EDIFICIO/GALERIA-LOGRADOURO|109|2698|252|136|146|79|416|316|48
|LOJA EM EDIFICIO/GALERIA-LOGRADOURO (FRACAO=1)|0|6|0|0|0|0|9|0|1
|LOJA EM EDIFICIO/GALERIA-SOBRELOJA|51|1344|45|43|15|43|45|55|18
|LOJA EM EDIFICIO/GALERIA-SOBRELOJA (FRACAO=1)|0|0|0|0|0|0|0|0|1
|LOJA EM EDIFICIO/GALERIA-SUPERIOR|23|1597|10|7|62|3|243|68|25
|LOJA EM EDIFICIO/GALERIA-SUPERIOR (FRACAO=1)|0|5|0|0|1|0|0|0|0
|NIVEL DE LOGRADOURO|4|114|4|61|47|2|68|3|3
|NIVEL INFERIOR|200|28|48|187|88|140|52|81|191
|NIVEL SUPERIOR|5|1950|1|71|0|0|2|0|0
|POSTO DE GASOLINA|13|29|18|29|35|20|29|23|21
|POSTO DE GASOLINA (FRACAO=1)|1|1|1|1|3|1|2|0|1
|SHOPPING CENTER|0|1|0|7|0|0|0|0|0
|SHOPPING CENTER (FRACAO=1)|2|10|3|82|3|0|4|3|3
|TERRITORIAL|1238|720|949|1361|653|1179|875|1100|934
|UNIDADE CONDOMINIAL IRREGULAR|0|0|0|0|0|0|4|0|0

## Qualidade dos Imóveis
||Barreiro|Centro-Sul|Leste|Nordeste|Noroeste|Norte|Oeste|Pampulha|Venda Nova
|--|--|--|--|--|--|--|--|--|--
|TE|3282|2932|2177|4100|2145|2775|3745|6676|3268
|P1|6659|1267|4428|7230|5369|5145|3816|3440|8133
|P2|27325|20750|20283|24938|25761|18567|21911|19432|26232
|P3|24941|93448|35503|41973|43065|22140|61229|61133|30354
|P4|3151|77965|5041|8404|5103|2575|29259|15624|1779
|P5|32|24627|129|542|298|38|4904|1730|42

![alt Perfil da Coleta de Lixo por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/main/coleta.png)
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/main/perfil.png)
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/main/ocupacao.png)
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/main/acabamento.png)
