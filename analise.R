packs <- c("RSQLite", "tidyverse")
success <- suppressWarnings(sapply(packs, require, character.only = TRUE))
install.packages(names(success)[!success])
sapply(names(success)[!success], require, character.only = TRUE)

library(RSQLite)
library(tibble)
library(ggplot2)

source(file="R/le_banco.R")
source(file='R/gera_imagem.R')
source(file='R/gera_spmf.R')

resultado_utilidadade <- read_csv("Resultados/Utilidade.csv", col_names = c('regional', 'itemset', 'utilidade', 'suporte'))
dados <- ler_banco_dados("imobiliario.db")
intervalo <- dados %>%
  group_by(REGIONAL, PADRAO_ACABAMENTO, TIPO_CONSTRUTIVO) %>%
  summarise(
    INF = boxplot.stats(AREA_CONSTRUCAO)$con[1],
    SUP = boxplot.stats(AREA_CONSTRUCAO)$con[2],
    .groups = 'drop'
)


gera_imagens(dados, resultado_utilidadade)
tipos <- dados %>%
  distinct(TIPO_CONSTRUTIVO, PADRAO_ACABAMENTO, OUTLIER) %>%
  arrange(TIPO_CONSTRUTIVO)
tipos$INDICE = 1:dim(tipos)[1]


for (regional in levels(dados$REGIONAL)) {
  arquivo <- paste("SPMF/utilidade/positiva/utilidade_", regional, '.txt', sep = "")
  gera_preambulo(arquivo,tipos)
  utilidade <- gera_utilidade_positiva(regional, tipos, dados)
  write.table(utilidade,
              file = arquivo,
              sep = ":",
              col.names = FALSE,
              row.names = FALSE,
              quote = FALSE,
              append=TRUE)
}

for (regional in levels(dados$REGIONAL)) {
  arquivo <- paste("SPMF/item_set/itemset_", regional, '.txt', sep = "")
  gera_preambulo(arquivo,tipos)
  utilidade <- gera_item_set(regional, tipos, dados) %>%
    select(ITEMSET)
  write.table(utilidade,
              file = arquivo,
              sep = ":",
              col.names = FALSE,
              row.names = FALSE,
              quote = FALSE,
              append=TRUE)
}

for (regional in levels(dados$REGIONAL)) {
  arquivo <- paste("SPMF/utilidade/negativa/utilidade_negativa_", regional, '.txt', sep = "")
  gera_preambulo(arquivo,tipos)
  utilidade <- gera_utilidade_negativa(regional, tipos, dados)
  write.table(utilidade,
              file = arquivo,
              sep = ":",
              col.names = FALSE,
              row.names = FALSE,
              quote = FALSE,
              append=TRUE)
}
