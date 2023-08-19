## try new model of resampling from bootstrap 25 iterations to LOOCV

data("BostonHousing") # load the datasets
View(BostonHousing) # we will forecast 'medv' 

## rename the datasets since it's too long
df <- BostonHousing
## check if data is complete
mean(complete.cases(df)) # 1 means there's no null values

# 1. trian test split
split_data <- function(df,train_size=0.8) {
  set.seed(66)
  n <- nrow(df)
  id <- sample(1:n, size=n*train_size)
  train_df <- df[id,]
  test_df <- df[-id,]
  return(list(train=train_df, test=test_df))
}

prep_data <- split_data(df)
train_data <- prep_data[[1]]
test_data <- prep_data[[2]]

# 2. train model

## build the trian control
ctrl <- trainControl(
  # change resampling technique from bootstrap 25 to 50
  method = "CV",
  number = 10,
  verboseIter = TRUE # will print the log into console.
)

model <- train(medv  ~ rm + b + crim,
               data = train_data,
               method = "lm",
               trControl = ctrl)

## variable importance
varImp(model)

## see the results
model
"""
### results description 
we made the train on 404 samples
based on 3 independent vaiables (predictor)
the model resampling using bootstrapped by 25 iterations(reps) as a default settings
RMSE, Rsquared, and MAE shown as mean across 25 iterations
  RMSE      Rsquared   MAE     
  6.452399  0.5378308  4.255888

"""
model$finalModel
"""
this will show coefficients to each variables, and intercept

"""

# 3. score/predict new data
p <- predict(model,newdata=test_data)
p

# 4. evaluate model
cal_mae <- function(actual,pred) {
  error <- actual - pred
  return(mean(abs(error)))
}

cal_mse <- function(actual,pred) {
  error <- actual - pred
  return(mean(error**2))
}

cal_rmse <- function(actual,pred) {
  error <- actual - pred
  return(sqrt(mean(error**2)))
}

cal_mae(test_data$medv,p)
cal_mse(test_data$medv,p)
cal_rmse(test_data$medv,p)
"""
> cal_mae(test_data$medv,p)
[1] 3.57368
> cal_mse(test_data$medv,p)
[1] 24.01905
> cal_rmse(test_data$medv,p)
[1] 4.900923 ## a bit lower than trained model, which is good
"""