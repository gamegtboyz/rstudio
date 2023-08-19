# import the library onto the files
library(tidyverse)
library(glue)
library(RSQLite)
library(lubridate)
library(dplyr)
library(sqldf)
library(googlesheets4)

# string templates
my_name <- "James"
age <- 40
city <- "London"

glue("Hello, my name is {my_name}, I'm {age} years old, 
and I'm from {city}")

# working with dates
d <- "2023-06-17"
class(d)
d <- ymd(d)
class(d)
dmy(d)
class(d)
d <- "6 October 2023"
d <- dmy(d)
class(d)
d

d <- "April 10, 2023"
d <- mdy(d)
class(d)

# extract the date
year(d)
month(d)
day(d)

# find the day in weeks
wday(d,label=T,abbr=F)

# play with prebuilt datasets, the mtcars
View(mtcars)

# extract columns to console
select(mtcars,am,miles_per_gal = mpg,cyl,disp,hp)

# move rownamess to column
mtcars <- rownames_to_column(mtcars,var='model')

# extract columns with specified condition
select(mtcars, starts_with("m"))
select(mtcars, ends_with("p"))
select(mtcars, contains("a"))

# filter the dataframe
filter(mtcars,hp>100)

# filter with multiple AND condition
filter(mtcars,hp>100,disp>300,mpg>15)

# filter with multiple OR condition
filter(mtcars,hp>100|disp>300|mpg>15)

# filtering with specified names
filter(mtcars,model == "Mazda RX4")

# filter the rows which model name started with "M"
filter(mtcars,grepl("^M",model))

# filter the rows which model name ends with "C"
filter(mtcars,grepl("C$",model))

# filter the rows which model name has numeric character ([0-9]+ means numeric with one or more times.)
filter(mtcars,grepl("[0-9]+",model))

## write dplyr the right way
mtcars %>%
  filter(grepl("[0-9]+",model)) %>%
  select(model,mpg,hp)

# multiple field sorting
mtcars %>%
  arrange(model,mpg,desc(hp)) %>%
  select(model,mpg,hp)

# mutate the dataframe
mtcars %>%
  filter(mpg > 20) %>%
  mutate(model = tolower(model),
         HP_MPG_ratio = round(hp/mpg,2)) %>%
  arrange(desc(HP_MPG_ratio)) %>%
  select(model,hp,mpg,HP_MPG_ratio)

# summarise + groupby
summarise(mtcars,avg_mpg = mean(mpg))
sqldf("select avg(mpg) as avg_mpg from mtcars")

mtcars %>%
  summarise(avg_mpg = mean(mpg))

# mutate the 'am' columns which 0 means AT and otherwise
mtcars <- mtcars %>%
  mutate(am = ifelse(am==0,"AT","MT"))

# summarise using more aggregated function
mtcars %>%
  group_by(am) %>%
  summarise(avg_mpg = mean(mpg),
            sdd_mpg = sd(mpg), 
            sum_mpg = sum(mpg),
            max_mpg = max(mpg),
            min_mpg = min(mpg),
            count_mpg = n())

# build the simple pipeline
mtcars %>%
  select(mpg,hp,wt,am) %>%
  filter(mpg > 15) %>%
  group_by(am) %>%
  summarise(n())

# download .csv files from the internet
df <- read_csv("https://gist.githubusercontent.com/seankross/a412dfbd88b3db70b74b/raw/5f23f993cd87c283ce766e7ac6b329ee7cc2e1d1/mtcars.csv")
View(df)

# convert dataframe into tibble
df <- tibble(df)

# make the sampling
set.seed(66)
df %>%
  select(model) %>%
  sample_n(3)

# made the fraction sampling
df %>%
  sample_frac(0.1)

# create frequency table
df %>%
  mutate(am = ifelse(am==0,"AT","MT")) %>%
  count(am) %>%
  mutate(percent = n/sum(n))

# bind rows (append the rows, like union in SQL)
df1 <- mtcars %>%
  filter(hp>300)

df2 <- mtcars %>%
  filter(hp<=80)

bind_rows(df1,df2)

# stack the dataframe
df3 <- mtcars%>%
  filter(am == "AT")

df4 <- mtcars %>%
  filter(mpg >= 20)

## the original ones, this is redundant
full_df <- df1 %>%
  bind_rows(df2) %>%
  bind_rows(df3) %>%
  bind_rows(df4)

## this is the new way to do it
list_df <- list(df1, df2, df3, df4)
full_df <- bind_rows(list_df)
View(full_df)

# using JOIN
df1 <- data.frame(id = 1:4,
                  name = c("Bernelli","Furuholen","Sierra","Catherine"))
df2 <- data.frame(id = c(1:3,5),
                  city = c("Coimbra","Auch","Bahamar","Mansion"))

#df1 %>%
 # inner_join(df2, by=c('id' = 'cid'))

bind_cols(df1,df2)

# using inner join
inner_join(df1,df2,by='id')

# deal with missing values
df3 <- data.frame(id = 1:5,
                  classes = c("data","data","ux","business",NA))

df1 %>%
  inner_join(df2, by="id") %>%
  inner_join(df3, by="id")

## replace NA values with 'excel' by identify each coordinates
df3[5,2] <- "excel"

## replace all NA values with specified new values
df3$classes <- replace_na(df3$classes, "data engineer")

## using dplyr
df3 <- df3 %>%
  mutate(classes = replace_na(df3$classes, "data architecture"))


# cleaning the missing values with mean of its value
df3 <- data.frame(id = 1:5,
                  classes = c("data","data","ux","business",NA),
                  gpa = c(2.5, 2.8, 2.9, 3, NA))

df3 <- df3 %>%
  mutate(gpa = replace_na(df3$gpa, mean(df3$gpa, na.rm=TRUE)))
