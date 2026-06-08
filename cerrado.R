library(ggplot2)
library(sf)
library(geobr)


# Dados oficiais IBGE via geobr
brazil   <- read_country(year = 2020)
biomes   <- read_biomes(year = 2019)
cerrado  <- biomes[biomes$name_biome == "Cerrado", ]

# Mapa
ggplot() +
  geom_sf(data = brazil,  fill = "#DDD0C0", color = "#5A4A3A", linewidth = 0.8) +
  geom_sf(data = cerrado, fill = "#C17F3A", color = "#8B5E14", alpha = 0.88, linewidth = 0.6) +
  theme_void() +
  theme(
    panel.background = element_rect(fill = "transparent", color = NA),
    plot.background  = element_rect(fill = "transparent", color = NA)
  )

ggsave("cerrado_map.png", width = 8, height = 8, dpi = 300, bg = "transparent")
