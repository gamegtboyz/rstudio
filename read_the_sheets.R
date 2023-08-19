# import the library onto the files
library(tidyverse)
library(glue)
library(RSQLite)
library(lubridate)
library(dplyr)
library(sqldf)
library(googlesheets4)

# authenticate the library



# read data from google sheets
url <- "https://docs.google.com/spreadsheets/d/1WhdySzRtA6SnQhGbCZ2JNc6vzjIEoO5SgDtiFPsq9PI/edit?usp=sharing"

# if don't need to access private sheets, use deauth() to indicate that it's no need of token. Then gs4 will turn to deauthorized mode.
gs4_deauth()

# read the sheet
df <- read_sheet(url,sheet=1)
df
