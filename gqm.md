# Metodologia GQM
## Meta
Verifica se as técnicas de aprendizado descritivo são capazes de descrever as características imobiliárias das Regiões de Belo Horizonte​.

## Questionamentos​
1. Quais são as cracterísticas básicas das regiões imobiliárias de Belo Horizonte?
2. Quais informações os algoritmos de aprendizado descritivo agregaram na análise?
3. Qual é a qualidade da informação gerada pela associação do ChatGPT e os resultados dos algoritmos descritivos?

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
