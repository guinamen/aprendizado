# Análise

## Característica da Base de Dados
Barreiro|Centro-Sul|Leste|Nordeste|Noroeste|Norte|Oeste|Pampulha|Venda Nova | **Total**
--|--|--|--|--|--|--|--|--|--
65390|220991|67561|87187|81741|51240|124864|108035|69808| **876817**

### Distribuição da Área Construída. 

Ao analisar a área construída dos imóveis, foi constado que, ela varia muito em função dos tipos de imóveis. Sendo observado a existência de muitos valores fora do padrão (outliers). Sendo assim, uma nova dimensão binária foi adicionada aos dados, classificando-os em outliers caso estejam fora do intervalo I definido abaixo. Sendo IQR o valor interquartil e qn o valor do enésimo quartil.
I=[q0.25−1.5⋅IQR; q0.75+1.5⋅IQR]
Ao todo foram classficados 42.849 imóveis como sendo outiliers e 833.968 não.

## Características das Regionais
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/master/Imagens/area.png)
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/master/Imagens/populacao.png)
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/master/Imagens/area_construida.png)
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/master/Imagens/grafo.png)

## Características dos Imóveis

![alt Perfil da Coleta de Lixo por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/master/Imagens/coleta.png)
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/master/Imagens/perfil.png)
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/master/Imagens/ocupacao.png)
![alt Perfil por Regionais](https://raw.githubusercontent.com/guinamen/aprendizado/master/Imagens/acabamento.png)
