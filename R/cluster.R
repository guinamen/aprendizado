library(tidyverse)
library(sf)
library(fpc)
library(osmdata)
library(ggspatial)
library(extrafont)
X <- read.csv(url("https://ckan.pbh.gov.br/dataset/1ab07865-1a30-4e09-88c1-17d2183b2ea0/resource/3189adfa-e30a-49f5-9a56-a307f10b29d3/download/20241001_regional_centro_sul_cadastro_imobiliario.csv"), sep = ";")
bairros <- st_read("Mapas/BH/Bairros/BAIRRO.shp", options = "ENCODING=windows-1252")
regionais <- st_read("Mapas/BH/Regionais/REGIONAL.shp", options = "ENCODING=windows-1252")
P5 <- X %>% filter(PADRAO_ACABAMENTO =='P5' & TIPO_OCUPACAO=='RESIDENCIAL' & TIPO_CONSTRUTIVO != 'VAGA DE GARAGEM RESIDENCIAL')
P5 <- st_as_sf(P5, crs = st_crs(regionais), wkt = 'GEOMETRIA')
grupo <- P5 %>% group_by(TIPO_LOGRADOURO, NOME_LOGRADOURO, NUMERO_IMOVEL) %>% summarise(TOTAL = n(), GEOMETRIA = first(GEOMETRIA), .groups='drop')
P5_C <- P5 %>% st_centroid()
centroids <- grupo %>% st_centroid() %>% st_coordinates()
#centroids <- cbind(centroids, TOTAL=grupo$TOTAL)
m <- scale(centroids)
db <- fpc::dbscan(m, eps = 0.17, MinPts = 5)
grupo$cluster <- predict(db, centroids)

cls <- grupo %>% filter(cluster!=0) %>% st_centroid() %>% group_by(cluster) %>% summarise(INV = st_concave_hull(st_union(GEOMETRIA),0.2 ))
P5 <- cbind(P5, st_intersects( P5, cls, sparse = F ))
cls <- cbind(cls, TOTAL = c(sum(P5$X1),sum(P5$X2),sum(P5$X3),sum(P5$X4),sum(P5$X5),sum(P5$X6)))
cls <- cbind(cls, st_coordinates( st_centroid(cls)))

#regionais %>% filter(SIGLA=='CS') %>% ggplot() + geom_sf() + geom_sf(data=cls, aes(fill=cluster, alpha=0.3)) + scale_fill_viridis_c(option = "plasma", trans = "sqrt") + geom_sf(data=P5,  fill='black')
bbox <- st_bbox(st_transform( regionais %>% filter(SIGLA=='CS'), 4326))
vias <- bbox %>% opq(timeout = 3500) %>% add_osm_feature(key = 'highway', value = c("motorway", "primary", "secondary", "tertiary", "residencial", "living_street", "unclassified")) %>% osmdata_sf()
natural <- bbox %>% opq(timeout = 3500) %>% add_osm_feature(key = 'natural', value = c("water")) %>% osmdata_sf()
verde <- bbox %>% opq(timeout = 3500) %>% add_osm_feature(key = 'leisure', value = c("park", "nature_reserve", "golf_course")) %>% osmdata_sf()
vegetacao <- bbox %>% opq(timeout = 3500) %>% add_osm_feature(key = 'natural', value = c("tree", "grassland", "wood")) %>% osmdata_sf()
rios <- bbox %>% opq(timeout = 3500) %>% add_osm_feature(key = 'waterway', value = c("river", "stream")) %>% osmdata_sf()
p <- regionais %>%
  filter(SIGLA=='CS') %>%
  ggplot() +
  geom_sf() +
  scale_alpha(guide = 'none') +
  scale_fill_viridis_c(option = "plasma", trans = "sqrt") +
  geom_sf(data=vias$osm_lines, inherit.aes = FALSE, color="gray", alpha=0.2) +
  geom_sf(data=natural$osm_polygons, inherit.aes = FALSE, fill="#DEF4FC") +
  geom_sf(data=rios$osm_lines, inherit.aes = FALSE, colour="blue", alpha=0.2) +
  geom_sf(data=verde$osm_polygons, inherit.aes = FALSE, colour = "#47632a", fill = "#47632a", alpha = .5) +
  geom_sf(data=vegetacao$osm_polygons, inherit.aes = FALSE, colour = "#47632a", fill = "#47632a", alpha = .5) +
  geom_sf(data=cls, inherit.aes = FALSE, aes(fill=TOTAL, alpha=0.3)) +
  geom_sf(data=P5,  fill='black') +
  geom_text(data=cls, aes(x=X, y=Y, label=cluster), colour= "white", size=5, fontface = "bold", family="Times", check_overlap = FALSE) +
  coord_sf(xlim = c(608693.2, 616136.9), # min & max of x values
           ylim = c(7790024.6, 7797919.5)) + # min & max of y values
  annotation_scale(location = "br", width_hint = 0.5) +
  annotation_north_arrow(location = "br", which_north = "true", 
                         pad_x = unit(0.75, "in"), pad_y = unit(0.5, "in"),
                         style = north_arrow_fancy_orienteering) +
  theme(panel.grid.major = element_line(color = gray(.5), linetype = "dashed", linewidth = 0.5),
        panel.background = element_rect(fill = "aliceblue"),
        panel.border = element_rect(colour = "black", fill=NA, linewidth=1),
        text=element_text(family="Josefin Sans")) +
  labs(title="Belo Horizonte",
       x ="Longitude",
       y = "Latitude",
       fill="N° Imóveis",
       caption = "Fonte: BHMap, Dados Abertos, PRODABEL e PBH",
       subtitle = "Cluster de Densidade - Imóveis Residenciais P5 - Regional CENTRO-SUL")
ggsave('cluster.png', p, bg='transparent')
bairros <-cbind(bairros, st_intersects( bairros, cls, sparse = F ))
lapply(st_intersects(cls, bairros %>% select (NOME)), function(x) {bairros %>% slice(x) %>% pull(NOME)})