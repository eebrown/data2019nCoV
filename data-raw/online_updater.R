# online_updater.R

update_data_ecdc <- function() {

	download.file("https://covid.ourworldindata.org/data/ecdc/full_data.csv",
		          destfile = "data-raw/full_data.csv")
	ECDC_owid <- read.csv("data-raw/full_data.csv")

	ECDC_owid$date <- as.Date(ECDC_owid$date)

	usethis::use_data(ECDC_owid, overwrite = TRUE)

	ECDC_owid$location <- tolower(countrycode(ECDC_owid$location, 
		                              origin="country.name", destination="genc3c",
		                              custom_match=c(International="international", 
		                              	Timor="TLS", Kosovo="Kosovo", 
		                              	World="global")))

	cases <- pivot_wider(ECDC_owid, names_from = location, 
		                 values_from = total_cases, 
		                 id_cols = date, names_prefix = "cases_")

	deaths <- pivot_wider(ECDC_owid, names_from = location, 
		                  values_from = total_deaths, 
		                  id_cols = date, names_prefix = "deaths_")

	sarscov2_ecdc_2019 <- merge(cases, deaths, by = "date")

	usethis::use_data(sarscov2_ecdc_2019, overwrite = TRUE)

}

update_data_canada <- function() {

	download.file("https://health-infobase.canada.ca/src/data/covidLive/covid19.csv",
		          destfile = "data-raw/covid19.csv")
	can <- read.csv("data-raw/covid19.csv", stringsAsFactors=FALSE)
	can$date <- as.Date(can$date, format = "%d-%m-%y")

	can$prname <- revalue(can$prname, c("Alberta"="AB", "British Columbia" = "BC", 
		                  "Canada" = "CAN", "Manitoba" = "MB", 
		                  "New Brunswick" = "NB",
		                  "Newfoundland and Labrador" = "NL",
		                  "Northwest Territories" = "NT", "Nova Scotia" = "NS",
		                  "Nunavut" = "NU", "Ontario" = "ON", 
		                  "Prince Edward Island" = "PE", "Quebec" = "QC",
		                  "Repatriated travellers" = "Repatriated", 
		                  "Saskatchewan" = "SK", "Yukon" = "YT"))

	can_cases <- pivot_wider(can, names_from = prname, values_from = numconf, 
		                     id_cols = date, names_prefix = "cases_")
	can_deaths <- pivot_wider(can, names_from = prname, values_from = numdeaths, 
		                      id_cols = date, names_prefix = "deaths_")
	can_prob <- pivot_wider(can, names_from = prname, values_from = numprob, 
		                      id_cols = date, names_prefix = "probable_")
	can_tested <- pivot_wider(can, names_from = prname, values_from = numtested, 
		                      id_cols = date, names_prefix = "tested_")
	can_recovered <- pivot_wider(can, names_from = prname, values_from = numrecover, 
		                      id_cols = date, names_prefix = "recovered_")
	can_total <- pivot_wider(can, names_from = prname, values_from = numtotal, 
		                      id_cols = date, names_prefix = "total_")

	can2 <- merge(as.data.frame(can_cases), as.data.frame(can_deaths), by = "date")
	can2 <- merge(as.data.frame(can2), as.data.frame(can_prob), by = "date")
	can2 <- merge(as.data.frame(can2), as.data.frame(can_tested), by = "date")
	can2 <- merge(as.data.frame(can2), as.data.frame(can_recovered), by = "date")
	can2 <- merge(as.data.frame(can2), as.data.frame(can_total), by = "date")

	CAN_govcsv <- can2

	usethis::use_data(CAN_govcsv, overwrite = TRUE)

}

update_data_ontario <- function() {

	ON_url <- "https://data.ontario.ca/dataset/f4f86e54-872d-43f8-8a86-3892fd3cb5e6/resource/ed270bb8-340b-41f9-a7c6-e8ef587e6d11/download/covidtesting.csv"
	download.file("https://data.ontario.ca/dataset/f4f86e54-872d-43f8-8a86-3892fd3cb5e6/resource/ed270bb8-340b-41f9-a7c6-e8ef587e6d11/download/covidtesting.csv",
		          destfile = "data-raw/covidtesting.csv")
	ON_status_raw <- read.csv("data-raw/covidtesting.csv")

	ON_status <- rename(ON_status_raw,
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
	    current_ventilator = Number.of.patients.in.ICU.on.a.ventilator.with.COVID.19)

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

update_data <- function() {
	library(plyr)
	library(tidyverse)
    library(countrycode)
    message("Updating Ontario data...")
	update_data_ontario()
	message("Updating Canada data...")
	update_data_canada()
	message("Updating ECDC data...")
	update_data_ecdc()
}

# potential

# http://www.bccdc.ca/Health-Info-Site/Documents/BCCDC_COVID19_Dashboard_Case_Details.csv
# http://www.bccdc.ca/Health-Info-Site/Documents/BCCDC_COVID19_Dashboard_Lab_Information.csv


