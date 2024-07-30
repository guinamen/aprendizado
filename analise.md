# Análise

## Característica da Base de Dados

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

### Número de registros

Barreiro|Centro-Sul|Leste|Nordeste|Noroeste|Norte|Oeste|Pampulha|Venda Nova | **Total**
--|--|--|--|--|--|--|--|--|--
65390|220991|67561|87187|81741|51240|124864|108035|69808| **876817**

### Distribuição da Área Construída. 

Ao analisar a área construída dos imóveis, foi constado que, ela varia muito em função dos tipos de imóveis. Sendo observado a existência de muitos valores fora do padrão (outliers). Sendo assim, uma nova dimensão binária foi adicionada aos dados, classificando-os em outliers caso estejam fora do intervalo I definido abaixo. Sendo IQR o valor interquartil e qn o valor do enésimo quartil.
I=[q0.25−1.5⋅IQR; q0.75+1.5⋅IQR]
Ao todo foram classficados 42.849 imóveis como sendo outiliers e 833.968 não.

## Características das Regionais
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/main/Imagens/area.png)
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/main/Imagens/populacao.png)
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/main/Imagens/area_construida.png)
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/main/Imagens/grafo.png)

## Características dos Imóveis

![alt Perfil da Coleta de Lixo por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/main/Imagens/coleta.png)
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/main/Imagens/perfil.png)
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/main/Imagens/ocupacao.png)
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/main/Imagens/acabamento.png)
