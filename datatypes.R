# Numeric
age <- 30
print(age)
class(age)

# Character
my_name <- "Bond"
full_name <- "James Bond"
print(my_name)
print(full_name)
class(my_name);class(full_name)

# logical
result <- 1 + 1 == 2
print(result)
class(result)

# Factor
pets <- c("Dog","Cat","Cat","Hippo")
pets
class(pets)
pets <- factor(pets)
pets
class(pets)

# Date
time_now <- Sys.time()
class(time_now)
