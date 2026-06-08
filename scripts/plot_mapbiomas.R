# Packages
library(ggplot2)
library(dplyr)
library(tidyr)
library(readr)
library(extrafont)

# Load system fonts
loadfonts()

# Read the input data
data <- read_csv("CoverSavanna.csv")
class_int <- ("Formação Savânica")


# Filter the selected class and reshape the data to long format
long_data =
 data |>
  filter(`Nível 2` %in% class_int) |>

  pivot_longer(
    cols = `1985`:`2024`, 
    names_to = "Ano", 
    values_to = "Area_Ha"
  ) |>
  mutate(
    Ano = as.numeric(Ano),
    Area_Mha = Area_Ha / 1000000 
  )

# Build the time-series plot
p <- ggplot(long_data, 
            aes(x = Ano,
                y = Area_Mha,
                color = `Nível 2`,
                group = `Nível 2`)) +
  geom_line(linewidth = 1.2) +
 
  scale_color_manual(
    values = ("Formação Savânica"  = "#80360e"
    )
  ) +

  labs(
    x = "Year",
    y = "Area (Mha)",
    color = NULL
  ) +

  scale_x_continuous(breaks = seq(1985, 2025, by = 5)) +
  
  theme_bw(base_size = 18, base_family = "Aptos") +
  theme(
    legend.position = "none",
    axis.title = element_text(face = "bold", size = 16),
    axis.text = element_text(color = "black", size = 12),
    plot.background = element_rect(fill = "transparent", color = NA),
    panel.background = element_rect(fill = "transparent", color = NA),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.border = element_rect(color = "black", size = 0.8)
  )

# Display the plot
print(p)


ggsave(
  filename = "cover_savanna.png", 
  plot = p,
  width = 6, 
  height = 4, 
  dpi = 300, 
  bg = "transparent"
)
