# Functions
## create user defined function
greeting <- function() {
  print('Hello World!')
}

greetingsomeone <- function(name) {
  print(paste('Hello, ', name))
}

bond <- function(surname = 'Bond', name = 'James') {
  greeting()
  print(paste("I'm ", surname, ', ', name, ' ', surname))
}

## build your own functions
### add_to_nums()
add_to_nums <- function(x,y) {
  return (x + y)
}

### cube()
cube <- function(base, power = 3) {
  base ** power
}

### count_balls()
balls <- c('Red','Green','Blue','Green','Green','Green','Red')

count_balls <- function(balls,color) {
  sum(balls == color)
}


## looping the DataFrame

for (i in 1:ncol(USArrests)) {
  print(names(USArrests)[i])
  print(mean(USArrests[[i]]))
}

# building the funciton
cal_mean_by_col <- function(df) {
  for (i in 1:ncol(df)) {
    print(names(df)[i])
    print(mean(df[[i]]))
  }
}

# apply() method
apply(mtcars,MARGIN = 2,mean)

apply_mean_by_col <- function(df) {
  print(apply(df,MARGIN = 2,mean))
}


