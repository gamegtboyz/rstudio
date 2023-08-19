# Data structures
## Vector
1:10
9:21
seq(from = 1, to = 100, by = 2)
c('this','is','the','sequence','of','values')
### noted that each c could kept only ONE type of data

## Matrix
x <- 1:25
length(x)
dim(x) <- c(5,5)

### we could build a matrix through matrix functions.
### ncol defines the number of columns.
### nrows defines the number of rows.
### byrow defines if the sequence is made by row.
matrix(1:25, ncol = 5)
matrix(1:6,ncol = 3)
matrix(1:12,nrow = 4)
matrix(1:6,ncol = 3, byrow = T)


### we could do the operands through the matrix, every values in matrix will be applied to the operands.
matrix(1:6, nrow = 2, byrow = T) + 100

## List
my_name <- 'James'
my_cars <- c('Aston Martin','Bentley','Lotus')
m1 <- matrix(1:6,ncol=3,byrow=T)
b1 <- as.logical(1)

my_list <- list(item1 = my_name,
                item2 = my_cars,
                item3 = m1,
                item4 = b1)
my_list$item2
my_list$item4


## DataFrame
garage <- c('Trek','Pinarello','Ridley')
my <- c(2016, 2020, 2022)
country <- c('USA','Italy','Belgium')
discipline <- c('Endurance','Allrounder','Aero')
winstherace <- c(TRUE,TRUE,FALSE)

df <- data.frame(garage,
           my,
           country,
           discipline,
           winstherace)

View(df) # call the window view of df


