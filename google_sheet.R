## read data from ggsheets
library(googlesheets4)

url <- "https://docs.google.com/spreadsheets/d/1jHaVPQs9BqxDN6vc3OZ-q4Pf9Y-3GEpfm4XssfIWtpI"

gs4_deauth()

df <- read_sheet(url, sheet=1)
