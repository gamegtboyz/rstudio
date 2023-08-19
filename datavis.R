# call the library
library(tidyverse)

# basic plot in base R
hist(mtcars$mpg)


# analyzing the data
hist(mtcars$hp) # one quantitative variables
mean(mtcars$hp)
median(mtcars$hp)

# check the structures of df
str(mtcars)

# set mtcars$am from num to factor
mtcars$am <- factor(mtcars$am,
                    level = c(0,1),
                    labels = c("AT","MT"))


## bar plot, plot with one qualitative variables
barplot(table(mtcars$am))

### plot the boxplot it's good to identify the outliers
boxplot(mtcars$hp)
### call the five numbers of box plot (min, Q1, Q2, Q3, max)
fivenum(mtcars$hp)

# boxplot and fivenum is common method for box plot exploring.

### fivenum is identical to the following
min(mtcars$hp)
quantile(mtcars$hp, probs = c(.25,.5,.75))
max(mtcars$hp)

# whisker calculation
Q3 <- quantile(mtcars$hp, probs = .75)
Q1 <- quantile(mtcars$hp, probs = .25)
IQR_hp <- Q3 - Q1

## upper whisker
Q3 + 1.5*IQR_hp

## lower whisker
Q1 - 1.5*IQR_hp

## build the boxplot
boxplot.stats(mtcars$hp, coef = 1.5)

## filter out the outliers
mtcars_no_out <- mtcars %>%
  filter(hp < 335)

boxplot.stats(mtcars_no_out$hp, coef = 1.5)

# boxplot with 2 variables
boxplot(mpg ~ am, data = mtcars,
        col = c('red','grey'))

# save the chart >> go click export in files pane

# scatter plot suits 2 quantity variables
plot(mtcars$hp, mtcars$mpg, pch = 16,
     col = 'navy',
     main = 'This is Scatter plot',
     xlab = 'Horsepower',
     ylab = 'Miles per Gallon')

# find correlation
cor(mtcars$hp, mtcars$mpg)

# linear regression
lm(mpg ~ hp, data = mtcars)
