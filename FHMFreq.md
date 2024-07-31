# Algoritmos escolhidos
Como o objetivo do trabalho é caracterizar o espaço urbano, demos preferência aos algroritmos de representação compacta. 

## Algoritmo FHMFreq
Para analizar esta base o algoritmo FHMFreq foi utilizado para obter as representaçõe com utilidade mínima e alta frequência. Para tanto configura-se a utilidade mínima como 1 Km², ou seja o itemset deve ter no mínimo este valor total de metros quadrados e no mínimo 30% de suporte.

### Sumário
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/main/Imagens/utilidade_suporte.png)

### Dados
|REGIONAL   |ITEMSET                                | UTILIDADE M²| SUPORTE|
|:----------|:--------------------------------------|------------:|-------:|
|Norte      |BARRACÃO P1, CASA P2                   |    1.082.798|     370|
|Norte      |BARRACÃO P2, CASA P2                   |    1.203.687|     393|
|Norte      |BARRACÃO P2, CASA P2, CASA P3          |    2.217.606|     377|
|Norte      |BARRACÃO P2, CASA P3                   |    1.104.541|     382|
|Norte      |LOJA P1, CASA P2                       |    1.187.691|     383|
|Norte      |LOJA P1, CASA P2, CASA P3              |    2.234.140|     365|
|Norte      |LOJA P1, CASA P3                       |    1.124.418|     368|
|Norte      |LOJA P2, CASA P2                       |    1.196.703|     377|
|Norte      |LOJA P2, CASA P2, CASA P3              |    2.296.067|     365|
|Norte      |LOJA P2, CASA P3                       |    1.182.761|     367|
|Norte      |CASA P1, CASA P2                       |    2.091.837|     682|
|Norte      |CASA P1, CASA P2, CASA P3              |    3.615.570|     636|
|Norte      |CASA P1, CASA P3                       |    1.997.858|     645|
|Norte      |CASA P2                                |    1.895.347|    1024|
|Norte      |CASA P2, CASA P3                       |    3.848.151|     887|
|Norte      |CASA P3                                |    2.055.395|     956|
|Barreiro   |BARRACÃO P2, CASA P1, CASA P3          |    2.056.760|     431|
|Barreiro   |BARRACÃO P2, CASA P1, CASA P2          |    2.193.627|     438|
|Barreiro   |BARRACÃO P2, CASA P3                   |    1.926.141|     521|
|Barreiro   |BARRACÃO P2, CASA P3, CASA P2          |    3.821.080|     515|
|Barreiro   |BARRACÃO P2, CASA P2                   |    2.007.206|     532|
|Barreiro   |LOJA P1, CASA P3                       |    1.787.659|     480|
|Barreiro   |LOJA P1, CASA P3, CASA P2              |    3.567.206|     477|
|Barreiro   |LOJA P1, CASA P2                       |    1.886.680|     497|
|Barreiro   |LOJA P3, CASA P3                       |    2.121.815|     481|
|Barreiro   |LOJA P3, CASA P3, CASA P2              |    3.903.126|     473|
|Barreiro   |LOJA P3, CASA P2                       |    2.064.561|     494|
|Barreiro   |LOJA P2, CASA P1, CASA P3              |    2.177.377|     429|
|Barreiro   |LOJA P2, CASA P1, CASA P2              |    2.235.389|     435|
|Barreiro   |LOJA P2, CASA P3                       |    2.108.165|     540|
|Barreiro   |LOJA P2, CASA P3, CASA P2              |    4.053.907|     534|
|Barreiro   |LOJA P2, CASA P2                       |    2.099.443|     553|
|Barreiro   |CASA P1, CASA P3                       |    2.938.687|     827|
|Barreiro   |CASA P1, CASA P3, CASA P2              |    5.435.165|     810|
|Barreiro   |CASA P1, CASA P2                       |    3.089.301|     862|
|Barreiro   |CASA P3                                |    2.985.857|    1174|
|Barreiro   |CASA P3, CASA P2                       |    5.825.849|    1115|
|Barreiro   |CASA P2                                |    2.952.000|    1255|
|Leste      |BARRACÃO P1, CASA P2                   |    1.136.293|     277|
|Leste      |BARRACÃO P2, CASA P1, CASA P3          |    1.611.077|     299|
|Leste      |BARRACÃO P2, CASA P1, CASA P3, CASA P2 |    2.893.621|     298|
|Leste      |BARRACÃO P2, CASA P1, CASA P2          |    1.620.904|     319|
|Leste      |BARRACÃO P2, CASA P3                   |    1.624.793|     387|
|Leste      |BARRACÃO P2, CASA P3, CASA P2          |    3.086.470|     384|
|Leste      |BARRACÃO P2, CASA P2                   |    1.585.704|     409|
|Leste      |CASA P4, CASA P3                       |    1.848.690|     335|
|Leste      |CASA P4, CASA P3, CASA P2              |    3.082.740|     330|
|Leste      |CASA P4, CASA P2                       |    1.465.287|     333|
|Leste      |LOJA P1, CASA P1, CASA P3              |    1.516.894|     279|
|Leste      |LOJA P1, CASA P1, CASA P3, CASA P2     |    2.741.782|     279|
|Leste      |LOJA P1, CASA P1, CASA P2              |    1.488.940|     289|
|Leste      |LOJA P1, CASA P3                       |    1.544.709|     362|
|Leste      |LOJA P1, CASA P3, CASA P2              |    2.956.898|     360|
|Leste      |LOJA P1, CASA P2                       |    1.490.656|     377|
|Leste      |LOJA P2, CASA P3                       |    1.559.134|     375|
|Leste      |LOJA P2, CASA P3, CASA P2              |    2.948.442|     368|
|Leste      |LOJA P2, CASA P2                       |    1.513.437|     385|
|Leste      |LOJA P3, CASA P3                       |    1.695.706|     378|
|Leste      |LOJA P3, CASA P3, CASA P2              |    3.035.798|     367|
|Leste      |LOJA P3, CASA P2                       |    1.553.183|     378|
|Leste      |APARTAMENTO P3                         |    2.231.148|     377|
|Leste      |APARTAMENTO P3, CASA P3                |    3.670.227|     367|
|Leste      |APARTAMENTO P3, CASA P3, CASA P2       |    4.789.155|     360|
|Leste      |APARTAMENTO P3, CASA P2                |    3.304.259|     365|
|Leste      |CASA P1, CASA P3                       |    2.032.439|     470|
|Leste      |CASA P1, CASA P3, CASA P2              |    3.682.315|     466|
|Leste      |CASA P1, CASA P2                       |    1.974.217|     499|
|Leste      |CASA P3                                |    2.264.355|     753|
|Leste      |CASA P3, CASA P2                       |    4.280.634|     720|
|Leste      |CASA P2                                |    2.078.086|     797|
|Venda Nova |BARRACÃO P1, CASA P3                   |    1.604.933|     457|
|Venda Nova |BARRACÃO P1, CASA P3, CASA P2          |    3.091.894|     445|
|Venda Nova |BARRACÃO P1, CASA P2                   |    1.566.457|     464|
|Venda Nova |BARRACÃO P2, CASA P1, CASA P3          |    2.086.100|     445|
|Venda Nova |BARRACÃO P2, CASA P1, CASA P3, CASA P2 |    3.673.308|     444|
|Venda Nova |BARRACÃO P2, CASA P1, CASA P2          |    2.050.673|     457|
|Venda Nova |BARRACÃO P2, CASA P3                   |    1.913.967|     517|
|Venda Nova |BARRACÃO P2, CASA P3, CASA P2          |    3.595.097|     516|
|Venda Nova |BARRACÃO P2, CASA P2                   |    1.768.525|     541|
|Venda Nova |LOJA P3, CASA P3                       |    1.971.279|     487|
|Venda Nova |LOJA P3, CASA P3, CASA P2              |    3.542.075|     480|
|Venda Nova |LOJA P3, CASA P2                       |    1.819.267|     490|
|Venda Nova |LOJA P1, CASA P1, CASA P3              |    2.175.263|     460|
|Venda Nova |LOJA P1, CASA P1, CASA P3, CASA P2     |    3.837.406|     460|
|Venda Nova |LOJA P1, CASA P1, CASA P2              |    2.185.310|     474|
|Venda Nova |LOJA P1, CASA P3                       |    1.870.621|     518|
|Venda Nova |LOJA P1, CASA P3, CASA P2              |    3.618.601|     518|
|Venda Nova |LOJA P1, CASA P2                       |    1.847.479|     537|
|Venda Nova |LOJA P2, CASA P1, CASA P3              |    2.307.865|     480|
|Venda Nova |LOJA P2, CASA P1, CASA P3, CASA P2     |    4.039.844|     479|
|Venda Nova |LOJA P2, CASA P1, CASA P2              |    2.297.955|     492|
|Venda Nova |LOJA P2, CASA P3                       |    2.058.188|     552|
|Venda Nova |LOJA P2, CASA P3, CASA P2              |    3.888.221|     549|
|Venda Nova |LOJA P2, CASA P2                       |    1.985.042|     569|
|Venda Nova |CASA P1, CASA P3                       |    3.308.778|     905|
|Venda Nova |CASA P1, CASA P3, CASA P2              |    5.828.590|     896|
|Venda Nova |CASA P1, CASA P2                       |    3.216.971|     937|
|Venda Nova |CASA P3                                |    3.182.855|    1233|
|Venda Nova |CASA P3, CASA P2                       |    5.923.968|    1160|
|Venda Nova |CASA P2                                |    2.866.427|    1266|
|Noroeste   |CASA P4, CASA P2                       |    1.805.443|     453|
|Noroeste   |CASA P4, CASA P2, CASA P3              |    3.733.370|     447|
|Noroeste   |CASA P4, CASA P3                       |    2.307.017|     471|
|Noroeste   |BARRACÃO P2, CASA P2                   |    1.931.772|     516|
|Noroeste   |BARRACÃO P2, CASA P2, CASA P3          |    3.856.902|     503|
|Noroeste   |BARRACÃO P2, CASA P3                   |    2.031.023|     512|
|Noroeste   |APARTAMENTO P3                         |    2.268.709|     466|
|Noroeste   |APARTAMENTO P3, CASA P2                |    3.037.348|     403|
|Noroeste   |APARTAMENTO P3, CASA P3                |    3.722.363|     428|
|Noroeste   |GALPÃO P2, CASA P2                     |    1.955.676|     456|
|Noroeste   |GALPÃO P2, CASA P2, CASA P3            |    3.544.261|     430|
|Noroeste   |GALPÃO P2, CASA P3                     |    2.062.849|     440|
|Noroeste   |LOJA P1, CASA P2                       |    1.959.466|     514|
|Noroeste   |LOJA P1, CASA P2, CASA P3              |    3.901.306|     497|
|Noroeste   |LOJA P1, CASA P3                       |    2.061.699|     505|
|Noroeste   |CASA P1, LOJA P2, CASA P2              |    2.057.884|     405|
|Noroeste   |CASA P1, CASA P2                       |    2.552.012|     665|
|Noroeste   |CASA P1, CASA P2, CASA P3              |    4.761.125|     631|
|Noroeste   |CASA P1, CASA P3                       |    2.603.209|     639|
|Noroeste   |LOJA P2, CASA P2                       |    2.138.813|     576|
|Noroeste   |LOJA P2, CASA P2, CASA P3              |    4.178.260|     551|
|Noroeste   |LOJA P2, CASA P3                       |    2.255.142|     564|
|Noroeste   |LOJA P3, CASA P2                       |    2.021.051|     534|
|Noroeste   |LOJA P3, CASA P2, CASA P3              |    3.950.437|     513|
|Noroeste   |LOJA P3, CASA P3                       |    2.287.483|     540|
|Noroeste   |CASA P2                                |    2.738.033|    1111|
|Noroeste   |CASA P2, CASA P3                       |    5.755.736|    1008|
|Noroeste   |CASA P3                                |    3.122.192|    1073|
|Nordeste   |BARRACÃO P1, CASA P2                   |    1.656.867|     509|
|Nordeste   |BARRACÃO P1, CASA P2, CASA P3          |    2.915.951|     483|
|Nordeste   |BARRACÃO P1, CASA P3                   |    1.363.826|     488|
|Nordeste   |BARRACÃO P2, CASA P2                   |    1.671.404|     509|
|Nordeste   |BARRACÃO P2, CASA P2, CASA P3          |    3.166.065|     498|
|Nordeste   |BARRACÃO P2, CASA P3                   |    1.603.730|     506|
|Nordeste   |LOJA P1, CASA P1, CASA P2              |    2.181.516|     486|
|Nordeste   |LOJA P1, CASA P1, CASA P2, CASA P3     |    3.638.111|     473|
|Nordeste   |LOJA P1, CASA P1, CASA P3              |    1.974.733|     473|
|Nordeste   |LOJA P1, CASA P2                       |    1.877.814|     572|
|Nordeste   |LOJA P1, CASA P2, CASA P3              |    3.486.892|     552|
|Nordeste   |LOJA P1, CASA P3                       |    1.726.402|     559|
|Nordeste   |LOJA P3, CASA P2                       |    1.786.338|     526|
|Nordeste   |LOJA P3, CASA P2, CASA P3              |    3.391.945|     509|
|Nordeste   |LOJA P3, CASA P3                       |    1.866.760|     539|
|Nordeste   |LOJA P2, CASA P1, CASA P2              |    2.190.366|     479|
|Nordeste   |LOJA P2, CASA P1, CASA P2, CASA P3     |    3.729.244|     469|
|Nordeste   |LOJA P2, CASA P1, CASA P3              |    2.057.558|     471|
|Nordeste   |LOJA P2, CASA P2                       |    1.952.018|     590|
|Nordeste   |LOJA P2, CASA P2, CASA P3              |    3.712.132|     572|
|Nordeste   |LOJA P2, CASA P3                       |    1.925.424|     591|
|Nordeste   |CASA P1, CASA P2                       |    3.073.952|     916|
|Nordeste   |CASA P1, CASA P2, CASA P3              |    5.285.558|     866|
|Nordeste   |CASA P1, CASA P3                       |    2.892.760|     877|
|Nordeste   |CASA P2                                |    2.764.238|    1278|
|Nordeste   |CASA P2, CASA P3                       |    5.463.724|    1169|
|Nordeste   |CASA P3                                |    2.864.178|    1284|
|Pampulha   |CASA P1, CASA P2                       |    1.222.658|     469|
|Pampulha   |CASA P1, CASA P3                       |    1.741.437|     461|
|Pampulha   |APARTAMENTO P3                         |    3.561.154|     584|
|Pampulha   |APARTAMENTO P3, CASA P3                |    5.155.680|     525|
|Pampulha   |CASA P4                                |    1.203.746|     779|
|Pampulha   |CASA P4, CASA P2                       |    1.598.688|     584|
|Pampulha   |CASA P4, CASA P2, CASA P3              |    3.961.874|     578|
|Pampulha   |CASA P4, CASA P3                       |    3.957.047|     762|
|Pampulha   |CASA P2                                |    1.398.200|    1076|
|Pampulha   |CASA P2, CASA P3                       |    4.299.415|     965|
|Pampulha   |CASA P3                                |    3.459.799|    1243|
|Oeste      |CASA P1, CASA P2                       |    1.266.423|     463|
|Oeste      |CASA P4, CASA P3                       |    1.734.297|     450|
|Oeste      |LOJA P3, CASA P2                       |    1.155.667|     461|
|Oeste      |LOJA P3, CASA P3                       |    1.567.255|     475|
|Oeste      |CASA P2                                |    1.499.333|     984|
|Oeste      |CASA P2, CASA P3                       |    3.477.191|     848|
|Oeste      |APARTAMENTO P3                         |    4.578.608|     600|
|Oeste      |APARTAMENTO P3, CASA P3                |    4.704.815|     472|
|Oeste      |CASA P3                                |    2.178.570|    1014|
|Centro-Sul |CASA P4, CASA P3                       |    1.492.756|     400|
|Centro-Sul |LOJA P3 OUTLIER                        |    1.634.912|     394|
|Centro-Sul |LOJA P4, LOJA P3                       |    1.083.460|     416|
|Centro-Sul |CASA P3, APARTAMENTO P3                |    5.074.013|     470|
|Centro-Sul |APARTAMENTO P4                         |    6.992.751|     510|
|Centro-Sul |APARTAMENTO P4, APARTAMENTO P3         |   10.416.269|     435|
|Centro-Sul |LOJA P3, APARTAMENTO P3                |    4.913.703|     453|
|Centro-Sul |APARTAMENTO P3                         |    5.914.413|     672|
