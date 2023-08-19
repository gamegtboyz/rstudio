# import the relevant library
library(RSQLite)

# to work with .db files, we need to do the following steps
# step 1.1: build up the connection
# the below line indicates that we will work with SQLite() and route to file named 'chinook.db' which is placed in wd
con <- dbConnect(SQLite(),"chinook.db")

# step 1.2: call the list of the tables in dataset
dbListTables(con)

# step 1.3: list the field names of each table
dbListFields(con,"customers")

## this could be called that the connection is completed

# step 2: query the data
df1 <- dbGetQuery(con, "select * from customers")
View(df1)

us_customers <- dbGetQuery(,"select * from customers where country = 'USA'")
View(us_customers)

# from US customers, we see the null values which we like to deal with it
us_customers <- dbGetQuery(con,"select *, coalesce(company,'individual customers') as Company_cleaned from customers where country = 'USA'")

# clean data, but using pipe (since df1 is dataframe so we could apply dplyr method to handling the data)
df1 <- df1 %>%
  mutate(Company = ifelse(is.na(Company),'Individual Customers',Company))

# write the new table onto db
shipping <- data.frame(id=1:3,
                       shipping_class = c('regular','registered','express'))

dbWriteTable(con,"shipping",shipping)
dbListTables(con)

# delete the existing table from db
dbRemoveTable(con, "shipping")

# step 3: close the connection
dbDisconnect(con)

#### ------------------------ ####
### after we built the instance from PostgreSQL server, we will do sone work here ###

# install the packages
install.packages("RPostgreSQL")
library(RPostgreSQL)

# connect to server
con <- dbConnect(PostgreSQL(),
          host = "tiny.db.elephantsql.com",
          port = 5432, # this is the default port to PostgreSQL
          user = "azvclwby",
          password = "ySFC8LDURhiH6AWZ9cBiRYAByBMpMuCc",
          dbname = "azvclwby") # db name same as user

# build up the database
pizza_menu <- data.frame(
  id = 1:3,
  name = c("Hawaiian","Meat Lover","Double Cheese")
)

dbWriteTable(con,"pizza_menu",pizza_menu)

# read the data
dbGetQuery(con,"select * from pizza_menu")

# build the new table
customers <- data.frame(
  id = 1:2,
  name = c("Bernelli","Furuholen")
)

dbWriteTable(con,"customers",customers)

dbGetQuery(con,"select * from customers")

# call list of all tales
dbListTables(con)

# delete the table
dbRemoveTable(con, "pizza_menu")
dbRemoveTable(con, "customers")

# close the connection
dbDisconnect(con)
