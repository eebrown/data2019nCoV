## code to prepare `WHO_SR` dataset goes here


# SOURCE https://www.who.int/emergencies/diseases/novel-coronavirus-2019/situation-reports


WHO_SR <- read.csv("data-raw/WHO_SR.csv")
WHO_SR$Date <- as.Date(WHO_SR$Date)


usethis::use_data(WHO_SR, overwrite = TRUE)