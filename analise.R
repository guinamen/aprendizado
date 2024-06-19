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
  
  #Regionais são ordenadas pelo total da população da menor Norte até a maior Oeste
  imoveis$REGIONAL <- factor(imoveis$REGIONAL, ordered = TRUE, levels = c("Norte","Leste","Venda Nova","Pampulha","Noroeste","Nordeste","Barreiro","Centro-Sul","Oeste"))
  
  imoveis$FREQUENCIA_COLETA <- factor(imoveis$FREQUENCIA_COLETA, ordered = TRUE, levels = c("SEM COLETA", "COLETA ALTERNADA", "COLETA DIARIA"))
  imoveis$TIPO_CONSTRUTIVO <- as.factor(imoveis$TIPO_CONSTRUTIVO)
  imoveis$TIPO_OCUPACAO <- as.factor(imoveis$TIPO_OCUPACAO)
  imoveis$PADRAO_ACABAMENTO <- factor(imoveis$PADRAO_ACABAMENTO, ordered = TRUE, levels = c("TE", "P1", "P2", "P3", "P4", "P5"))
  imoveis$TIPO_LOGRADOURO <- as.factor(imoveis$TIPO_LOGRADOURO)
  imoveis$TIPOLOGIA <- as.factor(imoveis$TIPOLOGIA)
  return(imoveis)
}

tabela <- ler_banco_dados("imobiliario.db")

p <- tabela %>% 
  group_by(REGIONAL, FREQUENCIA_COLETA) %>%
  summarise(Total=n()) %>%
  ggplot(aes(fill=FREQUENCIA_COLETA, x=REGIONAL, y=Total)) +
  geom_bar(position="fill", stat="identity") +
  labs(x = "Regional",
       y="Porcentagem",
       title = "Coleta de lixo dos imóveis",
       subtitle = "Porcentagem por Regional",
       caption = "Fonte: Portal de Dados Abertos da PBH",
       tag="Figura 1",
       fill = NULL) +
  theme(legend.position="top", axis.text.y = element_blank(), axis.ticks.y = element_blank() )
png("coleta.png", width = 1029, height = 551,type='cairo')
print(p)
dev.off()

p <- tabela %>% 
  group_by(REGIONAL, TIPO_CONSTRUTIVO) %>%
  summarise(Total=n()) %>%
  ggplot(aes(fill=TIPO_CONSTRUTIVO, x=REGIONAL, y=Total)) +
  geom_bar(position="fill", stat="identity") +
  labs(x = "Regional",
       y="Porcentagem",
       title = "Perfil dos imóveis",
       subtitle = "Porcentagem por Regional",
       caption = "Fonte: Portal de Dados Abertos da PBH",
       tag="Figura 2",
       fill = NULL) +
  theme(legend.position="top", axis.text.y = element_blank(), axis.ticks.y = element_blank() )
png("perfil.png", width = 1029, height = 551,type='cairo')
print(p)
dev.off()

p <- tabela %>% 
  group_by(REGIONAL, TIPO_OCUPACAO) %>%
  summarise(Total=n()) %>%
  ggplot(aes(fill=TIPO_OCUPACAO, x=REGIONAL, y=Total)) +
  geom_bar(position="fill", stat="identity") +
  labs(x = "Regional",
       y="Porcentagem",
       title = "Perfil da ocupação",
       subtitle = "Porcentagem por Regional",
       caption = "Fonte: Portal de Dados Abertos da PBH",
       tag="Figura 3",
       fill = NULL) +
  theme(legend.position="top", axis.text.y = element_blank(), axis.ticks.y = element_blank() )
png("ocupacao.png", width = 1029, height = 551,type='cairo')
print(p)
dev.off()
