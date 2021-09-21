data(iris)
library(ggplot2)

ggplot(iris) +
  aes(x = Sepal.Length, fill = Species) +
  geom_histogram(bins = 30L) +
  scale_fill_brewer(palette = "Pastel1", direction = 1) +
  labs(title = "Petal Length") +
  theme_minimal() +
  theme(plot.title = element_text(size = 20L, hjust = 0.5))
 

