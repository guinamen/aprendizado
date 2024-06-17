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

1. Coleta de Dados​
    1. Coleta de dados no Portal de Dados Abertos da PBH.​
    2. Armazenagem dos dados em um banco de dados.​
    3. Normalização dos dados.​
    4. Ajustar dados faltantes.​
2. Fazer análise dos dados.​
3. Gerar arquivos no formato do SPMF.​
4. Testar os algoritmos.​
5. Responder as perguntas.

### Coleta de Dados​
1. Extraídos os arquivos de imóveis das regionais no Portal de Dados abertos da PBH.​
    * As colunas com dados nulos foram corrigidas:​
       * Área Construída. Lotes vagos que estavam nulos foram alterados para 0.​
       * Meio Fio, Pavimentação e Iluminação. Foram alterados por fotos de satélite do Google Maps.​
       * Áreas de construção e de terreno nulas foram substituídas pela média da vizinhança.​
    * Colunas não referentes ás características do imóvel foram removidas.​
    * Removido um registro sem nenhum dado de endereço.​
    * Removidos registro referentes a endereços fora de Belo Horizonte.​

​
