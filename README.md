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
5. - [ ] Responder as perguntas.

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
- [X] Selecionar outliers via [GritBot](https://www.rulequest.com/gritbot-info.html), * GritBot is an automatic tool that tries to find anomalies in data as a precursor to data mining. *
- [x] Resutaldo: Banco de dados SQLite

### Análise dos Dados
- [x] Gerar gráfico de barras das características imobiliárias.
- [X] Gerar info mapas com os dados geográficos coletados.
- [X] Gerar grafo de fronteiras das regionais.

### Gerar arquivos no formato SPMF
- [x] Fazer agrupamento das informações por CEP.
- [X] Gerar código em R.
- [X] Gerar preambulo do arquivo contendo os nomes dos itens.
- [X] Gerar banco de dados com os itemsets.
- [X] Gerar banco de dados com as utilidades.
- [X] Gerar banco de dados com as utilidades negativas.

### Testar os algoritmos
- [x] Algoritmo FPMAX
- [X] Algoritmo OpusMiner
- [X] Algoritmo FHMFreq
- [X] Algoritmo FHN

### Responder as perguntas
- [ ] Pergunta 1
- [ ] Pergunta 2
- [ ] Pergunta 3

## [Metodologia GQM](gqm.md)
## [Análise](analise.md)
## [Gerar arquivos no formato do SPMF](spmf.md)
## Algoritmos
- [Algoritmo FPMax (Itemset Maximais)](algoritmos.md)
- [Algoritmo OpusMiner (Itemset com alta correlação estatística)](opusminer.md)
- [Algoritmo FHMFreq (Itemset frequente de alta utilidade)](FHMFreq.md)
- [Algoritmo FHN (Itemset de alta utilidade podendo ter valores negativos)](FHN.md)
