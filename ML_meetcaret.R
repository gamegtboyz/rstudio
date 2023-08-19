library(caret)

mtcars

# split data
  ## define function called train_test_split
train_test_split <- function(data) {
  ## split with 80/20 portion, id will be the array of integer
  set.seed(66)
  n <- nrow(data)
  id <- sample(n,size=0.8*n)
  ## subsetting the train and test data
  train_data <- data[id,]
  test_data <- data[-id,]
  return(list(train_data,test_data)) # return list of lists (train_data and test_data)
}

split_data <- train_test_split(mtcars)

# train model
  ## use train(), which is caret's method to train data
lm_model <- train(mpg ~ hp,  # mpg as y and hp as x
                  data = split_data[[1]],  # use array of train_data as a source
                  method = "lm")  # linear regression model

# score the model
  ## use predict() (caret's method) to predict results of test_data
p <- predict(lm_model, newdata=split_data[[2]])

# evaluate the model
error <- split_data[[2]]$mpg - p  # compare actual value with predicted output
rmse <- sqrt(mean(error**2)) # root mean squared error