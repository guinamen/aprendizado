packs <- c("RSQLite", "tidyverse", "SDEFSR", "sf")
success <- suppressWarnings(sapply(packs, require, character.only = TRUE))
install.packages(names(success)[!success])
sapply(names(success)[!success], require, character.only = TRUE)

library(RSQLite)
library(tibble)
library(ggplot2)
library(sf)

source(file="R/le_banco.R")
source(file='R/gera_imagem.R')
source(file='R/gera_spmf.R')

resultado_utilidadade <- read_csv("Resultados/Utilidade.csv")
dados <- ler_banco_dados("imobiliario.db")
if(FALSE) {
  # Calcula o centroide geoespacial.
  # Os dados já estão no banco não é necessário calcular.
  x <- st_as_sf(dados, wkt = 'GEOMETRIA')
  x <- cbind(x, st_coordinates(st_centroid(x$GEOMETRIA)))
  dados$Y = x$Y
  dados$X = x$X
  
  #Calcula os valores para detectar imóveis com área de construção muito fora do padrão.
  # Os dados já estão no banco não é necessário calcular.
  intervalo <- dados %>%
    group_by(REGIONAL, PADRAO_ACABAMENTO, TIPO_CONSTRUTIVO) %>%
    summarise(
      INF = quantile(AREA_CONSTRUCAO, .25) - 1.5 * IQR(AREA_CONSTRUCAO),
      SUP = quantile(AREA_CONSTRUCAO, .75) + 1.5 * IQR(AREA_CONSTRUCAO),
      .groups = 'drop'
  )
  intervalo$INF[intervalo$INF < 0] <- 0
}

gera_imagens(dados, resultado_utilidadade)
tipos <- dados %>%
  distinct(TIPO_CONSTRUTIVO, PADRAO_ACABAMENTO, OUTLIER) %>%
  arrange(TIPO_CONSTRUTIVO)
tipos$INDICE = 1:dim(tipos)[1]

for (regional in levels(dados$REGIONAL)) {
  
  regional <- gsub(" ", "_", regional)
  arquivo_utilidade <- paste("SPMF/utilidade/positiva/utilidade_", regional, '.txt', sep = "")
  arquivo_item_set <- paste("SPMF/item_set/itemset_", regional, '.txt', sep = "")
  arquivo_utilidade_neg <- paste("SPMF/utilidade/negativa/utilidade_negativa_", regional, '.txt', sep = "")
  if (!file.exists(arquivo_utilidade)) {
    grava_arquivo_spmf(arquivo_utilidade, tipos, gera_utilidade_positiva(regional, tipos, dados))
  }
  if (!file.exists(arquivo_item_set)) {
    grava_arquivo_spmf(arquivo_item_set, tipos, gera_item_set(regional, tipos, dados) %>% select(ITEMSET))
  }
  if (!file.exists(arquivo_utilidade_neg)) {
    grava_arquivo_spmf(arquivo_utilidade_neg, tipos, gera_utilidade_negativa(regional, tipos, dados))
  }
  
  if (!file.exists(paste("SPMF/item_set/Resultado/FPMax/itemset_",regional,".txt", sep=""))) {
    executa_algoritmo("FPMax",
                      paste("SPMF/item_set/itemset_",regional,".txt", sep=""),
                      paste("SPMF/item_set/Resultado/FPMax/itemset_",regional,".txt", sep=""),
                      "0.4")
  }
  if (!file.exists(paste("SPMF/item_set/Resultado/OPUSMiner/itemset_",regional,".txt", sep=""))) {
    executa_algoritmo("OPUS-Miner",
                      paste("SPMF/item_set/itemset_",regional,".txt", sep=""),
                      paste("SPMF/item_set/Resultado/OPUSMiner/itemset_",regional,".txt", sep=""),
                      "10 true true true true false")
  }
  if (!file.exists(paste("SPMF/utilidade/positiva/Resultado/FHMFreq/utilidade_",regional,".txt", sep=""))) {
    executa_algoritmo("FHMFreq",
                      paste("SPMF/utilidade/positiva/utilidade_",regional,".txt", sep=""),
                      paste("SPMF/utilidade/positiva/Resultado/FHMFreq/utilidade_",regional,".txt", sep=""),
                      "1000000 0.3")
  }
  if (!file.exists(paste("SPMF/utilidade/negativa/Resultado/FHN_Negativo/utilidade_",regional,".txt", sep=""))) {
    executa_algoritmo("FHN",
                      paste("SPMF/utilidade/negativa/utilidade_negativa_",regional,".txt", sep=""),
                      paste("SPMF/utilidade/negativa/Resultado/FHN_Negativo/utilidade_",regional,".txt", sep=""),
                      "1000000 0.3")
  }
  if (!file.exists(paste("SPMF/utilidade/negativa/Resultado/FHN_Positivo/utilidade_",regional,".txt", sep=""))) {
    executa_algoritmo("FHN",
                      paste("SPMF/utilidade/positiva/utilidade_",regional,".txt", sep=""),
                      paste("SPMF/utilidade/negativa/Resultado/FHN_Positivo/utilidade_",regional,".txt", sep=""),
                      "1000000 0.3")
  }
  
}

sdefsrDF <- SDEFSR_DatasetFromDataFrame(
  as.data.frame(dados %>%
                  filter(REGIONAL == "Centro-Sul") %>%
                  select(FREQUENCIA_COLETA,
                         #IND_MEIO_FIO,
                         #IND_PAVIMENTACAO,
                         #IND_ARBORIZACAO,
                         #IND_GALERIA_PLUVIAL,
                         #IND_ILUMINACAO_PUBLICA,
                         #IND_REDE_ESGOTO,
                         #IND_REDE_AGUA,
                         #IND_REDE_TELEFONICA,
                         #AREA_TERRENO,
                         #AREA_CONSTRUCAO,
                         TIPO_CONSTRUTIVO,
                         #ZONA_HOMOGENIA,
                         #QUANTIDADE_ECONOMIAS,
                         #TIPO_OCUPACAO,
                         #FRACAO_IDEAL,
                         X,
                         Y,
                         #TIPO_LOGRADOURO,
                         PADRAO_ACABAMENTO) %>%
                  #mutate(IND_MEIO_FIO = as.character(IND_MEIO_FIO),
                  #       IND_PAVIMENTACAO = as.character(IND_PAVIMENTACAO),
                  #       IND_ARBORIZACAO = as.character(IND_ARBORIZACAO),
                  #       IND_GALERIA_PLUVIAL = as.character(IND_GALERIA_PLUVIAL),
                  #       IND_ILUMINACAO_PUBLICA = as.character(IND_ILUMINACAO_PUBLICA),
                  #       IND_REDE_ESGOTO = as.character(IND_REDE_ESGOTO),
                  #       IND_REDE_AGUA = as.character(IND_REDE_AGUA),
                  #       IND_REDE_TELEFONICA = as.character(IND_REDE_TELEFONICA)) %>%
                  filter(complete.cases(.)) ), "Centro-Sul")