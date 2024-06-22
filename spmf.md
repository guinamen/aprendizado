# Geração dos arquivos

## Transações 

Para analisar o espaço urbano de Belo Horizonte através dos algoritmos de mineração de itemsets frequentes, inicialmente deve-se escolher uma forma de agrupar os itens em transações. Para esse estudo foi utilizado o agrupador do CEP, que é o código postal dos Correios do Brasil. Ele é utilizado para facilitar o encaminhamento e a entrega das correspondências aos destinatários. O código está relacionado indiretamente pelo uso e ocupação do espaço urbano, pois quanto mais correspondências um local possui, mais o logradouro terá CEPs distintos. Por exemplo, condomínios muito grandes possuem um código próprio. Ele também possui a vantagem de estar relacionado ao bairro, pois grandes avenidas ou ruas podem estar em bairros diferentes e sendo assim possuem códigos distintos para cada bairro. 

A base de dados possui localidades que não têm CEP (valor do campo igual a zero), nestes casos o agrupamento utilizado foi o nome e tipo do logradouro e o resultado adicionados ao arquivo de itemsets.

## Itemset 

Para definir o conjunto dos itens, inicialmente, foi utilizado o produto cartesiano entre os valores das colunas de qualidade do acabamento do imóvel, o tipo construtivo e se a área construída é um outlier, totalizando 101 itens. Os tipos construtivos possuem a informação do uso do imóvel sendo residencial ou não, sendo assim não há necessidade de utilizar a coluna do tipo de ocupação do imóvel. 

## Utilidade 

Os imóveis do espaço urbano podem variar muito em função da área construída, não somente pelos tipos e pela qualidade de acabamento. Como a área é um valor numérico em metros quadrados, ela foi adotada como valor e utilidade. O problema é que existem terrenos em que a área construída é zero. Para tal será feita duas abordagens, uma em que os terrenos sem construção são removidos da análise dos algoritmos, e uma abordagem em que será utilizada a área do terreno sem imóvel como uma utilidade negativa. Como o objetivo é caracterizar as regiões geográficas pelo uso e ocupação faz sentido um terreno sem construções ter uma utilidade negativa.   
