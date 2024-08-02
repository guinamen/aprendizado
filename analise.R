packs <- c("RSQLite", "tidyverse", "sf")
success <- suppressWarnings(sapply(packs, require, character.only = TRUE))
install.packages(names(success)[!success])
sapply(names(success)[!success], require, character.only = TRUE)

library(RSQLite)
library(tibble)
library(ggplot2)
library(sf)

source(file="R/le_banco.R")
source(file='R/gera_imagem.R')
source(file='R/gera_spmf.R')
source(file='R/gera_cortana.R')


dados <- ler_banco_dados("imobiliario.db")
if(FALSE) {
  # Calcula o centroide geoespacial.
  # Os dados já estão no banco não é necessário calcular.
  x <- st_as_sf(dados, wkt = 'GEOMETRIA')
  x <- cbind(x, st_coordinates(st_centroid(x$GEOMETRIA)))
  dados$Y = x$Y
  dados$X = x$X
  
  #Calcula os valores para detectar imóveis com área de construção muito fora do padrão.
  # Os dados já estão no banco não é necessário calcular.
  intervalo <- dados %>%
    group_by(REGIONAL, PADRAO_ACABAMENTO, TIPO_CONSTRUTIVO) %>%
    summarise(
      INF = quantile(AREA_CONSTRUCAO, .25) - 1.5 * IQR(AREA_CONSTRUCAO),
      SUP = quantile(AREA_CONSTRUCAO, .75) + 1.5 * IQR(AREA_CONSTRUCAO),
      .groups = 'drop'
  )
  intervalo$INF[intervalo$INF < 0] <- 0
}


tipos <- dados %>%
  distinct(TIPO_CONSTRUTIVO, PADRAO_ACABAMENTO, OUTLIER) %>%
  arrange(TIPO_CONSTRUTIVO)
tipos$INDICE = 1:dim(tipos)[1]
tipos <- tipos %>%
  mutate(TIPO_CONSTRUTIVO = gsub('BARRACAO', 'BARRACÃO',TIPO_CONSTRUTIVO)) %>%
  mutate(TIPO_CONSTRUTIVO = gsub('NAO', 'NÃO',TIPO_CONSTRUTIVO)) %>%
  mutate(TIPO_CONSTRUTIVO = gsub('OCUPACAO', 'OCUPAÇÃO',TIPO_CONSTRUTIVO)) %>%
  mutate(TIPO_CONSTRUTIVO = gsub('GALPAO', 'GALPÃO',TIPO_CONSTRUTIVO))


numero_string <- function(numeros) {
  textos = c()
  for(numero in strsplit(numeros, split = " ")[[1]]) {
    linha = tipos %>% filter(INDICE == as.integer(numero))
    texto = linha %>% pull(TIPO_CONSTRUTIVO)
    if (texto != 'LOTE VAGO') {
      texto = paste(texto, linha %>% pull(PADRAO_ACABAMENTO))
    }
    if(as.logical(linha %>% pull(3))) {
      texto = paste(texto, "OUTLIER")
    }
    textos = append(textos,texto)
  }
  paste(textos, collapse = ', ')
}

numero_string_fuzzy <- function(numeros) {
  textos = c()
  for(item in strsplit(numeros, split = " ")[[1]]) {
    numero = strsplit(item, split = "\\.")[[1]][1]
    fuzzy = strsplit(item, split = "\\.")[[1]][2]
    linha = tipos %>% filter(INDICE == as.integer(numero))
    texto = linha %>% pull(TIPO_CONSTRUTIVO)
    if (texto != 'LOTE VAGO') {
      texto = paste(texto, linha %>% pull(PADRAO_ACABAMENTO))
    }
    if(as.logical(linha %>% pull(3))) {
      texto = paste(texto, "OUTLIER")
    }
    if (fuzzy == 'H') {
      texto = paste(texto, "ALTO")
    } else if (fuzzy == 'M') {
      texto = paste(texto, "MÉDIO")
    } else {
      texto = paste(texto, "BAIXO")
    }
    textos = append(textos,texto)
  }
  paste(textos, collapse = ', ')
}

