# Trabalho de Aprendizado Descritivo

## Meta
Verifica se as técnicas de aprendizado descritivo são capazes de descrever as características imobiliárias das Regiões de Belo Horizonte​.

## Questionamentos​
1. Qual a melhor forma de se avaliar as características imobiliárias de Belo Horizonte?​
2. Qual a melhor técnica de aprendizado descritivo para avaliar as características das regiões de Belo Horizonte?​
3. Quais características cada região possui?​

## Métricas​
Nome| Coluna| Tipo| Descrição
--|--|--|--|
Regional| REGIONAL| Texto| Nome da Regional do imóvel
Coleta de Lixo| FREQUENCIA_COLETA| Texto| Frequncia da coleta de lixo
Meio Fio| IND_MEIO_FIO| Booleana| Se o imóvel possui via com meio fio
Pavimentação| IND_PAVIMENTACAO| Booleana| Se o imóvel possui via com pavimentação
Arborização| IND_ARBORIZACAO| Booleana| Se o imóvel possui via com arborização
Galeria Pluvial| IND_GALERIA_PLUVIAL| Booleana| Se o imóvel possui via com galeria pluvial
Iluminação| IND_ILUMINACAO_PUBLICA| Booleana| Se o imóvel possui via com iluminação pública
Esgoto| IND_REDE_ESGOTO| Booleana| Se o imóvel possui rede de esgoto
Água Encanda| IND_REDE_AGUA| Booleana| Se o imóvel possui água encanada
Telefone| IND_REDE_TELEFONICA| Booleana| Se o imóvel possui rede telefônica
Área do Terreno| AREA_TERRENO| Numérico| Área do terreno em m²
Área Construída| AREA_CONSTRUCAO| Numérico| Área construída em m²
Tipo Construtivo| TIPO_CONSTRUTIVO| Texto| Unidade construtiva de acordo com o tipo construtivo, como casa, barracão ou apartamento.
Tipo Ocupação| TIPO_OCUPACAO| Texto| Especifica o tipo de ocupação: não residencial, residencial e territorial
Padrão de Acabamento| PADRAO_ACABAMENTO| Texto| Nível de padrão de acabamento do mais simples P1 ao P5 mais luxuoso
Quantidade de Economias| QUANTIDADE_ECONOMIAS| Inteiro| Unidade de núcleo familiar, atividade econômica ou institucional, distintas em um mesmo índice cadastral.
Porção da unidade construtiva| FRACAO_IDEAL| Numérico| Porção da unidade construtiva correspondente a um único índice cadastral.
Tipo Logradouro| TIPO_LOGRADOURO| Texto| Tipo do logradouro, rua, avenida e etc
Nome do Logradouro| NOME_LOGRADOURO| Texto| Nome do logradouro
Número do Imóvel| NUMERO_IMOVEL| Inteiro| Número do imóvel
CEP| CEP| Inteiro| Código dos correios
Tipologia| TIPOLOGIA| Texto| Tipo de logradouro como rua, avenida, dentre outros
Geometria| GEOMETRIA| Polígono| Polígono do terreno

## Fazes

1. - [x] Coleta de Dados​
    1. - [x] Coleta de dados no ​[Portal de Dados abertos da PBH](https://ckan.pbh.gov.br/).
    2. - [x] Armazenagem dos dados em um banco de dados.​
    3. - [x] Normalização dos dados.​
    4. - [x] Ajustar dados faltantes.​
2. - [ ] Fazer análise dos dados.​
3. - [ ] Gerar arquivos no formato do SPMF.​
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

### Análise
#### Total de Registros
Barreiro|Centro-Sul|Leste|Nordeste|Noroeste|Norte|Oeste|Pampulha|Venda Nova 
--|--|--|--|--|--|--|--|--
65390|220991|67561|87187|81741|51240|124864|108035|69808

#### Características dos Imóveis

||Barreiro|Centro-Sul|Leste|Nordeste|Noroeste|Norte|Oeste|Pampulha|Venda Nova| **Total**
|--|--|--|--|--|--|--|--|--|--|--
|APARTAMENTO|19755| 112012| 31344| 38793| 35116| 18536| 77194| 55735| 20434| **876817**

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

||Barreiro|Centro-Sul|Leste|Nordeste|Noroeste|Norte|Oeste|Pampulha|Venda Nova
|--|--|--|--|--|--|--|--|--|--
|NAO RESIDENCIAL|7773|88132|7809|10195|11405|4901|20668|11801|7446
|RESIDENCIAL|54335|129925|57575|72892|68191|43564|100451|89558|59094
|TERRITORIAL|3282|2932|2177|4100|2145|2775|3745|6676|3268
