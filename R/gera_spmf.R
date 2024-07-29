system <- function(...) {
  stopifnot(!any(names(list(...)) %in% "intern"))
  result <- base::system(..., intern = TRUE)
  write(result, file="spmf.log",append=TRUE)
}

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


le_outliers <- function(regional) {
  read.table(
    paste("GritBot/", tolower(gsub(" ", "_", regional)), ".txt", sep = "" ),
    col.names = c('REGIONAL'), sep = ',')
}

gera_item_set <- function(regional, indices, tabela) {
  rbind(
    tabela %>%
      filter(REGIONAL == regional) %>%
      anti_join(le_outliers(regional)) %>%
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
  rbind(
    tabela %>%
      filter(REGIONAL == regional & CEP > 0 & AREA_CONSTRUCAO > 0) %>%
      anti_join(le_outliers(regional)) %>%
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
  rbind(
    tabela %>%
      filter(REGIONAL == regional & CEP > 0) %>%
      anti_join(le_outliers(regional)) %>%
      mutate(AREA_CONSTRUCAO = ifelse(AREA_CONSTRUCAO == 0,-AREA_TERRENO, AREA_CONSTRUCAO)) %>%
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
      mutate(AREA_CONSTRUCAO = ifelse(AREA_CONSTRUCAO == 0,-AREA_TERRENO, AREA_CONSTRUCAO)) %>%
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

gera_utilidade_sequencial <- function(regional, indices, tabela) {
  tabela %>% filter(REGIONAL == regional &  !is.na(NUMERO_IMOVEL) & CEP > 0) %>%
    anti_join(le_outliers(regional)) %>%
    group_by(
      TIPO_LOGRADOURO,
      NOME_LOGRADOURO,
      NUMERO_IMOVEL,
      TIPO_CONSTRUTIVO,
      PADRAO_ACABAMENTO,
      OUTLIER, .groups = 'drop') %>%
    summarise(AREA_CONSTRUCAO=sum(round(AREA_CONSTRUCAO)), .groups = 'drop') %>%
    inner_join(indices) %>%
    group_by(TIPO_LOGRADOURO, NOME_LOGRADOURO) %>%
    summarise(
      ITEM_SET = gera_transacao_utilidade(INDICE, AREA_CONSTRUCAO),
      UTILIDADE_TOTAL = as.integer(sum(AREA_CONSTRUCAO)), .groups = 'drop') %>%
    select(ITEM_SET, UTILIDADE_TOTAL)
  
}

gera_transacao_utilidade <- function(item, utilidade, n = 5) {
  lacos = length(item) %/% n + ifelse(length(item) %% n == 0, 0, 1 )
  transacao = c()
  inicio = 1
  fim = n
  for (i in 1:lacos) {
    agregado = aggregate(.~ITEM, data.frame(ITEM=item[inicio:fim], UTILIDADE=utilidade[inicio:fim]), sum)
    for (j in 1:nrow(agregado)) {
      elemento = paste0(agregado[j,1],"[", agregado[j,2],"]", " ")
      transacao = append(transacao, elemento)
    }
    transacao = append(transacao, "-1")
    inicio = inicio + n
    fim = ifelse(fim + n < length(item),fim + n, length(item) )
  }
  return(paste(paste(transacao, collapse = ' '), ' -2', collapse = '' ))
}

grava_arquivo_spmf <- function(arquivo, tipos, dados, sep = ':', gera_preambulo=TRUE) {
  if (gera_preambulo ) {
    gera_preambulo(arquivo, tipos)
  }
  write.table(dados,
              file = arquivo,
              sep,
              col.names = FALSE,
              row.names = FALSE,
              quote = FALSE,
              append=TRUE)
}

executa_algoritmo <- function(algoritmo, entrada, saida, paramentros) {
  java <- '"c:\\Users\\Guilherme Namem\\java\\jdk-22.0.1\\bin\\java.exe" -jar spmf.jar run'
  cmd <- paste(java,
                algoritmo,
                entrada,
                saida,
                paramentros,
                sep = " ")
  system(cmd)
}
