# Logistics Regression Projects (binary classification)
  # build the datasets
happiness <- c(10,8,9,7,8,
               5,9,6,8,7,
               1,1,3,1,4,
               5,6,3,2,0)

divorce <- c(0,0,0,0,0,
             0,0,0,0,0,
             1,1,1,1,1,
             1,1,1,1,1)

df <- data.frame(happiness,divorce)

  # try train model to entire data before split the data
model <- glm(divorce ~ happiness, data = df, family = 'binomial')
summary(model)

  # predict and eveluate the model
df$prob_divorce <- predict(model, type = "response") # try prediction on while datasets
df$pred_divorce <- ifelse(df$prob_divorce >= 0.5,1,0)

  # build the confution matrix
conm <- table(df$pred_divorce, df$divorce,
      dnn = c("Predicted", "Actual"))

  # model eveluation
    # subsetting, just FYI
conm[1,1]
conm[1,2]
conm[2,1]
conm[2,2]

  cat("Accuracy =",(conm[1,1] + conm[2,2])/sum(conm))
  cat("Precision =",conm[2,2]/(conm[2,1] + conm [2,2]))
  cat("Recall =", (conm[2,2]/(conm[1,2] + conm[2,2])))
  
  # calculate F1
cat("F1 score =",2 * ((0.9*0.9)/(0.9+0.9)))

##homework
# download package named 'titanic', then split, train, test

install.packages("titanic")
library(titanic)

# drop na (missing_values)
  ## titanic_train means train data
  ## omit the rows which one of their observations has na values
titanic_train <- na.omit(titanic_train)
nrow(titanic_train)

# split data
set.seed(66)
n <- nrow(titanic_train)
id <- sample(1:n, size = 0.7*n)
train_data <- titanic_train[id,]
test_data <- titanic_train[-id,]

# train and test model with logistics regression
  # train data >> predict survive rate
glm(Survived ~ Pclass + Age, data = train_data, family = "binomial")

  # test data

  # evaluate the model
