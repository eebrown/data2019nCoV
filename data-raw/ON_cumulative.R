## Code to prepare `ON_cumulative` dataset goes here.
## Package users ignore this code.

devtools::load_all()
ON_cumulative <- read.csv("data-raw/ON_cumulative.csv")
ON_cumulative$LastUpdated <- as.POSIXct(ON_cumulative$LastUpdated)

usethis::use_data(ON_cumulative, overwrite = TRUE)

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

#new can data
#can <- read.csv("~/Downloads/covid19.csv")
#library(reshape2)
#dcast(can, date ~ prname, value.var="numconf")

devtools::document()
devtools::build_vignettes()
devtools::check()

