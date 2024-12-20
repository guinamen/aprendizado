# Trabalho de Aprendizado Descritivo
## Fazes

1. - [x] Coleta de Dados​
    1. - [x] Coleta de dados no ​[Portal de Dados abertos da PBH](https://ckan.pbh.gov.br/).
    2. - [x] Armazenagem dos dados em um banco de dados.​
    3. - [x] Normalização dos dados.​
    4. - [x] Ajustar dados faltantes.​
2. - [X] Fazer análise dos dados.​
3. - [X] Gerar arquivos no formato do SPMF.​
4. - [X] Testar os algoritmos.​
5. - [X] Responder as perguntas.

### Coleta de Dados​
- [x] Extraídos os arquivos de imóveis das regionais no ​[Portal de Dados abertos da PBH](https://ckan.pbh.gov.br/).
    - [x] Extraídos os dados do Cadastro Imobiliário da Secretaria Municipal de Fazenda (SMFA)
    - [x] Dados de cada regional da carga de 03/06/2024 
    - [x] As colunas com dados nulos foram corrigidas:​
       * Área Construída. Lotes vagos que estavam nulos foram alterados para 0.​
       * Meio Fio, Pavimentação e Iluminação. Foram alterados por fotos de satélite do Google Maps.​
       * Áreas de construção e de terreno nulas foram substituídas pela média da vizinhança.​
    - [x] Colunas não referentes ás características do imóvel foram removidas.​
    - [x] Removido um registro sem nenhum dado de endereço.​
    - [x] Removidos registro referentes a endereços fora de Belo Horizonte.​
- [x] Gerar Banco de dados SQLite
- [X] Coletar outliers via [GritBot](https://www.rulequest.com/gritbot-info.html), *GritBot is an automatic tool that tries to find anomalies in data as a precursor to data mining.*
- [X] Descobrir os centroides geoespaciais dos terrenos, latitude e longitude que melhor representa o imóvel.


### Análise dos Dados
- [x] Gerar gráfico de barras das características imobiliárias.
- [X] Gerar info mapas com os dados geográficos coletados.Itemset de alta utilidade podendo ter valores negativos
- [X] Gerar grafo de fronteiras das regionais.

### Gerar arquivos no formato SPMF e Cortana
- [x] Fazer agrupamento das informações por CEP.
- [X] Gerar código em R.
- [X] Gerar preambulo do arquivo contendo os nomes dos itens.
- [X] Gerar banco de dados com os itemsets.
- [X] Gerar banco de dados com as utilidades.
- [X] Gerar banco de dados com as utilidades negativas.
- [X] Gerar banco de dados para o Cortana.

### Testar os algoritmos
- [x] Algoritmo FPMAX
- [X] Algoritmo OpusMiner
- [X] Algoritmo FHMFreq
- [X] Algoritmo FHN
- [X] Cortana - Subgrupo

### Responder as perguntas
- [X] Pergunta 1
- [X] Pergunta 2
- [X] Pergunta 3

## [Metodologia GQM](gqm.md)
## [Análise](analise.md)
## [Gerar arquivos no formato do SPMF](spmf.md)
## Algoritmos
- [Algoritmo FPMax (Itemset Maximais)](algoritmos.md)
- [Algoritmo OpusMiner (Itemset com alta correlação estatística)](opusminer.md)
- [Algoritmo FHMFreq (Itemset frequente de alta utilidade)](FHMFreq.md)
- [Algoritmo FHN (Itemset de alta utilidade podendo ter valores negativos)](FHN.md)
- [Algoritmo MFFI-Miner (Fuzzy Itemset de alta frequencia)](fuzzy.md)
- [Algoritmo DBSCAN (Density-based spatial clustering of applications with noise)](cluster.md)
- [Cortana (Busca por subgrupos - Apartamento)](subgrupo.md)
- [Cortana (Busca por subgrupos - Imóveis de Alto Padrão)](subgrupo_p5.md)
- [Descrição do ChatGPT](chat-gpt.md)
## [Respostas](respostas.md)
