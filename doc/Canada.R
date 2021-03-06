## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(data2019nCoV)

library(tidyr)
library(dplyr)
library(ggplot2)
library(scales)
library(data.table)
#library(lubridate)

CAN_govcsv$date[length(CAN_govcsv$date)]

## ---- fig.width=6, fig.height=6-----------------------------------------------

gather(CAN_govcsv, key, value, 
       total_BC, total_AB, total_SK, total_MB, total_ON,
       total_QC, total_NL, total_NB, total_NS,total_PE,
       total_YT, total_NT, total_NU, total_Repatriated
       ) %>%
  ggplot(aes(x=date, y=value, col=key)) +
  geom_line() +
  theme(legend.position="right") +
  labs(title = "Confirmed Cases by Province",
       x = "Date", 
       y = "Confirmed Cases") +
  theme(legend.title = element_blank())


gather(CAN_govcsv, key, value, 
       total_BC, total_AB, total_SK, total_MB, total_ON,
       total_QC, total_NL, total_NB, total_NS,total_PE,
       total_YT, total_NT, total_NU, total_Repatriated
       ) %>%
  ggplot(aes(x=date, y=value, col=key)) +
  geom_line() +
  scale_y_continuous(trans = 'log10', labels = comma) +
  theme(legend.position="right") +
  labs(title = "Confirmed Cases by Province (Semilog.)",
       x = "Date", 
       y = "Confirmed Cases") +
 theme(legend.title = element_blank())

daily_change <- function(series) {
  change <- c(series, NA) - c(NA, series)
  change <- change[-1]
  change <- change[-length(change)]
  return(change)
}



## ---- fig.width=6, fig.height=6-----------------------------------------------
gather(CAN_govcsv, key, value, 
       deaths_BC, deaths_AB, deaths_SK, deaths_MB, deaths_ON,
       deaths_QC, deaths_NL, deaths_NB, deaths_NS, deaths_PE,
       deaths_YT, deaths_NT, deaths_NU, deaths_Repatriated
       ) %>%
  ggplot(aes(x=date, y=value, col=key)) +
  geom_line() +
  theme(legend.position="right") +
  labs(title = "Confirmed Deaths by Province",
       x = "Date", 
       y = "Confirmed Deaths") +
  theme(legend.title = element_blank())


CAN_govcsv$cfr_BC <- (CAN_govcsv$deaths_BC / CAN_govcsv$total_BC) * 100
CAN_govcsv$cfr_AB <- (CAN_govcsv$deaths_AB / CAN_govcsv$total_AB) * 100
CAN_govcsv$cfr_SK <- (CAN_govcsv$deaths_SK / CAN_govcsv$total_SK) * 100
CAN_govcsv$cfr_MB <- (CAN_govcsv$deaths_MB / CAN_govcsv$total_MB) * 100
CAN_govcsv$cfr_ON <- (CAN_govcsv$deaths_ON / CAN_govcsv$total_ON) * 100
CAN_govcsv$cfr_QC <- (CAN_govcsv$deaths_QC / CAN_govcsv$total_QC) * 100
CAN_govcsv$cfr_NL <- (CAN_govcsv$deaths_NL / CAN_govcsv$total_NL) * 100
CAN_govcsv$cfr_NB <- (CAN_govcsv$deaths_NB / CAN_govcsv$total_NB) * 100
CAN_govcsv$cfr_NS <- (CAN_govcsv$deaths_NS / CAN_govcsv$total_NS) * 100
CAN_govcsv$cfr_PE <- (CAN_govcsv$deaths_PE / CAN_govcsv$total_PE) * 100
CAN_govcsv$cfr_YT <- (CAN_govcsv$deaths_YT / CAN_govcsv$total_YT) * 100
CAN_govcsv$cfr_NT <- (CAN_govcsv$deaths_NT / CAN_govcsv$total_NT) * 100
CAN_govcsv$cfr_NU <- (CAN_govcsv$deaths_NU / CAN_govcsv$total_NU) * 100
CAN_govcsv$cfr_Repatriated <- (CAN_govcsv$deaths_Repatriated / CAN_govcsv$total_Repatriated) * 100

gather(CAN_govcsv, key, value, 
       cfr_BC, cfr_AB, cfr_SK, cfr_MB, cfr_ON,
       cfr_QC, cfr_NL, cfr_NB, cfr_NS, cfr_PE
       ) %>%
  ggplot(aes(x=date, y=value, col=key)) +
  geom_line() +
  theme(legend.position="right") +
  labs(title = "Case Fatality Rates by Province",
       x = "Date", 
       y = "Case Fatality Rate") +
  theme(legend.title = element_blank())


## ---- fig.width=8, fig.height=6-----------------------------------------------
# start from March 11, when reports were daily, consistently
range <- 17:length(CAN_govcsv$date)-1

