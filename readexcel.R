# Try to read each sheet using loop
## 1. Build the blank list named 'results'
result <- list()

## 2. Build the loop using read_excel() to read each worksheet. Then keep it in 'result'.
for (i in 1:3) {
  result[[i]] <- read_excel('students.xlsx',sheet=i)
}
