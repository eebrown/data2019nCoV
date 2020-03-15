## Code to prepare `ON_cumulative` dataset goes here.
## Package users ignore this code.

devtools::load_all()
ON_cumulative <- read.csv("data-raw/ON_cumulative.csv")
ON_cumulative$LastUpdated <- as.Date(ON_cumulative$LastUpdated)

usethis::use_data(ON_cumulative, overwrite = TRUE)

CAN_cumulative <- read.csv("data-raw/CAN_cumulative.csv")
CAN_cumulative$date <- as.Date(CAN_cumulative$date)

usethis::use_data(CAN_cumulative, overwrite = TRUE)

# Once the data in the CSV is updated, run the above code, update the package 
# version, followed by:

devtools::document()
devtools::build_vignettes()
devtools::check()

