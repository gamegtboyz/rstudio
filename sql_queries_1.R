# load library
library(sqldf)
library(readr)

# load the data
school <- read.csv('school.csv')
sqldf('SELECT * FROM school;')
sqldf('SELECT avg(student), sum(student) FROM school;')
sqldf('SELECT school_id, school_name, country FROM school;')

sql_query <- "SELECT * FROM school WHERE country = 'USA';"
usa_school <- sqldf(sql_query)
