# Respostas

## Pergunta 1: Quais são as cracterísticas básicas das regiões imobiliárias de Belo Horizonte?

### Análise dos Gráficos

A análise do gráfico de coleta de lixo é importante, pois indiretamente revela a intensidade da atividade humana na região. Destam-se as regionais Centro-Sul e Oeste.
O perfil geral do tipo de imóvel destaca-se os apartamentos em todas as regionais, indicando um processo de verticalização na capital mineira.
Na grande maioria das regionais os imóveis se destinam à moradia residêncial, destaca-se a reginal Centro-Sul que possui uma grande quantidade de imóvies comerciais.
Na grande maioria das regionais os imóvies são de qualidade de acbamento média, destaca-se a regional Centro-Sul com uma grande quantidade de alta a média qualidade.

### Análise dos Algoritmos
#### FPMax
O algoritmo FPMax demonstra as regionais Barreiro, Nordeste, Norte, Oeste e Venda Nova, possuem no geral CEPs com os mesmos tipos de padrões. A forte presença de casas residênciais de padrão de acabamento variando de 1 a 3 e a presença de lotes vagos. Os imóveis em sua maioria são casas de uso residencial. Os CEPs em sua maioria contêm imóveis de acabamento P1 ao P2 e lotes vagos. O que indica um baixo índice de verticalização destas regionais. 

A regional Pampulha tem um padrão de imóveis semelhantes aos anteriores mas destaca-se imóveis com padrão de acabamento melhor, e um baixo índice de verticalização.

A regional Leste possui o maior número de itemsets demosntrando grande diversidade de tipos de imóveis e acabamento, ela apresenta imóveis do tipo apartamento o que indica uma tendência de verticalização ainda não totalmente concretizada pelo fato do item vim acompanhado de casas residênciais. Apresenta um forte comércio local com lojas variando o padrão de acabamento de 1 a 3.

A regional Noroeste desta-se a presença de comércio local e se assemelha à regional Leste. Porém seus CEP tendem a ter um padrão mais comum, a presença do itemset BARRACÃO P2 demonstra que este tipo de imóvel encontrase concentrado, diferenciando-se da regional Leste. Também possui baixo índice de verticalização demonstrando um carater misto único.

A regional Cento-Sul possui uma distribuição igualitária de imóveis por CEPs, sendo eles de bom padrão de acabamento e um intenso comercio segmentado em regiões sendo a qualidade dos imóveis comerciais também de boa qualidade. A concentração dos imóveis deve-se a estrutura urbana planejada do centro da capital mineira. Detaca-se, somente nesta regional, os apartamentos de padrão de acabamento 4.

#### OpusMiner
O objetivo do algoritmo é obter itemsets que tenham uma forte correlação independete do seu suporte. A análise demonstra que ele é muito útil para descrever os imóvies de alto padrão. Em todos as regionais foi verificado a nescessidade de vagas de garagem próxima aos imóveis comerciais, indicando a importância dos veículos para a dinâmica da cidade. Os imóveis comerciais de alto padrão de acabamento e de maiores áreas construídas tendem a ficarem no mesmo CEP. Nesta análise verifica o poder finaceiro da regional Centro-Sul, pois ela apresentou 82 CEPs com sala de alto padrão de acabamento acompanhados de vagas de garagem de alto acabamento, indicando que nesta regionl os grandes empreendimentos de alto padrão devem oferecer vagas de garagem com alta qualidade e espaço. A regional Norte apresenta um padrão em que os apartamentos de padrão 4 de acabamento de maior área construída ficam proximos aos de tamanho padrão de mesma qualidade.

#### FHMFreq
Ao cruzar a informação da área construída com o suporte tem uma análise mais detalhada da área construída média do itemset. A análise é bem semelhante ao algoritmo FPMax, mas neste caso foi verificado para as reginais, Barreiro, Nordeste, Norte, e Venda Nova a presença de comércio local o que dev-se a sua distância da regional Centro-Sul que possui os grandes centros comerciais.

A regional Oeste apresentou nesta análise uma grande quantidade de apartamentos de padrão de acabamento 3 totalizando mais de 4 Km² construídos o que diverge da análise anterior, que sugeriu uma baixa verticalização. Acredita-se que a forma de verticalização concentrou-se em prédios de muitos andares, ou seja de forma mais vertical do que horizontal.

A Pampulha destaca-se pelas casas de padrão de acabamento 4 totalizando 1.2 Km² em 779 CEPs.

A Regional Noroeste apresenta uma grande área construída destinada à galpões, o que pode indicar boas características ligadas ao setor da logística, como rodovias, avenidas e ruas amplas.

A Regional Leste mais uma vez apresentou um contraste muito alto o que ficou mais evidenciado pelos dois primeiros registros demonstrando a presença de apartamentos de padrão de acabamento 3 próximo à casas de padrão de acabamento 2 e 3. O baixo suporte do primeiro item desta análise pode indicar um grande potencial de verticalização sobre casas.

A Regional Centro-Sul foi a única que apresentou item com área construída muito acima do padrão foram as lojas de padrão de acabamento 3 e também apresentou o itemset com maior utilidade da capital os apartamentos de padrão de acabamento 3 e 4 totalizam nesta regional mais 10Km² de construção, demonstrando que a verticalização teve intensidade em andares quanto em número de prédios.

#### Algoritmo FHN
O objetivo desta análise e verifcar o impácto negativo que a presença de lotes vagos podem ter nas mesmas localidades que contém imóveis, para isto o valor da área construída do imóvel para lotes vagos recebeu o valor da negativo da área do terreno, e foi realizada uma comparação com os mesmos parâmetros e algoritmo sem os lotes vagos. Esta análise tem como objetivo verificar se a densidade de imóvies consntruídos. Foi verificado que nas Regionais Norte e Pampulha os lotes vagos estão distribuídos próximos aos lotes com construção o que indica uma baixa densidade de imóveis. A Regional Centro-Sul tem alta densidade de imóvies construídos. E as demais Regionais a distribuição de imóveis e lotes vagos tende a ser uniforme.

