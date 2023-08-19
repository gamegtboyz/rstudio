# import the library
library(tidyverse)
library(caret)
library(mlbench)
library(glmnet)
library(rpart)
library(rpart.plot)

data("PimaIndiansDiabetes")

df <- PimaIndiansDiabetes

# split data
set.seed(66)
n <- nrow(df)
id <- sample(n, size=0.8*n)
train_df <- df[id, ]
test_df <- df[-id, ]

# train model

ctrl <- trainControl(method = "cv",
                     number = 5,
                     verboseIter = TRUE)

logistic_model <- train(diabetes ~ .,
                        data = train_df,
                        method = "glm",
                        trControl = ctrl)

## regularized (ridge/lasso) regression

my_grid <- expand.grid(alpha = 0:1,
                       lambda = c(0.0005, 0.05))

glmnet_model <- train(diabetes ~ .,
                      data = train_df,
                      method = "glmnet",
                      tuneGrid = my_grid,
                      trControl = ctrl)

## decision tree
tree_model <- train(diabetes ~ .,
                    data = train_df,
                    method = "rpart",
                    tuneGrid = expand.grid(cp = c(0.02,0.1,0.25)), # cp == complexity parameter, the more cp means good generalization
                    trControl = ctrl)

rpart.plot(tree_model$finalModel) # build the decision tree

## random forest
rf_model <- train(diabetes ~ .,
                  data = train_df,
                  method = "rf",
                  tuneLength = 5,
                  trControl = ctrl)

## resamples() =>  compare model performance
### predict diabetes (log , rt, rf, glmnet)

model1 <- train(diabetes ~ .,
              data=train_df,
              method = "glm",
              trControl = trainControl(
                method="cv",number=5
              ))

model2 <- train(diabetes ~ .,
               data=train_df,
               method = "rpart",
               trControl = trainControl(
                 method="cv",number=5
               ))

model3 <- train(diabetes ~ .,
               data=train_df,
               method = "rf",
               trControl = trainControl(
                 method="cv",number=5
               ))

model4 <- train(diabetes ~ .,
               data=train_df,
               method = "glmnet",
               trControl = trainControl(
                 method="cv",number=5
               ))

model5 <- train(diabetes ~ .,
                data=train_df,
                method = "nnet",
                trControl = trainControl(
                  method="cv",number=5
                ))
## resamples
list_models = list(
  logistic = model1,
  tree = model2,
  randomForest = model3,
  glmnet = model4,
  nnet = model5
)

result <- resamples(list_models)
summary(result)

# test model
p <- predict(logistic_model, newdata=test_df)

# evaluate model
confusionMatrix(p, test_df$diabetes,# caret function
                positive = "pos", # define the positive value (logistic regression)
                mode = "prec_recall") # this line is optional
# precision = 37/(11+37)
# recall = 37/(24+37)
