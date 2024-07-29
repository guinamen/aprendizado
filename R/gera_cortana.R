gera_cortana <- function(regional, tabela, arquivo) {
  #registros <- rbind(
  #  tabela %>%
  #    filter(REGIONAL == regional & CEP > 0 & TIPO_OCUPACAO == "RESIDENCIAL" &
  #             TIPO_CONSTRUTIVO != 'VAGA DE GARAGEM RESIDENCIAL') %>%
  #    anti_join(le_outliers(regional))
  #  ,
  #  tabela %>%
  #    filter(REGIONAL == regional & CEP == 0  & TIPO_OCUPACAO == "RESIDENCIAL" &
  #             TIPO_CONSTRUTIVO != 'VAGA DE GARAGEM RESIDENCIAL')
  #)  %>%
  #  select(
  #    INDICE_CADASTRAL,
  #    FREQUENCIA_COLETA,
  #    IND_MEIO_FIO,
  #    IND_PAVIMENTACAO,
  #    IND_ARBORIZACAO,
  #    IND_GALERIA_PLUVIAL,
  #    IND_ILUMINACAO_PUBLICA,
  #    IND_REDE_ESGOTO,
  #    IND_REDE_AGUA,
  #    IND_REDE_TELEFONICA,
  #    TIPO_CONSTRUTIVO,
  #    AREA_TERRENO,
  #    AREA_CONSTRUCAO,
  #    PADRAO_ACABAMENTO,
  #    OUTLIER,
  #    X,
  #    Y)
  registros <- tabela %>%
    filter(REGIONAL == regional,
           TIPO_OCUPACAO == 'RESIDENCIAL',
           TIPO_CONSTRUTIVO != 'VAGA DE GARAGEM RESIDENCIAL') %>%
    mutate(
      AREA_CONSTRUCAO = ifelse(
        TIPO_CONSTRUTIVO == 'APARTAMENTO',
        AREA_CONSTRUCAO/QUANTIDADE_ECONOMIAS,
        AREA_CONSTRUCAO)) %>%
    group_by(X,Y) %>%
    summarise(
      AREA_TERRENO=first(AREA_TERRENO),
      AREA_CONSTRUCAO=max(AREA_CONSTRUCAO),
      TIPO_CONSTRUTIVO=max(TIPO_CONSTRUTIVO),
      PADRAO_ACABAMENTO=max(PADRAO_ACABAMENTO),
      .groups = 'drop')
  write.table(registros, arquivo,
              na = "?",
              row.names = FALSE,
              col.names = TRUE,
              append = FALSE,
              quote = FALSE,
              sep = ",")
}