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

## ---- fig.width=6, fig.height=10----------------------------------------------

par(mfrow=c(2,1))


plot(ON_cumulative$LastUpdated, (ON_cumulative$ConfirmedPositive+ON_cumulative$Resolved),
     main = "Cumulative Confirmed COVID-19 Cases in Ontario",
     xlab = "Date",
     ylab = "Current and Resolved Cases",
     type = "b")



plot(ON_cumulative$LastUpdated[-1],
     daily_change(ON_cumulative$ConfirmedPositive+ON_cumulative$Resolved)
       / daily_change(as.numeric(ON_cumulative$LastUpdated)),
     main = "Average Daily New COVID-19 Cases in Ontario",
     xlab = "Date",
     ylab = "Daily Case",
     type = "b")


