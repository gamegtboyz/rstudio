# import the relevant packages
library(tidyverse)
library(ggthemes)
View(diamonds)

# question1: price distribution by clarity 
ggplot(diamonds,aes(clarity,price)) +
  geom_violin()

## calculate the price per carat of each diamonds
diamonds <- diamonds %>%
  mutate(price_per_carat = price/carat)

## build the violin chart again using clarity and price per carat
ggplot(diamonds,aes(clarity,price_per_carat)) +
  geom_violin() +
  theme_minimal()

# question2: price distribution by color
ggplot(diamonds,aes(color,price_per_carat)) + 
  geom_violin() +
  theme_minimal()

# question3: Relationship between clarity and size
ggplot(diamonds,aes(carat)) + 
  geom_histogram(bins=50) +
  facet_wrap(~clarity) + 
  theme_wsj()

# question4: Relationship between size and price per carat
ggplot(sample_frac(diamonds,0.2),
       aes(carat,price_per_carat,color=cut)) +
  geom_point(alpha=0.5) + 
  geom_smooth(col="red") +
  theme_minimal()

# question5: Most marketable price points
ggplot(diamonds,aes(price_per_carat)) +
  geom_histogram(bins=100) +
  facet_wrap(~cut)
