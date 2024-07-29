gera_imagens <- function(tabela, utilidade) {
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
    theme(legend.position="top" )  + theme(rect = element_rect(fill = "transparent"))
  png("Imagens/coleta.png", width = 1029, height = 551, units = 'px', type='cairo')
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
    theme(legend.position="top" )  + theme(rect = element_rect(fill = "transparent"))
  png("Imagens/perfil.png", width = 1029, height = 551, units = 'px', type='cairo')
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
    theme(legend.position="top" )  + theme(rect = element_rect(fill = "transparent"))
  png("Imagens/ocupacao.png", width = 1029, height = 551, units = 'px', type='cairo')
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
    theme(legend.position="top" )  + theme(rect = element_rect(fill = "transparent"))
  png("Imagens/acabamento.png", width = 1029, height = 551, units = 'px', type='cairo')
  print(p)
  dev.off()
  
  u <- utilidade %>% 
    ggplot(aes(x=UTILIDADE/1000000, y=SUPORTE, group=REGIONAL, shape=REGIONAL,color=REGIONAL)) +
    geom_point() +
    scale_shape_manual(values = seq(0,8)) +
    labs(x = "Utilidade Km²",
         y="Suporte",
         title = "Relação Suporte x Utilidade",
         subtitle = "Regional",
         caption = "Fonte: Portal de Dados Abertos da PBH",
         tag="Figura 5", shape=NULL, color=NULL)  + theme(rect = element_rect(fill = "transparent"))
  png("Imagens/utilidade_suporte.png", width = 1029, height = 551,  units = 'px', type='cairo')
  print(u)
  dev.off()
}