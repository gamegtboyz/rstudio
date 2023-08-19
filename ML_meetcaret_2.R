library(caret)

mtcars

# prepare data
  ## since we plan to predict the 'am' field which is 0/1 factor, we will convert it to readible values
mtcars$am <- factor(mtcars$am,
                    levels=c(0,1), labels=c("AT","MT"))

# split data
  ## define function called train_test_split
train_test_split <- function(data) {
  ## split with 70/30 portion, id will be the array of integer
  set.seed(66)
  n <- nrow(data)
  id <- sample(n,size=0.7*n)
  ## subsetting the train and test data
  train_data <- data[id,]
  test_data <- data[-id,]
  return(list(train_data,test_data)) # return list of lists (train_data and test_data)
}

split_data <- train_test_split(mtcars)

# train model
  ## use train(), which is caret's method to train data
glm_model <- train(am ~ mpg,  # am as y and mpg as x
                  data = split_data[[1]],  # use array of train_data as a source
                  method = "glm")  # logistic regression model (generalized linear model)

# score the model
  ## use predict() (caret's method) to predict results of test_data
p <- predict(glm_model, newdata=split_data[[2]])

# evaluate the model by accuracy
acc <- mean(p == split_data[[2]]$am)