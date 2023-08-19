# import the library
library(tidyverse)
library(caret)
library(mlbench)
library(glmnet)
library(rpart)
library(rpart.plot)

data("BostonHousing")

mini_house <- BostonHousing %>%
  select(medv,rm,age,dis)

# normalization min-max scaling
normalize_data <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}

# apply functions to all columns
apply(mini_house, 2, normalize_data) # apply normalize_data function onto each columns of table mini_house


# kmeans clustering
km_result <- kmeans(mini_house, centers = 5) # center is arbitary, but we could discuss with users
km_result$size

# assign cluster back to dataframe
mini_house$cluster <- km_result$cluster

View(mini_house)

# run descriptive stats
mini_house %>% 
  group_by(cluster) %>%
  summarize(avg_price = mean(medv),
            avg_rm = mean(medv))
