# syntax of ggplot
ggplot(data=mtcars,mapping=aes(x=mpg, y=hp)) +
  geom_point()

ggplot(data=mtcars,mapping=aes(x=mpg)) + 
  geom_histogram()

# we could write it without parameters
ggplot(mtcars,aes(mpg,hp)) + 
  geom_point()

View(mtcars)
mtcars <- tibble(mtcars)

# assign the data and mapping, then save as 'base'
  # two variable as continuous input
base <- ggplot(mtcars,aes(mpg,hp))
base + geom_smooth(col="red", method="lm") + 
  geom_point(size=3, alpha=0.7, col="16161D") +
  theme_minimal()

  # one variable as continuous input
basex <- ggplot(mtcars,aes(hp))
basex + geom_histogram(bins = 10, fill = '#16161D')

  # one variable as discrete input, which have only 1 form; the bar chart
ggplot(mtcars,aes(am)) + geom_bar(fill = 'red4')

  # one discrete variable, another is continuous
ggplot(diamonds,aes(cut,price)) +
  geom_violin() +
  coord_flip() # to flip the chart from vertical to horizontal

  # summarise the data, then build geom_col
agg_price_by_cut <- diamonds %>%
  group_by(cut) %>%
  summarize (
    med_price = median(price)
  ) %>%
  ggplot(aes(cut,med_price)) + geom_col()

  # the shortcuts, we could use qplot
p1 <- qplot(x=price,data=diamonds,geom="histogram",bins=300)
p2 <- qplot(x=carat,y=price,data=diamonds,geom="point")
p3 <- qplot(x=cut,data=diamonds,geom="bar")

  # plot all the charts together
install.packages("patchwork")
library(patchwork)

  # set the chart layout, + means both chart is on the same row, / shows the chart downward
(p1+p2)/p3

# how to deal with overplotting
ggplot(diamonds,aes(carat,price)) + geom_point(alpha=0.3,shape="triangle")

ggplot(sample_n(diamonds,500),aes(carat,price)) + geom_point(alpha=0.3)
ggplot(sample_frac(diamonds,0.05),aes(carat,price)) + geom_point(alpha=0.3)

  # dynamic fill
ggplot(sample_frac(diamonds,0.05),
       aes(carat,price,color=cut)) + 
  geom_point(alpha=0.3) +
  theme_minimal() +
  scale_color_brewer(type="seq",palette=1)

ggplot(sample_frac(diamonds,0.05),
       aes(carat,price,color=price)) + 
  geom_point(alpha=0.3) +
  theme_minimal() +
  scale_color_gradient(low="gold",high="red4")

  # facet, the most powerful features in ggplot
  # facet means segmenting our charts into groups
ggplot(sample_frac(diamonds,0.05),
       aes(carat,price,color=price)) +
  geom_point(alpha=0.3) +
  geom_smooth() +
  theme_minimal() + 
  scale_color_gradient(low="gold",high="red4") + 
  facet_grid(cut~clarity)

# work with labels
ggplot(mtcars,aes(hp,mpg)) +
  geom_point() +
  theme_minimal() +
  labs(
    title = "This is scatter plot",
    subtitle = "Just point the two random variables and it works.",
    x = "HorsePower",
    y = "Miles per Gallon",
    caption = "Source: mtcars"
  )

# build the stack bar chart, and fill the series with color
ggplot(diamonds, aes(cut,fill=color)) + 
  geom_bar(position="identity") + 
  theme_minimal()

# install the themes for ggplot using ggthemes
install.packages("ggthemes")
library(ggthemes)

ggplot(diamonds, aes(cut,fill=color)) + 
  geom_bar(position="identity") + 
  theme_wsj()

# markdown
# go to file > new file > r markdown
