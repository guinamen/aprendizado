
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
  
  #Regionais são ordenadas pelo total de registros
  imoveis$REGIONAL <- factor(imoveis$REGIONAL, ordered = TRUE, levels = c("Norte","Barreiro","Leste","Venda Nova", "Noroeste", "Nordeste", "Pampulha", "Oeste","Centro-Sul"))
  
  imoveis$FREQUENCIA_COLETA <- factor(imoveis$FREQUENCIA_COLETA, ordered = TRUE, levels = c("SEM COLETA", "COLETA ALTERNADA", "COLETA DIARIA"))
  imoveis$TIPO_CONSTRUTIVO <- factor(imoveis$TIPO_CONSTRUTIVO, ordered = TRUE, levels = c("APARTAMENTO","APARTAMENTO COM OCUPACAO NAO RESIDENCIAL","BARRACAO","BARRACAO COM OCUPACAO NAO RESIDENCIAL","CASA","CASA COM OCUPACAO NAO RESIDENCIAL","GALPAO","LOJA","LOTE VAGO","SALA","VAGA DE GARAGEM NAO RESIDENCIAL","VAGA DE GARAGEM RESIDENCIAL"))
  imoveis$TIPO_OCUPACAO <- as.factor(imoveis$TIPO_OCUPACAO)
  imoveis$PADRAO_ACABAMENTO <- factor(imoveis$PADRAO_ACABAMENTO, ordered = TRUE, levels = c("TE", "P1", "P2", "P3", "P4", "P5"))
  imoveis$TIPO_LOGRADOURO <- as.factor(imoveis$TIPO_LOGRADOURO)
  imoveis$TIPOLOGIA <- as.factor(imoveis$TIPOLOGIA)
  
  intervalo <- imoveis %>%
    group_by(REGIONAL, PADRAO_ACABAMENTO, TIPO_CONSTRUTIVO) %>%
    summarise(
      INF = quantile(AREA_CONSTRUCAO, 0.25) - 1.5*IQR(AREA_CONSTRUCAO),
      SUP = quantile(AREA_CONSTRUCAO, 0.75) + 1.5*IQR(AREA_CONSTRUCAO),
      .groups = 'drop'
    )
  imoveis$OUTLIER <- imoveis %>%
    inner_join(intervalo) %>%
    mutate(
      OUTLIER = ifelse(
        AREA_CONSTRUCAO < INF | AREA_CONSTRUCAO > SUP,
        TRUE,
        FALSE) ) %>%
    pull(OUTLIER)
  return(imoveis)
}

