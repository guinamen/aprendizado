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
  imoveis$TIPO_CONSTRUTIVO <- factor(imoveis$TIPO_CONSTRUTIVO, ordered = TRUE, levels = c("APARTAMENTO","APARTAMENTO COM OCUPACAO NAO RESIDENCIAL","BARRACAO","BARRACAO COM OCUPACAO NAO RESIDENCIAL","CASA","CASA COM OCUPACAO NAO RESIDENCIAL","GALPAO","LOJA","LOTE VAGO","SALA","VAGA DE GARAGEM NAO RESIDENCIAL","VAGA DE GARAGEM RESIDENCIAL"))
  imoveis$TIPO_OCUPACAO <- as.factor(imoveis$TIPO_OCUPACAO)
  imoveis$PADRAO_ACABAMENTO <- factor(imoveis$PADRAO_ACABAMENTO, ordered = TRUE, levels = c("TE", "P1", "P2", "P3", "P4", "P5"))
  imoveis$TIPO_LOGRADOURO <- as.factor(imoveis$TIPO_LOGRADOURO)
  imoveis$TIPOLOGIA <- as.factor(imoveis$TIPOLOGIA)
  return(imoveis)
}

gera_imagens <- function(tabela) {
  p <- tabela %>% 
    group_by(REGIONAL, FREQUENCIA_COLETA) %>%
    summarise(Total=n(), .groups = 'drop') %>%
    ggplot(aes(fill=FREQUENCIA_COLETA, x=REGIONAL, y=Total)) +
    geom_bar(position="stack", stat="identity") +
    labs(x = "Regional",
         y="Total",
         title = "Coleta de Lixo",
         subtitle = "Total por Regional",
         caption = "Fonte: Portal de Dados Abertos da PBH",
         tag="Figura 1",
         fill = NULL) +
    theme(legend.position="top" )
  png("coleta.png", width = 1029, height = 551,type='cairo')
  print(p)
  dev.off()
  
  p <- tabela %>% 
    group_by(REGIONAL, TIPO_CONSTRUTIVO) %>%
    summarise(Total=n(), .groups = 'drop') %>%
    ggplot(aes(fill=TIPO_CONSTRUTIVO, x=REGIONAL, y=Total)) +
    geom_bar(position="stack", stat="identity") +
    labs(x = "Regional",
         y="Total",
         title = "Perfil dos Imóveis",
         subtitle = "Total por Regional",
         caption = "Fonte: Portal de Dados Abertos da PBH",
         tag="Figura 2",
         fill = NULL) +
    theme(legend.position="top" )
  png("perfil.png", width = 1029, height = 551,type='cairo')
  print(p)
  dev.off()
  
  p <- tabela %>% 
    group_by(REGIONAL, TIPO_OCUPACAO) %>%
    summarise(Total=n(), .groups = 'drop') %>%
    ggplot(aes(fill=TIPO_OCUPACAO, x=REGIONAL, y=Total)) +
    geom_bar(position="stack", stat="identity") +
    labs(x = "Regional",
         y="Total",
         title = "Perfil da Ocupação",
         subtitle = "Total por Regional",
         caption = "Fonte: Portal de Dados Abertos da PBH",
         tag="Figura 3",
         fill = NULL) +
    theme(legend.position="top" )
  png("ocupacao.png", width = 1029, height = 551,type='cairo')
  print(p)
  dev.off()
  
  p <- tabela %>% 
    group_by(REGIONAL, PADRAO_ACABAMENTO) %>%
    summarise(Total=n(), .groups = 'drop') %>%
    ggplot(aes(fill=PADRAO_ACABAMENTO, x=REGIONAL, y=Total)) +
    geom_bar(position="stack", stat="identity") +
    labs(x = "Regional",
         y="Total",
         title = "Qualidade do Imóvel",
         subtitle = "Total por Regional",
         caption = "Fonte: Portal de Dados Abertos da PBH",
         tag="Figura 4",
         fill = NULL) +
    theme(legend.position="top" )
  png("acabamento.png", width = 1029, height = 551,type='cairo')
  print(p)
  dev.off()
}

gera_utilidade <- function(regional, indices, tabela) {
  rbind(
    tabela %>%
      filter(REGIONAL == "Barreiro" & CEP > 0 & AREA_CONSTRUCAO > 0) %>%
      inner_join(indices) %>%
      group_by(CEP, INDICE) %>%
      summarise(TOTAL = sum(AREA_CONSTRUCAO), .groups = 'drop') %>%
      group_by(CEP) %>%
      summarise(
        ITEMSET = paste0(INDICE, collapse = " "),
        UTILIDADE_TOTAL = as.integer(sum(TOTAL)),
        UTILIDADE=paste0(as.integer(TOTAL), collapse = " "),
        .groups = 'drop') %>% 
      select(ITEMSET, UTILIDADE_TOTAL, UTILIDADE)
    ,
    tabela %>%
      filter(REGIONAL == "Barreiro" & CEP == 0 & AREA_CONSTRUCAO > 0) %>%
      inner_join(indices) %>%
      group_by(TIPO_LOGRADOURO, NOME_LOGRADOURO, INDICE, .groups = "drop") %>%
      summarise(TOTAL = sum(AREA_CONSTRUCAO), .groups = 'drop') %>%
      group_by(TIPO_LOGRADOURO, NOME_LOGRADOURO, .groups = "drop") %>%
      summarise(
        ITEMSET = paste0(INDICE, collapse = " "),
        UTILIDADE_TOTAL = as.integer(sum(TOTAL)),
        UTILIDADE=paste0(as.integer(TOTAL), collapse = " "),
        , .groups = 'drop') %>% 
      select(ITEMSET, UTILIDADE_TOTAL, UTILIDADE)
  )  
}
dados <- ler_banco_dados("imobiliario.db")
gera_imagens(dados)
tipos <- crossing(
  TIPO_CONSTRUTIVO = levels(dados$TIPO_CONSTRUTIVO),
  PADRAO_ACABAMENTO = levels(dados$PADRAO_ACABAMENTO)
  )
tipos$INDICE = 1:dim(tipos)[1]


for (regional in levels(dados$REGIONAL)) {
  arquivo <- paste(regional, '.txt')
  fileConn<-file(arquivo)
  writeLines(c("@CONVERTED_FROM_TEXT"), fileConn)
  close(fileConn)
  
  codigos <- tipos %>%
    unite("NOME", PADRAO_ACABAMENTO:TIPO_CONSTRUTIVO, remove = TRUE) %>%
    unite("CODIGO", INDICE, NOME, remove = TRUE, sep="=") %>%
    mutate(CODIGO=paste("@ITEM=", CODIGO, sep = ""))
  write.table(codigos,
              file = arquivo,
              sep = "",
              col.names = FALSE,
              row.names = FALSE,
              quote = FALSE,
              append=TRUE)
  
  utilidade <- gera_utilidade(regional, tipos, dados)
  write.table(utilidade,
              file = arquivo,
              sep = ":",
              col.names = FALSE,
              row.names = FALSE,
              quote = FALSE,
              append=TRUE)
}
