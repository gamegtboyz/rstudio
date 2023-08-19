# import the relevant library
library(nycflights13)


# view the datasets
View(flights)
# preview the datatype and metadata
glimpse(flights) 

# filter the data
flights %>%
  count(month)

flights %>%
  group_by(month) %>%
  summarize(count = n())

## what carrier has the most flight in Feb'13
flights %>%
  filter(month == 2) %>%
  select(carrier) %>%
  group_by(carrier) %>%
  summarise(flights_count = n()) %>%
  arrange(desc(flights_count)) %>%
  head(10) %>%
  left_join(airlines,by='carrier')

# use the new datasets
glimpse(airlines)
