# Respostas

## Pergunta 1: Quais são as características básicas das regiões imobiliárias de Belo Horizonte?**

**Análise dos Gráficos**

A análise do gráfico de coleta de lixo é importante, pois revela indiretamente a intensidade da atividade humana na região. Destacam-se as regionais Centro-Sul e Oeste. O perfil geral dos tipos de imóveis mostra a predominância de apartamentos em todas as regionais, indicando um processo de verticalização na capital mineira. Na maioria das regionais, os imóveis são destinados à moradia residencial, com a regional Centro-Sul apresentando uma grande quantidade de imóveis comerciais. A qualidade dos imóveis varia, sendo predominantemente de acabamento médio, com destaque para a regional Centro-Sul que possui uma grande quantidade de imóveis de alta a média qualidade.

**Análise dos Algoritmos**

**FPMax**
O algoritmo FPMax revela que as regionais Barreiro, Nordeste, Norte, Oeste e Venda Nova possuem CEPs com padrões semelhantes. Nessas regiões, há uma forte presença de casas residenciais com acabamentos variando de 1 a 3, além de muitos lotes vagos, indicando um baixo índice de verticalização.

A regional Pampulha apresenta um padrão de imóveis semelhantes aos das regiões mencionadas, porém com um melhor acabamento e ainda um baixo índice de verticalização.

A regional Leste possui a maior diversidade de tipos de imóveis e acabamentos, incluindo apartamentos, o que sugere uma tendência de verticalização ainda não completamente concretizada. Além disso, a região tem um comércio local significativo, com lojas variando de acabamento 1 a 3.

A regional Noroeste se assemelha à regional Leste, com forte presença de comércio local. Contudo, seus CEPs apresentam um padrão mais comum, com destaque para a concentração de barracões de acabamento P2, diferenciando-se da regional Leste. A Noroeste também possui um baixo índice de verticalização, mostrando um caráter misto único.

A regional Centro-Sul possui uma distribuição equilibrada de imóveis por CEPs, com bom padrão de acabamento e um comércio segmentado. Destacam-se nesta regional os apartamentos de acabamento 4, o que é exclusivo dessa área.

**OpusMiner**
O objetivo do algoritmo é obter itemsets com forte correlação, independente do suporte. Ele é útil para descrever imóveis de alto padrão. Em todas as regionais foi observada a necessidade de vagas de garagem próximas aos imóveis comerciais, indicando a importância dos veículos na dinâmica da cidade. Imóveis comerciais de alto padrão tendem a estar no mesmo CEP. A análise destaca o poder financeiro da regional Centro-Sul, que apresentou 82 CEPs com salas de alto padrão de acabamento acompanhadas de vagas de garagem de alta qualidade. A regional Norte apresenta apartamentos de acabamento 4 e maior área construída próximos a imóveis de padrão semelhante.

**FHMFreq**
Ao cruzar a informação da área construída com o suporte, obtém-se uma análise detalhada da área construída média dos itemsets. A análise é semelhante ao algoritmo FPMax, mas mostra a presença de comércio local nas regionais Barreiro, Nordeste, Norte e Venda Nova, devido à distância da regional Centro-Sul, que possui grandes centros comerciais.

A regional Oeste apresenta uma grande quantidade de apartamentos de acabamento 3, totalizando mais de 4 km² construídos, divergindo da análise anterior que sugeriu baixa verticalização. Acredita-se que a verticalização se concentrou em prédios de muitos andares.

A regional Pampulha destaca-se por suas casas de acabamento 4, totalizando 1,2 km² em 779 CEPs.

A regional Noroeste possui uma grande área construída destinada a galpões, indicando boas características para o setor logístico, como rodovias e avenidas amplas.

A regional Leste apresenta um alto contraste, evidenciado pelos registros de apartamentos de acabamento 3 próximos a casas de acabamento 2 e 3. O baixo suporte do primeiro item pode indicar um grande potencial de verticalização sobre casas.

A regional Centro-Sul foi a única a apresentar itens com área construída muito acima do padrão, especialmente lojas de acabamento 3 e apartamentos de acabamento 3 e 4, totalizando mais de 10 km² construídos, demonstrando intensa verticalização.

**Algoritmo FHN**
O objetivo desta análise é verificar o impacto negativo da presença de lotes vagos nas localidades com imóveis. Para isso, a área construída dos imóveis em lotes vagos recebeu valor negativo da área do terreno, sendo comparada com parâmetros e algoritmos sem os lotes vagos. A análise mostrou que nas regionais Norte e Pampulha, os lotes vagos estão distribuídos próximos aos lotes com construção, indicando baixa densidade de imóveis. A regional Centro-Sul possui alta densidade de imóveis construídos, enquanto nas demais regionais, a distribuição de imóveis e lotes vagos tende a ser uniforme.