# merge the provinces into the regions used in the manuscript
Ontario <- frollmean(daily_change(CAN_govcsv$total_ON), 7)
Alberta <- frollmean(daily_change(CAN_govcsv$total_AB), 7)
Saskatchewan <- frollmean(daily_change(CAN_govcsv$total_SK), 7)
Manitoba <- frollmean(daily_change(CAN_govcsv$total_MB), 7)
Atlantic <- frollmean((daily_change(CAN_govcsv$total_NS)+
                         daily_change(CAN_govcsv$total_NB)+
                         daily_change(CAN_govcsv$total_NL)+
                         daily_change(CAN_govcsv$total_PE)), 7)
BritishColumbia <- frollmean(daily_change(CAN_govcsv$total_BC), 7)
Quebec <- frollmean(daily_change(CAN_govcsv$total_QC), 7)

NovaScotia <- frollmean(daily_change(CAN_govcsv$total_NS), 7)
NewBrunswick <- frollmean(daily_change(CAN_govcsv$total_NB), 7)
Newfoundland <- frollmean(daily_change(CAN_govcsv$total_NL), 7)
PEI <- frollmean(daily_change(CAN_govcsv$total_PE), 7)



#plot the data

ON_pop <- 14745040
QC_pop <- 8552362
AB_pop <- 4428247 
SK_pop <- 1181987
MB_pop <- 1379121
Atl_pop <- 978274 + 780890 + 520437 + 158717
BC_pop <- 5120184

NS_pop <- 978274
NB_pop <- 780890
NL_pop <- 520437
PEI_pop <- 158717

matplot(as.Date(CAN_govcsv$date[range]), cbind( 
                      Ontario[range],
                      Quebec[range],
                      Alberta[range],
                      Manitoba[range],
                      Saskatchewan[range],
                      Atlantic[range],
                      BritishColumbia[range]),
     main = "7-day rolling average of daily new COVID-19 cases",
     xlab = "Date",
     ylab = "Daily Change in Reported Cases",
     type = "l",
     lty = "solid",
     col =    c("green", "blue", "orange", "black", "yellow", 
                  "purple", "red"),
     xaxt="n")
dates<-format(CAN_govcsv$date,"%b-%d")
axis(1, at=CAN_govcsv$date, labels=dates)
legend(x="topleft", 
       legend = c("Ontario", "Quebec", "Alberta", "Manitoba", 
                  "Saskatechewan", "Atlantic", "British Columbia"), 
       col =    c("green", "blue", "orange", "black", "yellow", 
                  "purple", "red"), 
       pch=18)

matplot(as.Date(CAN_govcsv$date[range]), cbind( 
                      (Ontario[range]/ON_pop)*1000000,
                      (Quebec[range]/QC_pop)*1000000,
                      (Alberta[range]/AB_pop)*1000000,
                      (Manitoba[range]/MB_pop)*1000000,
                      (Saskatchewan[range]/SK_pop)*1000000,
                      (Atlantic[range]/Atl_pop)*1000000,
                      (BritishColumbia[range]/BC_pop)*1000000),
     main = "7-day rolling average of daily new COVID-19 cases per million",
     xlab = "Date",
     ylab = "Daily Change in Reported Cases per Million (7-day avg.)",
     type = "l",
     lty = "solid",
     col =    c("green", "blue", "orange", "black", "yellow", 
                  "purple", "red"),
     xaxt="n")
dates<-format(CAN_govcsv$date,"%b-%d")
axis(1, at=CAN_govcsv$date, labels=dates)
legend(x="topleft", 
       legend = c("Ontario", "Quebec", "Alberta", "Manitoba", 
                  "Saskatechewan", "Atlantic", "British Columbia"), 
       col =    c("green", "blue", "orange", "black", "yellow", 
                  "purple", "red"), 
       pch=18)

matplot(as.Date(CAN_govcsv$date[range]), cbind( 
                      (Ontario[range]/ON_pop)*1000000,
                      (Quebec[range]/QC_pop)*1000000,
                      (Alberta[range]/AB_pop)*1000000,
                      (Manitoba[range]/MB_pop)*1000000,
                      (Saskatchewan[range]/SK_pop)*1000000,
                      (NovaScotia[range]/NS_pop)*1000000,
                      (NewBrunswick[range]/NB_pop)*1000000,
                      (Newfoundland[range]/NL_pop)*1000000,
                      (PEI[range]/PEI_pop)*1000000,
                      (BritishColumbia[range]/BC_pop)*1000000),
     main = "7-day rolling average of daily new COVID-19 cases per million",
     xlab = "Date",
     ylab = "Daily Change in Reported Cases per Million (7-day avg.)",
     type = "l",
     lty = "solid",
     col =    c("blue", "blue", "blue", "blue", 
                  "blue", "red", "red", "blue", "blue", "red"),
     xaxt="n")
dates<-format(CAN_govcsv$date,"%b-%d")
axis(1, at=CAN_govcsv$date, labels=dates)
legend(x="topleft", 
       legend = c("Ontario", "Quebec", "Alberta", "Manitoba", 
                  "Saskatechewan", "Nova Scotia", "New Brunswick", 
                  "Newfoundland", 
                  "Prince Edward Island", "British Columbia"), 
       col =    c("blue", "blue", "blue", "blue", 
                  "blue", "red", "red", "blue", "blue", "red"), 
       pch=18)


