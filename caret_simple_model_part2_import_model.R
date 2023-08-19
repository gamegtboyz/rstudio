## read RDS
model <- readRDS("lm_model.RDS")
model

## load the datasets
data("BostonHousing")

## predict data
predict(model, newdata=BostonHousing[1:20,])
