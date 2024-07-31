# Algoritmos escolhidos
Como o objetivo do trabalho é caracterizar o espaço urbano, demos preferência aos algroritmos de representação compacta. 

## Base 1
Para analizar esta base o algoritmo FPMax foi utilizado para obter as representaçõe máximas de cada regional. Abaixo o resultado obtido utilizando o suporte mínimo de 40%. Em todoas as execuções nenhum imóvel com metragem fora do padrão foi encontrado.

## FPMax

|REGIONAL   |ITEMSET                     | SUPORTE|
|:----------|:---------------------------|-------:|
|Norte      |CASA P2, CASA P3, CASA P1   |     636|
|Norte      |LOTE VAGO                   |     766|
|Barreiro   |CASA P3, LOTE VAGO          |     624|
|Barreiro   |CASA P2, LOTE VAGO          |     628|
|Barreiro   |CASA P2, CASA P3, CASA P1   |     810|
|Leste      |LOJA P2                     |     401|
|Leste      |LOJA P3                     |     402|
|Leste      |CASA P2, BARRACÃO P2        |     409|
|Leste      |LOTE VAGO                   |     480|
|Leste      |CASA P2, CASA P3, CASA P1   |     466|
|Venda Nova |CASA P2, CASA P3, LOTE VAGO |     635|
|Venda Nova |CASA P2, CASA P3, CASA P1   |     896|
|Noroeste   |LOJA P3                     |     575|
|Noroeste   |CASA P3, LOJA P2            |     564|
|Noroeste   |CASA P2, LOJA P2            |     576|
|Noroeste   |CASA P2, CASA P3, CASA P1   |     631|
|Noroeste   |CASA P3, LOTE VAGO          |     564|
|Noroeste   |CASA P2, LOTE VAGO          |     572|
|Nordeste   |CASA P2, LOTE VAGO          |     703|
|Nordeste   |CASA P3, LOTE VAGO          |     723|
|Nordeste   |CASA P3, CASA P2, CASA P1   |     866|
|Pampulha   |CASA P3, CASA P4            |     762|
|Pampulha   |CASA P3, LOTE VAGO, CASA P2 |     658|
|Oeste      |LOTE VAGO                   |     907|
|Oeste      |CASA P3, CASA P2            |     848|
|Centro-Sul |LOTE VAGO                   |     616|
|Centro-Sul |LOJA P3                     |     668|
|Centro-Sul |APARTAMENTO P3              |     672|
|Centro-Sul |CASA P3                     |     694|
