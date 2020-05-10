# Canada data from 
# https://www.canada.ca/en/public-health/services/diseases/2019-novel-coronavirus-infection.html

CAN_cumulative <- read.csv("data-raw/CAN_cumulative.csv")
CAN_cumulative$date <- as.POSIXct(CAN_cumulative$date)

CAN_cumulative$BC <- CAN_cumulative$bc_confirmed + CAN_cumulative$bc_probable
CAN_cumulative$AB <- CAN_cumulative$ab_confirmed + CAN_cumulative$ab_probable
CAN_cumulative$SK <- CAN_cumulative$sk_confirmed + CAN_cumulative$sk_probable
CAN_cumulative$MB <- CAN_cumulative$mb_confirmed + CAN_cumulative$mb_probable
CAN_cumulative$ON <- CAN_cumulative$on_confirmed + CAN_cumulative$on_probable
CAN_cumulative$QC <- CAN_cumulative$qc_confirmed + CAN_cumulative$qc_probable
CAN_cumulative$NL <- CAN_cumulative$nl_confirmed + CAN_cumulative$nl_probable
CAN_cumulative$NB <- CAN_cumulative$nb_confirmed + CAN_cumulative$nb_probable
CAN_cumulative$NS <- CAN_cumulative$ns_confirmed + CAN_cumulative$ns_probable
CAN_cumulative$PE <- CAN_cumulative$pe_confirmed + CAN_cumulative$pe_probable
CAN_cumulative$YT <- CAN_cumulative$yt_confirmed + CAN_cumulative$yt_probable
CAN_cumulative$NT <- CAN_cumulative$nt_confirmed + CAN_cumulative$nt_probable
CAN_cumulative$NU <- CAN_cumulative$nu_confirmed + CAN_cumulative$nu_probable
CAN_cumulative$Repatriated <- CAN_cumulative$repatriated_confirmed + CAN_cumulative$repatriated_probable

usethis::use_data(CAN_cumulative, overwrite = TRUE)

# Once the data in the CSV is updated, run the above code, update the package 
# version, followed by:

update_data_canada <- function() {

	library(tidyr)
	library(plyr)
	#new can data
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
