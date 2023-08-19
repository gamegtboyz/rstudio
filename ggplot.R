# ggplot2
# import tidyverse
library(tidyverse)
library(dplyr)

# plot the first ggplot
## geom_point() means scatter plot
ggplot(data = mtcars, mapping = aes(x = hp, y = mpg)) + 
  geom_point()

## we could brief the methods as follows
ggplot(mtcars,aes(x=hp,y=mpg)) +
  geom_point()

## plot the another layer of above chart with the smooth curve
ggplot(data = mtcars, mapping = aes(x = hp, y = mpg)) +
  geom_point() +
  geom_smooth()

## plot the another layer of above chart with rug plot (distribution of x and y values)
ggplot(data = mtcars, mapping = aes(x = hp, y = mpg)) +
  geom_point() +
  geom_smooth() +
  geom_rug()

# customize the size
ggplot(mtcars,aes(x=hp,y=mpg)) +
  geom_point(size=3,col='darkslategrey',alpha=0.7)

# plot the histogram
### by default, bins is 30 which we could customize it
ggplot(mtcars,aes(hp)) +
  geom_histogram(bins = 16,fill = 'darkred',alpla=0.5)

# build the box plot
ggplot(mtcars,aes(hp)) +
  geom_boxplot()

# we could save the plot setting as variables so we could use it as references.
p <- ggplot(mtcars,aes(hp))

p + geom_histogram(bins=10)
p + geom_density()
p + geom_boxplot()

# try to build the box plot with multiple varuables, we will try it with the new datasets
## see the grouping of each class of cut
diamonds %>%
  count(cut)

## plot the bar chart group by cut
ggplot(diamonds,aes(cut)) +
  geom_bar(fill = 'red4')

## see the grouping of each color
diamonds %>%
  count(color)

## map the diamonds$color to diamonds$cut
ggplot(diamonds,mapping = aes(cut,fill=color)) +
  geom_bar(position='stack') # default setting

## customize the position, make it not stack
ggplot(diamonds,mapping = aes(cut,fill=color)) +
  geom_bar(position='dodge')

## customize the position, make it shows the proportion
ggplot(diamonds,mapping = aes(cut,fill=color)) +
  geom_bar(position='fill')

# find the relationship between carat and price, we will use scatter plot for this study
ggplot(diamonds, aes(carat,price)) +
  geom_point()

### plotting with this datasets will take the time due to data size so we will try to sampling it
small_diamonds <- sample_n(diamonds, 5000)

ggplot(small_diamonds, aes(carat,price)) +
  geom_point()

# try facet: small multiple scatter charts, with linear equation, minimal themes(background), labels
ggplot(small_diamonds, aes(carat,price)) +
  geom_point() +
  geom_smooth(method = 'lm', col='red4') +
  facet_wrap(~color, ncol=2) +
  theme_minimal() +
  labs(title='carat and price scatter chart by color',
       x = 'carat',
       y = 'price(USD)',
       caption = 'source: sampling dataset')

# map the color with facet
ggplot(small_diamonds, aes(carat,price, col=cut)) +
  geom_point(size = 2, alpla = 0.3) +
  geom_smooth(method = 'lm', col='red4') +
  facet_wrap(~color, ncol=2) +
  theme_minimal() +
  labs(title='carat and price scatter chart by color',
       x = 'carat',
       y = 'price(USD)',
       caption = 'source: sampling dataset')