utilidade <- data.frame(
  REGIONAL=factor(factor(ordered = TRUE, levels = c("Norte","Barreiro","Leste","Venda Nova", "Noroeste", "Nordeste", "Pampulha", "Oeste","Centro-Sul"))),
  ITEMSET=character(),
  UTILIDADE = double(),
  SUPORTE = integer(),
  stringsAsFactors=FALSE)

fpmax <- data.frame(
  REGIONAL=factor(factor(ordered = TRUE, levels = c("Norte","Venda Nova", "Pampulha",  "Barreiro","Leste", "Noroeste", "Nordeste", "Oeste","Centro-Sul"))),
  ITEMSET=character(),
  SUPORTE = integer(),
  stringsAsFactors=FALSE)

fuzzy <- data.frame(
  REGIONAL=factor(factor(ordered = TRUE, levels = c("Norte","Venda Nova", "Pampulha",  "Barreiro","Leste", "Noroeste", "Nordeste", "Oeste","Centro-Sul"))),
  ITEMSET=character(),
  SUPORTE = double(),
  stringsAsFactors=FALSE)

opus <- data.frame(
  REGIONAL=factor(factor(ordered = TRUE, levels = c("Norte","Barreiro","Leste","Venda Nova", "Noroeste", "Nordeste", "Pampulha", "Oeste","Centro-Sul"))),
  ITEMSET=character(),
  SUPORTE = integer(),
  LIFT = double(),
  P = double(),
  stringsAsFactors=FALSE)

utilidade_positiva <- data.frame(
  REGIONAL=factor(factor(ordered = TRUE, levels = c("Norte","Barreiro","Leste","Venda Nova", "Noroeste", "Nordeste", "Pampulha", "Oeste","Centro-Sul"))),
  ITEMSET=character(),
  UTILIDADE = double(),
  stringsAsFactors=FALSE)

utilidade_negativa <- data.frame(
  REGIONAL=factor(factor(ordered = TRUE, levels = c("Norte","Barreiro","Leste","Venda Nova", "Noroeste", "Nordeste", "Pampulha", "Oeste","Centro-Sul"))),
  ITEMSET=character(),
  UTILIDADE = double(),
  stringsAsFactors=FALSE)
