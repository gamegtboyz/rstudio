## tuneLength vs tuneGrid

ctrl <- trainControl(
  method = "repeatedcv", # repeated k-fold cv >> this will make 5 * 5 = 25 iterations in total.
  number = 5,
  repeats = 5,
  verboseIter = TRUE
)

model <- train(medv ~ rm + b + crim + lstat + age,
               data = train_data,
               method = "knn",
               metric = "RMSE", # we could set the metric use to help the code use the optimal k
               # tuneLength = 5,
               tuneGrid = data.frame(k=c(5,7,13)), # we could use either length and gric
               preprocess = c("center","scale"),
               trControl = ctrl)

model
