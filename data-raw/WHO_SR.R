## code to prepare `WHO_SR` dataset goes here


# SOURCE https://www.who.int/emergencies/diseases/novel-coronavirus-2019/situation-reports


WHO_SR <- read.csv("data-raw/WHO_SR.csv")
WHO_SR$Date <- as.Date(WHO_SR$Date)


usethis::use_data(WHO_SR, overwrite = TRUE)


# Once the data in the CSV is updated, run the above code, update the package version, followed by:

# devtools::build_vignettes()
# devtools::document()
# devtools::check()

