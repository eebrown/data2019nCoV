## Code to prepare `ON_cumulative` dataset goes here.
## Package users ignore this code.

devtools::load_all()

# Ontario cumulative data from 
# https://www.ontario.ca/page/2019-novel-coronavirus

ON_cumulative <- read.csv("data-raw/ON_cumulative.csv")
ON_cumulative$LastUpdated <- as.POSIXct(ON_cumulative$LastUpdated)
ON_cumulative$AsOf <- as.POSIXct(ON_cumulative$AsOf)

usethis::use_data(ON_cumulative, overwrite = TRUE)

# Ontario PHO/MOH data pdf reports

ON_mohreports <- read.csv("data-raw/ON_mohreports.csv")
ON_mohreports$date <- as.POSIXct(ON_mohreports$date)
ON_mohreports$date_data <- as.POSIXct(ON_mohreports$date_data)

usethis::use_data(ON_mohreports, overwrite = TRUE)

## combine into clean object with systematic names WIP


#covidtesting.csv
#conposcovidloc.csv

library(tidyverse)
ON_linelist <- read.csv("data-raw/conposcovidloc.csv")
ON_status <- read.csv("data-raw/covidtesting.csv")

ON_status <- rename(ON_status,
    date = Reported.Date,
    negative = Confirmed.Negative,
    positive = Confirmed.Positive,
    presumptive = Presumptive.Positive,
    resolved = Resolved,
    deaths = Deaths,
    cases = Total.Cases,
    tested_patients = Total.patients.approved.for.testing.as.of.Reporting.Date,
    tests_last_day = Total.tests.completed.in.the.last.day,
    current_investigation = Under.Investigation,
    current_hospitalized = Number.of.patients.hospitalized.with.COVID.19,
    current_ICU = Number.of.patients.in.ICU.with.COVID.19,
    current_ventilator = Number.of.patients.in.ICU.on.a.ventilator.with.COVID.19)

ON_status$date <- as.POSIXct(ON_status$date)

usethis::use_data(ON_status, overwrite = TRUE)
usethis::use_data(ON_linelist, overwrite = TRUE)

devtools::document()
devtools::build_vignettes()
devtools::check()