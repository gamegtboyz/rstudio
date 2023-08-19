# load the library
library(RSQLite)

# connect to SQLinte database (.db files)
## 1. Open connection
conn <- dbConnect(SQLite(),'chinook.db')

## 2. Get data
dbListTables(conn)
dbListFields(conn,'customers')

df <- dbGetQuery(conn, "SELECT * FROM customers WHERE country = 'USA'")
df2 <- dbGetQuery(conn,"SELECT * FROM customers WHERE country = 'United Kingdom'")

## 3. Close connection (after opening the connection, we have to close it.)
dbDisconnect(conn)
