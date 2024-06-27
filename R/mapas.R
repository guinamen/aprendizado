suppressMessages(library(sf))
suppressMessages(library(ggplot2))
suppressMessages(library(dplyr))
suppressMessages(library(ggspatial))
suppressMessages(library(extrafont))
library(igraph)
suppressMessages(loadfonts())
regionais <- st_read("Mapas/BH/Regionais/REGIONAL.shp", options = "ENCODING=windows-1252")
#bairros <- st_read("/home/guilherme/R/Mapas/BH/Bairros/BAIRRO.shp", options = "ENCODING=windows-1252")
#ss_centroids <- st_centroid(regionais)
#ss_centroids <- cbind(ss_centroids, st_coordinates(st_centroid(ss_centroids$geometry)))
regionais <- cbind(regionais,st_coordinates(st_centroid(regionais$geometry)))
regionais <- regionais[order(regionais$ID, decreasing = FALSE), ]
regionais <- cbind(regionais,POPULACAO= c(282156, 282286, 228986, 281507, 271143, 214967, 316908, 266859, 230339))
regionais <- cbind(regionais,AREA_CONSTRUIDA= c(12024048, 34241942, 11135690, 14615352,15075484,7830939,19189995,17638949,11470144))
p <- regionais %>%
  ggplot() + 
  geom_sf(aes(fill = AREA_KM2)) + 
  labs(title="Belo Horizonte",
       x ="Longitude",
       y = "Latitude",
       fill="Km²",
       caption = "Fonte: BHMap PRODABEL PBH",
       subtitle = "Regionais - Área Geográfica") +
  geom_text(aes(x=X, y=Y, label=SIGLA), colour= "white", fontface = "bold", family="Times", check_overlap = FALSE) +
  annotation_scale(location = "br", width_hint = 0.5) +
  annotation_north_arrow(location = "br", which_north = "true", 
                         pad_x = unit(0.75, "in"), pad_y = unit(0.5, "in"),
                         style = north_arrow_fancy_orienteering) +
  theme(panel.grid.major = element_line(color = gray(.5), linetype = "dashed", size = 0.5),
        panel.background = element_rect(fill = "aliceblue"),
        panel.border = element_rect(colour = "black", fill=NA),
        text=element_text(family="Josefin Sans")) +
  scale_fill_viridis_c(option = "turbo")
ggsave('Imagens/area.png', p, bg='transparent')

q <- regionais %>% ggplot() + 
  geom_sf(aes(fill = POPULACAO)) + 
  labs(title="Belo Horizonte",
       x ="Longitude",
       y = "Latitude",
       fill="População",
       caption = "Fonte: BHMap PRODABEL PBH e IBGE Censo 2010",
       subtitle = "Regionais - População") +
  geom_text(aes(x=X, y=Y, label=SIGLA), colour= "white", fontface = "bold", family="Times", check_overlap = FALSE) +
  annotation_scale(location = "br", width_hint = 0.5) +
  annotation_north_arrow(location = "br", which_north = "true", 
                         pad_x = unit(0.75, "in"), pad_y = unit(0.5, "in"),
                         style = north_arrow_fancy_orienteering) +
  theme(panel.grid.major = element_line(color = gray(.5), linetype = "dashed", size = 0.5),
        panel.background = element_rect(fill = "aliceblue"),
        panel.border = element_rect(colour = "black", fill=NA),
        text=element_text(family="Josefin Sans")) +
  scale_fill_viridis_c(option = "turbo")
ggsave('Imagens/populacao.png', q, bg='transparent')

r <- regionais %>% ggplot() + 
  geom_sf(aes(fill = AREA_CONSTRUIDA / 1000000)) + 
  labs(title="Belo Horizonte",
       x ="Longitude",
       y = "Latitude",
       fill="Km²",
       caption = "Fonte: BHMap Dados Abertos PRODABEL PBH",
       subtitle = "Regionais - Área Construída") +
  geom_text(aes(x=X, y=Y, label=SIGLA), colour= "white", fontface = "bold", family="Times", check_overlap = FALSE) +
  annotation_scale(location = "br", width_hint = 0.5) +
  annotation_north_arrow(location = "br", which_north = "true", 
                         pad_x = unit(0.75, "in"), pad_y = unit(0.5, "in"),
                         style = north_arrow_fancy_orienteering) +
  theme(panel.grid.major = element_line(color = gray(.5), linetype = "dashed", size = 0.5),
        panel.background = element_rect(fill = "aliceblue"),
        panel.border = element_rect(colour = "black", fill=NA),
        text=element_text(family="Josefin Sans")) +
  scale_fill_viridis_c(option = "turbo")
ggsave('Imagens/area_construida.png', r, bg='transparent')

adj_matrix <- st_intersects(regionais,regionais, sparse = FALSE)
colnames(adj_matrix) <- regionais$SIGLA
rownames(adj_matrix) <- regionais$SIGLA
diag(adj_matrix) <- FALSE
g <- graph_from_adjacency_matrix(adj_matrix, mode='undirected')

png("Imagens/grafo.png", width = 512, height = 512,type='cairo', units = 'px')
plot(g)
dev.off()