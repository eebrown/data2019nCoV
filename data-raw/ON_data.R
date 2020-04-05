## Code to prepare `ON_cumulative` dataset goes here.
## Package users ignore this code.

devtools::load_all()

# Ontario cumulative data from 
# https://www.ontario.ca/page/2019-novel-coronavirus

ON_cumulative <- read.csv("data-raw/ON_cumulative.csv")
ON_cumulative$LastUpdated <- as.POSIXct(ON_cumulative$LastUpdated)

usethis::use_data(ON_cumulative, overwrite = TRUE)

# Ontario PHO/MOH data pdf reports

ON_mohreports <- read.csv("data-raw/ON_mohreports.csv")
ON_mohreports$date <- as.POSIXct(ON_mohreports$date)
ON_mohreports$date_data <- as.POSIXct(ON_mohreports$date_data)

usethis::use_data(ON_mohreports, overwrite = TRUE)

devtools::document()
devtools::build_vignettes()
devtools::check()