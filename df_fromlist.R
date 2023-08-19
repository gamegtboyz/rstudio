## create dataframe from list
garage <- c('Trek','Pinarello','Ridley')
my <- c(2016, 2020, 2022)
country <- c('USA','Italy','Belgium')
discipline <- c('Endurance','Allrounder','Aero')
winstherace <- c(TRUE,TRUE,FALSE)

my_list <- list(garage = garage,
                my = my,
                country = country,
                discipline = discipline,
                winstherace = winstherace)

my_list <- data.frame(my_list)


# subsetting the data
## subsetting by position
garage[-1]
garage[1]
garage[3]
garage[-2]
garage[-3]
garage[c(1,3)]


## subsetting by condition
my[my>=2020]


## subsetting by values
names(my) <- garage
my['Trek']
my[c('Trek','Ridley')]


## subsetting the DataFrame
View(my_list)
