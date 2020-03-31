## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(data2019nCoV)

daily_change <- function(series) {
  change <- c(series, NA) - c(NA, series)
  change <- change[-1]
  change <- change[-length(change)]
  return(change)
}

## ---- fig.width=6, fig.height=12----------------------------------------------

par(mfrow=c(3,1))


all_cases <- ON_cumulative$ConfirmedPositive+ON_cumulative$Resolved+ON_cumulative$Deceased

plot(ON_cumulative$LastUpdated, all_cases,
     main = "Cumulative Confirmed COVID-19 Cases in Ontario",
     xlab = "Date",
     ylab = "Cases (Open, Resolved, Deceased)",
     type = "b")



# Range with consistent daily reports
range <- (8:(length(ON_cumulative$LastUpdated)/2)*2) - 1

# A function to calculate the daily change
daily_change <- function(series) {
  change <- c(series, NA) - c(NA, series)
  change <- change[-1]
  change <- change[-length(change)]
  return(change)
}

plot(ON_cumulative$LastUpdated[range][-1],
  daily_change(all_cases[range]),
  main = "Daily New Cases in Ontario",
  xlab = "Date",
  ylab = "Daily Change in Total Cases (Open, Resolved, Deceased)",
  type = "b")


tests <- (ON_cumulative$Negative + 
         ON_cumulative$ConfirmedPositive + 
         ON_cumulative$Resolved +
         ON_cumulative$Deceased)

change <- daily_change(tests)

plot(ON_cumulative$LastUpdated[-1], change,
     main = "Number of Results Posted Between Reports in Ontario",
     xlab = "Date",
     ylab = "Change in Negative + Positive + Resolved + Deceased",
     type = "b")




