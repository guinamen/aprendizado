gera_preambulo <- function(arquivo, tipos) {
  fileConn<-file(arquivo, )
  writeLines(c("@CONVERTED_FROM_TEXT"), fileConn)
  close(fileConn)
  
  codigos <- tipos %>%
    unite("NOME", TIPO_CONSTRUTIVO:OUTLIER, remove = TRUE) %>%
    unite("CODIGO", INDICE, NOME, remove = TRUE, sep="=") %>%
    mutate(CODIGO=paste("@ITEM=", CODIGO, sep = ""))
  write.table(codigos,
              file = arquivo,
              sep = "",
              col.names = FALSE,
              row.names = FALSE,
              quote = FALSE,
              append=TRUE)
  fileConn<-file(arquivo, "a")
  writeLines(c("@ITEM=102=APARTAMENTO","@ITEM=103=BARRACAO","@ITEM=104=CASA",
               "@ITEM=105=GALPAO","@ITEM=106=LOJA","@ITEM=107=SALA",
               "@ITEM=108=VAGA DE GARAGEM"), fileConn)
  close(fileConn)
}

gera_item_set <- function(regional, indices, tabela) {
  outliers <- read.csv(
    paste("GritBot/", tolower('Barreiro'), ".txt", sep = "" ),
    col.names = 'REGIONAL')
  rbind(
    tabela %>%
      anti_join(outliers) %>%
      filter(REGIONAL == regional) %>%
      inner_join(indices) %>%
      group_by(CEP) %>%
      summarise(
        ITEMSET = paste0(unique(INDICE), collapse = " "),
        .groups = 'drop') %>% 
      select(ITEMSET)
    ,
    tabela %>%
      filter(REGIONAL == regional) %>%
      inner_join(indices) %>%
      group_by(TIPO_LOGRADOURO, NOME_LOGRADOURO, .groups = "drop") %>%
      summarise(
        ITEMSET = paste0(unique(INDICE), collapse = " "),
        , .groups = 'drop') %>% 
      select(ITEMSET)
  )  
}

gera_utilidade_positiva <- function(regional, indices, tabela) {
  outliers <- read.csv(
    paste("GritBot/", tolower('Barreiro'), ".txt", sep = "" ),
    col.names = 'REGIONAL')
  rbind(
    tabela %>%
      anti_join(outliers) %>%
      filter(REGIONAL == regional & CEP > 0 & AREA_CONSTRUCAO > 0) %>%
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
      filter(REGIONAL == regional & CEP == 0 & AREA_CONSTRUCAO > 0) %>%
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

gera_utilidade_negativa <- function(regional, indices, tabela) {
  outliers <- read.csv(
    paste("GritBot/", tolower('Barreiro'), ".txt", sep = "" ),
    col.names = 'REGIONAL')
  rbind(
    tabela %>%
      anti_join(outliers) %>%
      filter(REGIONAL == regional & CEP > 0) %>%
      mutate(AREA_CONSTRUCAO = ifelse(AREA_CONSTRUCAO == 0,-AREA_TERRENO,AREA_CONSTRUCAO)) %>%
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
      filter(REGIONAL == regional & CEP == 0) %>%
      mutate(AREA_CONSTRUCAO = ifelse(AREA_CONSTRUCAO == 0,-AREA_TERRENO,AREA_CONSTRUCAO)) %>%
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