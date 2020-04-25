# ECDC.R

# Retrieved from https://covid.ourworldindata.org/data/ecdc/full_data.csv
# https://ourworldindata.org/coronavirus-source-data

library(tidyr)
library(plyr)
library(countrycode)

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

devtools::document()
devtools::build_vignettes()
devtools::check()

save(sarscov2_ecdc_2019, file = "sarscov2_who_2019.RData", version = 2)