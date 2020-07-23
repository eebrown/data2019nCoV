## Code to prepare `ON_cumulative` dataset goes here.
## Package users ignore this code.

devtools::load_all()
library(tidyverse)


# Ontario PHO/MOH data pdf reports


ON_mohreports <- read.csv("data-raw/ON_mohreports.csv")
ON_mohreports$date <- as.POSIXct(ON_mohreports$date)
ON_mohreports$date_data <- as.POSIXct(ON_mohreports$date_data, format="%Y-%m-%d %H:%M:%OS")

usethis::use_data(ON_mohreports, overwrite = TRUE)

# ON Status covidtesting.csv https://data.ontario.ca/dataset/status-of-covid-19-cases-in-ontario

update_data_ontario <- function() {

	download.file("https://data.ontario.ca/dataset/f4f86e54-872d-43f8-8a86-3892fd3cb5e6/resource/ed270bb8-340b-41f9-a7c6-e8ef587e6d11/download/covidtesting.csv",
		          destfile = "data-raw/covidtesting.csv")
	ON_status <- read.csv("data-raw/covidtesting.csv")

	ON_status <- rename(ON_status,
	    date = Reported.Date,
	    negative = Confirmed.Negative,
	    negative_presumptive = Presumptive.Negative,
	    positive = Confirmed.Positive,
	    positive_presumptive = Presumptive.Positive,
	    resolved = Resolved,
	    deaths = Deaths,
	    cases = Total.Cases,
	    tested_patients = Total.patients.approved.for.testing.as.of.Reporting.Date,
	    tests_last_day = Total.tests.completed.in.the.last.day,
	    current_investigation = Under.Investigation,
	    current_hospitalized = Number.of.patients.hospitalized.with.COVID.19,
	    current_ICU = Number.of.patients.in.ICU.with.COVID.19,
	    current_ventilator = Number.of.patients.in.ICU.on.a.ventilator.with.COVID.19,
	    deaths_ltc_hcw = Total.LTC.HCW.Deaths,
	    deaths_ltc_residents = Total.LTC.Resident.Deaths,
        cases_ltc_hcw = Total.Positive.LTC.HCW.Cases,
        cases_ltc_residents = Total.Positive.LTC.Resident.Cases)

	ON_status$date <- as.POSIXct(ON_status$date)

	usethis::use_data(ON_status, overwrite = TRUE)

	download.file("https://data.ontario.ca/dataset/f4112442-bdc8-45d2-be3c-12efae72fb27/resource/455fd63b-603d-4608-8216-7d8647f43350/download/conposcovidloc.csv",
		          destfile = "data-raw/conposcovidloc.csv")
	ON_linelist <- read.csv("data-raw/conposcovidloc.csv")

	ON_linelist <- rename(ON_linelist,
		id = Row_ID,
		date = Accurate_Episode_Date,
		age_group = Age_Group,
		gender = Client_Gender,
	    exposure = Case_AcquisitionInfo,
	    outcome = Outcome1,
	    phu = Reporting_PHU,
	    phu_address = Reporting_PHU_Address,
	    phu_city = Reporting_PHU_City,
	    phu_pc = Reporting_PHU_Postal_Code,
	    phu_website = Reporting_PHU_Website,
	    phu_lat = Reporting_PHU_Latitude,
	    phu_long = Reporting_PHU_Longitude)

	usethis::use_data(ON_linelist, overwrite = TRUE)

}

## Legacy

# Ontario cumulative data from 
# https://www.ontario.ca/page/2019-novel-coronavirus

ON_cumulative <- read.csv("data-raw/ON_cumulative.csv")
ON_cumulative$LastUpdated <- as.POSIXct(ON_cumulative$LastUpdated)
ON_cumulative$AsOf <- as.POSIXct(ON_cumulative$AsOf)

usethis::use_data(ON_cumulative, overwrite = TRUE)