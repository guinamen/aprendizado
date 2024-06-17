packs <- c("RSQLite", "tidyverse")
success <- suppressWarnings(sapply(packs, require, character.only = TRUE))
install.packages(names(success)[!success])
sapply(names(success)[!success], require, character.only = TRUE)

library(RSQLite)
library(tibble)
library(ggplot2)

ler_banco_dados <- function(arquivo) {
  con <- dbConnect(drv=RSQLite::SQLite(), dbname=arquivo)
  imoveis <- as_tibble(dbReadTable(con, "imovel"))
  dbDisconnect(con)
  rm(con)
  
  imoveis$IND_MEIO_FIO <- ifelse(imoveis$IND_MEIO_FIO == 'SIM', TRUE, FALSE)
  imoveis$IND_PAVIMENTACAO <- ifelse(imoveis$IND_PAVIMENTACAO == 'SIM', TRUE, FALSE)
  imoveis$IND_ARBORIZACAO <- ifelse(imoveis$IND_ARBORIZACAO == 'SIM', TRUE, FALSE)
  imoveis$IND_GALERIA_PLUVIAL <- ifelse(imoveis$IND_GALERIA_PLUVIAL == 'SIM', TRUE, FALSE)
  imoveis$IND_ILUMINACAO_PUBLICA <- ifelse(imoveis$IND_ILUMINACAO_PUBLICA == 'SIM', TRUE, FALSE)
  imoveis$IND_REDE_ESGOTO <- ifelse(imoveis$IND_REDE_ESGOTO == 'SIM', TRUE, FALSE)
  imoveis$IND_REDE_AGUA <- ifelse(imoveis$IND_REDE_AGUA == 'SIM', TRUE, FALSE)
  imoveis$IND_REDE_TELEFONICA <- ifelse(imoveis$IND_REDE_TELEFONICA == 'SIM', TRUE, FALSE)
  
  imoveis$REGIONAL <- as.factor(imoveis$REGIONAL)
  imoveis$FREQUENCIA_COLETA <- as.factor(imoveis$FREQUENCIA_COLETA)
  imoveis$TIPO_CONSTRUTIVO <- as.factor(imoveis$TIPO_CONSTRUTIVO)
  imoveis$TIPO_OCUPACAO <- as.factor(imoveis$TIPO_OCUPACAO)
  imoveis$PADRAO_ACABAMENTO <- factor(imoveis$PADRAO_ACABAMENTO, ordered = TRUE, levels = c("TE", "P1", "P2", "P3", "P4", "P5"))
  imoveis$TIPO_LOGRADOURO <- as.factor(imoveis$TIPO_LOGRADOURO)
  imoveis$TIPOLOGIA <- as.factor(imoveis$TIPOLOGIA)
  return(imoveis)
}

tabela <- ler_banco_dados("imobiliario.db")
