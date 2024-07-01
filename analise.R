packs <- c("RSQLite", "tidyverse", "SDEFSR")
success <- suppressWarnings(sapply(packs, require, character.only = TRUE))
install.packages(names(success)[!success])
sapply(names(success)[!success], require, character.only = TRUE)

library(RSQLite)
library(tibble)
library(ggplot2)

source(file="R/le_banco.R")
source(file='R/gera_imagem.R')
source(file='R/gera_spmf.R')

resultado_utilidadade <- read_csv("Resultados/Utilidade.csv")
dados <- ler_banco_dados("imobiliario.db")
intervalo <- dados %>%
  group_by(REGIONAL, PADRAO_ACABAMENTO, TIPO_CONSTRUTIVO) %>%
  summarise(
    INF = quantile(AREA_CONSTRUCAO, .25) - 1.5 * IQR(AREA_CONSTRUCAO),
    SUP = quantile(AREA_CONSTRUCAO, .75) + 1.5 * IQR(AREA_CONSTRUCAO),
    .groups = 'drop'
)
intervalo$INF[intervalo$INF < 0] <- 0


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
  
  regional <- gsub(" ", "_", regional)
  executa_algoritmo("FPMax",
                    paste("SPMF/item_set/itemset_",regional,".txt", sep=""),
                    paste("SPMF/item_set/Resultado/FPMax/itemset_",regional,".txt", sep=""),
                    "0.4")
  executa_algoritmo("OPUS-Miner",
                    paste("SPMF/item_set/itemset_",regional,".txt", sep=""),
                    paste("SPMF/item_set/Resultado/OPUSMiner/itemset_",regional,".txt", sep=""),
                    "10 true true true true false")
  
  executa_algoritmo("FHMFreq",
                    paste("SPMF/utilidade/positiva/utilidade_",regional,".txt", sep=""),
                    paste("SPMF/utilidade/positiva/Resultado/FHMFreq/utilidade_",regional,".txt", sep=""),
                    "1000000 0.3")
  
  executa_algoritmo("FHN",
                    paste("SPMF/utilidade/negativa/utilidade_negativa_",regional,".txt", sep=""),
                    paste("SPMF/utilidade/negativa/Resultado/FHN_Negativo/utilidade_",regional,".txt", sep=""),
                    "1000000 0.3")

  executa_algoritmo("FHN",
                    paste("SPMF/utilidade/positiva/utilidade_",regional,".txt", sep=""),
                    paste("SPMF/utilidade/negativa/Resultado/FHN_Positivo/utilidade_",regional,".txt", sep=""),
                    "1000000 0.3")
  
}
