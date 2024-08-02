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
    unite("NOME", TIPO_CONSTRUTIVO:OUTLIER, remove = TRUE, sep = " ") %>%
    unite("CODIGO", INDICE, NOME, remove = TRUE, sep="=") %>%
    mutate(CODIGO=paste("@ITEM=", gsub(" FALSE| TE", "", CODIGO), sep = ""))
  write.table(codigos,
              file = arquivo,
              sep = "",
              col.names = FALSE,
              row.names = FALSE,
              quote = FALSE,
              append=TRUE)
}


le_outliers <- function(regional) {
  read.table(
    paste("GritBot/", tolower(gsub(" ", "_", regional)), ".txt", sep = "" ),
    col.names = c('REGIONAL'), sep = ',')
}

gera_item_set <- function(regional, indices, tabela) {
  rbind(
    tabela %>%
      filter(REGIONAL == regional, CEP > 0) %>%
      anti_join(le_outliers(regional)) %>%
      inner_join(indices) %>%
      group_by(CEP) %>%
      summarise(
        ITEMSET = paste0(unique(INDICE), collapse = " "),
        .groups = 'drop') %>% 
      select(ITEMSET)
    ,
    tabela %>%
      filter(REGIONAL == regional, CEP == 0) %>%
      inner_join(indices) %>%
      group_by(TIPO_LOGRADOURO, NOME_LOGRADOURO, .groups = "drop") %>%
      summarise(
        ITEMSET = paste0(unique(INDICE), collapse = " "),
        , .groups = 'drop') %>% 
      select(ITEMSET)
  )  
}

gera_item_set_conta <- function(regional, indices, tabela) {
  rbind(
    tabela %>%
      filter(REGIONAL == regional, CEP > 0) %>%
      anti_join(le_outliers(regional)) %>%
      inner_join(indices) %>%
      group_by(CEP, INDICE) %>%
      summarise(
        TOTAL = n(),
        .groups = 'drop') %>% 
      group_by(CEP) %>%
      summarise(
        ITEMSET = paste0(INDICE, collapse = " "),
        TOTAL_ITEMSET = sum(TOTAL),
        TOTAL_DESC = paste0(TOTAL, collapse = " "),
        .groups = 'drop') %>%
      select(ITEMSET, TOTAL_ITEMSET, TOTAL_DESC)
    ,
    tabela %>%
      filter(REGIONAL == regional, CEP == 0) %>%
      inner_join(indices) %>%
      group_by(TIPO_LOGRADOURO, NOME_LOGRADOURO, INDICE) %>%
      summarise(
        TOTAL = n(),
        .groups = 'drop') %>% 
      group_by(TIPO_LOGRADOURO, NOME_LOGRADOURO) %>%
      summarise(
        ITEMSET = paste0(INDICE, collapse = " "),
        TOTAL_ITEMSET = sum(TOTAL),
        TOTAL_DESC = paste0(TOTAL, collapse = " "),
        .groups = 'drop') %>%
      select(ITEMSET, TOTAL_ITEMSET, TOTAL_DESC)
  )  
}

gera_utilidade_positiva <- function(regional, indices, tabela) {
  rbind(
    tabela %>%
      filter(REGIONAL == regional & CEP > 0 & AREA_CONSTRUCAO > 0) %>%
      anti_join(le_outliers(regional)) %>%
      inner_join(indices) %>%
      group_by(CEP, INDICE) %>%
      summarise(TOTAL = round(sum(AREA_CONSTRUCAO)), .groups = 'drop') %>%
      group_by(CEP) %>%
      summarise(
        ITEMSET = paste0(INDICE, collapse = " "),
        UTILIDADE_TOTAL = sum(TOTAL),
        UTILIDADE=paste0(TOTAL, collapse = " "),
        .groups = 'drop') %>% 
      select(ITEMSET, UTILIDADE_TOTAL, UTILIDADE)
    ,
    tabela %>%
      filter(REGIONAL == regional & CEP == 0 & AREA_CONSTRUCAO > 0) %>%
      inner_join(indices) %>%
      group_by(TIPO_LOGRADOURO, NOME_LOGRADOURO, INDICE) %>%
      summarise(TOTAL = round(sum(AREA_CONSTRUCAO)), .groups = 'drop') %>%
      group_by(TIPO_LOGRADOURO, NOME_LOGRADOURO, .groups = "drop") %>%
      summarise(
        ITEMSET = paste0(INDICE, collapse = " "),
        UTILIDADE_TOTAL = sum(TOTAL),
        UTILIDADE=paste0(TOTAL, collapse = " "),
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
      summarise(TOTAL = round(sum(AREA_CONSTRUCAO)), .groups = 'drop') %>%
      group_by(CEP) %>%
      summarise(
        ITEMSET = paste0(INDICE, collapse = " "),
        UTILIDADE_TOTAL = sum(TOTAL),
        UTILIDADE=paste0(TOTAL, collapse = " "),
        .groups = 'drop') %>% 
      select(ITEMSET, UTILIDADE_TOTAL, UTILIDADE)
    ,
    tabela %>%
      filter(REGIONAL == regional & CEP == 0) %>%
      mutate(AREA_CONSTRUCAO = ifelse(AREA_CONSTRUCAO == 0,-AREA_TERRENO, AREA_CONSTRUCAO)) %>%
      inner_join(indices) %>%
      group_by(TIPO_LOGRADOURO, NOME_LOGRADOURO, INDICE, .groups = "drop") %>%
      summarise(TOTAL = round(sum(AREA_CONSTRUCAO)), .groups = 'drop') %>%
      group_by(TIPO_LOGRADOURO, NOME_LOGRADOURO, .groups = "drop") %>%
      summarise(
        ITEMSET = paste0(INDICE, collapse = " "),
        UTILIDADE_TOTAL = sum(TOTAL),
        UTILIDADE=paste0(TOTAL, collapse = " "),
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
    summarise(AREA_CONSTRUCAO=round(sum(AREA_CONSTRUCAO)), .groups = 'drop') %>%
    inner_join(indices) %>%
    group_by(TIPO_LOGRADOURO, NOME_LOGRADOURO) %>%
    summarise(
      ITEM_SET = gera_transacao_utilidade(INDICE, AREA_CONSTRUCAO),
      UTILIDADE_TOTAL = sum(AREA_CONSTRUCAO), .groups = 'drop') %>%
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

grava_arquivo_spmf <- function(arquivo, tipos, dados, sep = ':', gera_preambulo=FALSE) {
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
