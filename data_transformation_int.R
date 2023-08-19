# install the library
library(dplyr)
library(readr)
library(tidyverse)

# dataframe vs tibble
tb <- tibble(id = 1:3, name = c('Lorch','Grace','Emilia'))
df <- data.frame(id = 1:3, name = c('Lorch','Grace','Emilia'))

# convert dataframe to tibble
class(tb)
class(df)

# convert df to tibble
mtcars # sample datasets from Rstudio
mtcars_tibble <- tibble(mtcars)

# sampling in R
## manually manipulates the sample
set.seed(66)

## sampling by define the sample size
sample_n(mtcars,5)

## sampling by define the portion of samples to population
### replace = T means allow system to sampling the duplicated samples
sample_frac(mtcars, size=0.2)

# slice the rows
mtcars %>%
  slice(1:5)

## this is the default form of above lines
slice(mtcars, 1:5)

## slice with rows skipping
mtcars %>%
  slice(c(1,3,5))

## slice with sampling
mtcars %>%
  slice(sample(nrow(mtcars),10))
