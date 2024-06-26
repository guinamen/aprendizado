# Trabalho de Aprendizado Descritivo
## Fazes

1. - [x] Coleta de Dados​
    1. - [x] Coleta de dados no ​[Portal de Dados abertos da PBH](https://ckan.pbh.gov.br/).
    2. - [x] Armazenagem dos dados em um banco de dados.​
    3. - [x] Normalização dos dados.​
    4. - [x] Ajustar dados faltantes.​
2. - [X] Fazer análise dos dados.​
3. - [X] Gerar arquivos no formato do SPMF.​
4. - [ ] Testar os algoritmos.​
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
- [x] Resutaldo: Banco de dados SQLite 

## [Metodologia GQM](gqm.md)
## [Análise](analise.md)
## [Gerar arquivos no formato do SPMF](spmf.md)
## [Algortmo FPMax (Itemset Maximais)](algoritmos.md)
## [Algortmo OpusMiner (Itemset com alta correlação estatística)](opusminer.md)
## [Algortmo OpusMiner (Itemset frequente de alta utilidade)](FHMFreq.md)
