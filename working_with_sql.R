library(RSQLite)

# [1] create connect
con <- dbConnect(SQLite(), "chinook.db")

# [2] list tables
dbListTables(con)

# [3] list fields
dbListFields(con, "customers")

# [4] query data
df1 <- dbGetQuery(con, "select * from customers")

df1 <- df1 %>%
  mutate(Company = replace_na(Company, "woohoo!"))

# [5] write table
shipping <- data.frame(id=1:3,
                       shipping_class = c("regular", "premium", "super premium"))

dbWriteTable(con, "shipping", shipping)

dbGetQuery(con, "select * from shipping")

# [6] drop table?
dbRemoveTable(con, "shipping")
dbListTables(con)

# [7] close connection
dbDisconnect(con)

## -----------------------------------------
## connect to SQL server (postgresql)

library(RPostgreSQL)
library(tidyverse)

con <- dbConnect(PostgreSQL(), 
                 host = "arjuna.db.elephantsql.com",
                 port = 5432,
                 user = "fznjhnsz",
                 password = "sA-nupVgZlAkJeb1A2aoQSv58hlnhNGK",
                 dbname = "fznjhnsz")

dbListTables(con)

pizza_menu <- data.frame(
  id = 1:3,
  name = c("hawaiian", "hotdog", "cheese")
)

dbWriteTable(con, "pizza_menu", pizza_menu)

## get data
dbGetQuery(con, "select * from pizza_menu")

## create another table
customers <- data.frame(id=1:2, name=c("Toy","John"))
dbWriteTable(con, "customers", customers)

dbListTables(con)
dbRemoveTable(con, "pizza_menu")
dbRemoveTable(con, "customers")

# close connection?
dbDisconnect(con)


## HW02 - create database on POstgresql => create a few tables about pizza restaurants











