library(caret)
library(tidyverse)

# build up and clean the datasets, this is data transformation knowledge
full_df <- mtcars %>%
  select(mpg,hp,wt,am)

## check complete cases (no missing values) for each observation >> this should return 1
complete.cases(full_df) %>% mean()

## drop row with missing values (data transformation), if any
clean_df <- full_df %>% drop_na()
### otherwise, we could use replace_na() with designated values e.g. mean

# split data
## define function called train_test_split
split_data <- function(df) {

  set.seed(66)  # set random seed
  n <- nrow(df)  # want to know how much observation we have 
  id <- sample(n,size=0.8*n)  # random sampling, define train/test portion as 80/20 (bigger the observation, bigger train portion)
  train_df <- df[id,]  # return the array of selected sampling
  test_df <- df[-id,]  # what we not selected from trained datasets
  return(list(training = train_df,
              testing = test_df))  # return list of lists
}

prep_data <- split_data(clean_df)

# train model

lm_model <- train(mpg ~ .,  # we could use multiple x using +, . means all x columns
                  data = prep_data[[1]],
                  method = "lm")

# score the model

p <- predict(lm_model,newdata=prep_data[[2]])

# evaluate the model
## calculate the error for each observation
err <- prep_data[[2]]$mpg - p
## find mean absolute error
mae <- mean(abs(err))
## find RMSE
rmse <- sqrt(mean(err**2))


## find out how importance of each variables for y forecast
varImp(lm_model)
