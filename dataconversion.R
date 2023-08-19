# convert data types

# main functions
# as.numeric()
# as.character()
# as.logical()

x <- 100
class(x)
char_x <- as.character(x)
class(char_x)
num_x <- as.numeric(char_x)
class(num_x)


# logical is either 0 or 1
as.logical(0)
as.logical(1)
as.numeric(F)
as.numeric(T)