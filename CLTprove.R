## Central Limit Theorem
library(ggplot2)
library(tidyverse)
library(dplyr)

mu_price <- diamonds %>%
  summarise(mean(price)) %>% # the results of this line is the df object
  pull() # convert df object into the mumeric

# random sampling, bigger the sample, the less variance in stat value ('mean' for this case)
diamonds %>%
  sample_n(30000) %>%
  summarise(mean(price)) %>%
  pull()

# run simulation 1000 times, you'll see that the distribution of mean is in the normal distribution curves
result <- replicate(n=1000,
                    expr = {diamonds %>%
                            sample_n(3000) %>%
                            summarise(mean(price)) %>%
                            pull()})

hist(result) # call for histogram of results.
mean(result) # call for mean of results.
