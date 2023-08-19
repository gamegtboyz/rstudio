# load the csv files
library(readr)
imdb <- read_csv('imdb.csv')

# install the dplyr packages, then load the library
# install.packages('dplyr')
library(dplyr)

# review the structure
glimpse(imdb)

# print head and tail of the data
head(imdb, 5)
tail(imdb,5)

# select columns
select(imdb, MOVIE_NAME, RATING)
select(imdb, 2, 4)

# rename extracted column
select(imdb, new_mname = MOVIE_NAME, released = YEAR)

# pipe operator (%>%) is used for pull the object outside the method like
head(imdb)
imdb %>% head() # this line is identical to the head(df) line

imdb %>%
  select(new_mname = MOVIE_NAME, released = YEAR)

#benefit of pipe operator is that we could build the data pipeline (calculate the output then parse the output into other method)
imdb %>% 
  select(new_m_name = MOVIE_NAME, released = YEAR) %>%
  head(5)

# convert the column name into the lowercase
names(imdb) <- tolower(names(imdb))

# filtering the data
filter(imdb, score >= 9.0)

imdb %>% filter(score >= 9.0)

imdb %>%
  select(movie_name, year, score) %>%
  filter(score >= 9.0)

# filtering with AND condition
imdb %>%
  select(movie_name, year,score) %>%
  filter(score >= 9.0 & year > 2000)

# filtering with OR operator
imdb %>%
  select(movie_name, length, score) %>%
  filter(score == 8.8 | score == 8.3 | score == 9)

# shortcut of OR condition, we use %in% operator
imdb %>%
  select(movie_name, length, score) %>%
  filter(score %in% c(8.3, 8.8, 9.0))

# filtering with String condition
imdb %>% # this will match only exact match
  select(movie_name, genre, rating) %>%
  filter(genre == 'Drama') 

imdb %>% # this will match any record with "Drama" in it
  select(movie_name, genre, rating) %>%
  filter(grepl('Drama', imdb$genre))

imdb %>%
  select(movie_name) %>%
  filter(grepl('king', imdb$movie_name))

# create new columns
imdb %>%
  mutate(score_group = if_else(score >= 9,"Good Flix","Bad Flix"))
