#write the control flow
## IF
score <- 75

if (score >= 90) {
  print("You've got an A, excellent work!!")
} else if (score >= 80) {
  print("You've got B, still the good one with more dedication.")
} else {
  print("You've failed the test, better to practice")
}


## FOR
bikes <- c('Trek','Specialized','Pinarello','Bianchi','Ridley')

for (i in bikes) {
  print(i)
}

for (j in bikes) {
  print(paste('I love to ride on bikes from',j))
}

### vectorization
paste('I live to ride on bikes from', bikes)

nums <- c(5,10,12,20,25)
nums <- nums+2

## WHILE
count <- 0
while (count <= 5) {
  print(count)
  count <- count + 1
}
