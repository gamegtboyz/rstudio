## bind_rows() method

library(dplyr)
library(readxl)

#read excel file
econ <- read_excel('students.xlsx',sheet=1)
business <- read_excel('students.xlsx',sheet=2)
data <- read_excel('students.xlsx',sheet=3)

# bind rows = UNION ALL
bind_rows(econ, business, data)


## bind_cols() method
df1 <- data.frame(
  id = 1:5,
  brand = c('Trek','Trek','Specialized','Look','Canyon')
)

df2 <- data.frame(
  id = 1:5,
  model = c('Madone','Domane','Tarmac SL7','785 Madison','Aeroad'),
  discipline = c('Aero','Endurance','Allrounder','Track','Aero')
)

left_join(df1,df2,by='id')