for (regional in levels(dados$REGIONAL)) {
  
  arquivo_utilidade <- paste("SPMF/utilidade/positiva/utilidade_", gsub(" ", "_", regional), '.txt', sep = "")
  arquivo_item_set <- paste("SPMF/item_set/itemset_", gsub(" ", "_", regional), '.txt', sep = "")
  arquivo_utilidade_neg <- paste("SPMF/utilidade/negativa/utilidade_negativa_", gsub(" ", "_", regional), '.txt', sep = "")
  arquivo_utilidade_seq <- paste("SPMF/utilidade_seq/utilidade_seq_", gsub(" ", "_", regional), '.txt', sep = "")
  arquivo_fuzzy <- paste("SPMF/fuzzy/fuzzy_", gsub(" ", "_", regional), '.txt', sep = "")
  
  if (!file.exists(arquivo_utilidade)) {
    grava_arquivo_spmf(arquivo_utilidade, tipos, gera_utilidade_positiva(regional, tipos, dados))
  }
  if (!file.exists(arquivo_item_set)) {
    grava_arquivo_spmf(arquivo_item_set, tipos, gera_item_set(regional, tipos, dados) %>% select(ITEMSET))
  }
  if (!file.exists(arquivo_utilidade_neg)) {
    grava_arquivo_spmf(arquivo_utilidade_neg, tipos, gera_utilidade_negativa(regional, tipos, dados))
  }
  if (!file.exists(arquivo_fuzzy)) {
    grava_arquivo_spmf(arquivo_fuzzy, tipos, gera_item_set_conta(regional, tipos, dados))
  }
  if (!file.exists(arquivo_utilidade_seq)) {
    grava_arquivo_spmf(
      arquivo_utilidade_seq,
      tipos,
      gera_utilidade_sequencial(regional, tipos, dados),
      sep=' SUtility:',
      gera_preambulo=FALSE)
  }
  
  if (!file.exists(paste("Resultado/FPMax/itemset_",gsub(" ", "_", regional),".txt", sep=""))) {
    executa_algoritmo("FPMax",
                      paste("SPMF/item_set/itemset_",gsub(" ", "_", regional),".txt", sep=""),
                      paste("Resultado/FPMax/itemset_",gsub(" ", "_", regional),".txt", sep=""),
                      "0.4")
  }
  if (!file.exists(paste("Resultado/OPUSMiner/itemset_",gsub(" ", "_", regional),".txt", sep=""))) {
    executa_algoritmo("OPUS-Miner",
                      paste("SPMF/item_set/itemset_",gsub(" ", "_", regional),".txt", sep=""),
                      paste("Resultado/OPUSMiner/itemset_",gsub(" ", "_", regional),".txt", sep=""),
                      "1000 true true true true false")
  }
  if (!file.exists(paste("Resultado/FHMFreq/utilidade_",gsub(" ", "_", regional),".txt", sep=""))) {
    executa_algoritmo("FHMFreq",
                      paste("SPMF/utilidade/positiva/utilidade_",gsub(" ", "_", regional),".txt", sep=""),
                      paste("Resultado/FHMFreq/utilidade_",gsub(" ", "_", regional),".txt", sep=""),
                      "1000000 0.3")
  }
  if (!file.exists(paste("Resultado/FHN_Negativo/utilidade_",gsub(" ", "_", regional),".txt", sep=""))) {
    executa_algoritmo("FHN",
                      paste("SPMF/utilidade/negativa/utilidade_negativa_",gsub(" ", "_", regional),".txt", sep=""),
                      paste("Resultado/FHN_Negativo/utilidade_",gsub(" ", "_", regional),".txt", sep=""),
                      "1000000")
  }
  if (!file.exists(paste("Resultado/FHN_Positivo/utilidade_",gsub(" ", "_", regional),".txt", sep=""))) {
    executa_algoritmo("FHN",
                      paste("SPMF/utilidade/positiva/utilidade_",gsub(" ", "_", regional),".txt", sep=""),
                      paste("Resultado/FHN_Positivo/utilidade_",gsub(" ", "_", regional),".txt", sep=""),
                      "1000000")
  }
  if (!file.exists(paste("Resultado/Fuzzy/fuzzy_",gsub(" ", "_", regional),".txt", sep=""))) {
    executa_algoritmo("MFFI-Miner",
                      arquivo_fuzzy,
                      paste("Resultado/Fuzzy/fuzzy_",gsub(" ", "_", regional),".txt", sep=""),
                      as.character(round(dim(gera_item_set_conta(regional, tipos, dados))[1] * 0.2)))
  }
  
  con = file(paste("Resultado/FHMFreq/utilidade_",gsub(" ", "_", regional),".txt", sep=""), "r")
  while ( TRUE ) {
    line = readLines(con, n = 1)
    if ( length(line) == 0 ) {
      break
    }
    linha_split = strsplit(line, split = " #UTIL: | #SUP: ")
    utilidade <- rbind(
      utilidade,
      list(
        REGIONAL = gsub("_", " ", regional),
        ITEMSET = linha_split[[1]][1],
        UTILIDADE = as.double(linha_split[[1]][2]),
        SUPORTE = as.integer(linha_split[[1]][3])))
  }
  close(con)
  
  con = file(paste("Resultado/FPMax/itemset_",gsub(" ", "_", regional),".txt", sep=""), "r")
  while ( TRUE ) {
    line = readLines(con, n = 1)
    if ( length(line) == 0 ) {
      break
    }
    linha_split = strsplit(line, split = " #UTIL: | #SUP: ")
    fpmax <- rbind(
      fpmax,
      list(
        REGIONAL = gsub("_", " ", regional),
        ITEMSET = linha_split[[1]][1],
        SUPORTE = as.integer(linha_split[[1]][2])))
  }
  close(con)
  
  con = file(paste("Resultado/Fuzzy/fuzzy_",gsub(" ", "_", regional),".txt", sep=""), "r")
  while ( TRUE ) {
    line = readLines(con, n = 1)
    if ( length(line) == 0 ) {
      break
    }
    linha_split = strsplit(line, split = " #UTIL: | #SUP: ")
    fuzzy <- rbind(
      fuzzy,
      list(
        REGIONAL = gsub("_", " ", regional),
        ITEMSET = linha_split[[1]][1],
        SUPORTE = as.integer(linha_split[[1]][2])))
  }
  close(con)
  
  con = file(paste("Resultado/FHN_Positivo/utilidade_",gsub(" ", "_", regional),".txt", sep=""), "r")
  while ( TRUE ) {
    line = readLines(con, n = 1)
    if ( length(line) == 0 ) {
      break
    }
    linha_split = strsplit(line, split = " #UTIL: | #SUP: ")
    utilidade_positiva <- rbind(
      utilidade_positiva,
      list(
        REGIONAL = gsub("_", " ", regional),
        ITEMSET = linha_split[[1]][1],
        UTILIDADE = as.double(linha_split[[1]][2])))
  }
  close(con)
  
  con = file(paste("Resultado/FHN_Negativo/utilidade_",gsub(" ", "_", regional),".txt", sep=""), "r")
  while ( TRUE ) {
    line = readLines(con, n = 1)
    if ( length(line) == 0 ) {
      break
    }
    linha_split = strsplit(line, split = " #UTIL: | #SUP: ")
    utilidade_negativa <- rbind(
      utilidade_negativa,
      list(
        REGIONAL = gsub("_", " ", regional),
        ITEMSET = linha_split[[1]][1],
        UTILIDADE = as.double(linha_split[[1]][2])))
  }
  close(con)
  
  con = file(paste("Resultado/OPUSMiner/itemset_",gsub(" ", "_", regional),".txt", sep=""), "r")
  while ( TRUE ) {
    line = readLines(con, n = 1)
    if ( length(line) == 0 ) {
      break
    }
    linha_split = strsplit(line, split = " #SUP: | #LIFT: | #PVALUE: ")
    opus <- rbind(
      opus,
      list(
        REGIONAL = gsub("_", " ", regional),
        ITEMSET = linha_split[[1]][1],
        SUPORTE = as.integer(linha_split[[1]][2]),
        LIFT = as.double(linha_split[[1]][3]),
        P = as.double(linha_split[[1]][4])))
  }
  close(con)
}
fpmax = fpmax %>% rowwise() %>% mutate(ITEMSET = numero_string(ITEMSET))
opus = opus %>% rowwise() %>% mutate(ITEMSET = numero_string(ITEMSET))
utilidade = utilidade %>% rowwise() %>% mutate(ITEMSET = numero_string(ITEMSET))
#utilidade_positiva = utilidade_positiva %>% rowwise() %>% mutate(ITEMSET = numero_string(ITEMSET))
#utilidade_negativa = utilidade_negativa %>% rowwise() %>% mutate(ITEMSET = numero_string(ITEMSET))
fuzzy <- fuzzy %>% rowwise() %>% mutate(ITEMSET = numero_string_fuzzy(ITEMSET))

gera_imagens(dados, utilidade)
gera_cortana("Centro-Sul", dados, "Cortana/Centro-Sul.csv")

