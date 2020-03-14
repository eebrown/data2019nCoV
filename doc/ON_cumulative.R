## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(data2019nCoV)

## ---- fig.width=6, fig.height=6-----------------------------------------------

plot(ON_cumulative$LastUpdated, (ON_cumulative$ConfirmedPositive+ON_cumulative$Resolved),
     main = "Confirmed COVID-19 Cases and Recoveries in Ontario",
     xlab = "Date",
     ylab = "Current and Resolved Cases",
     type = "b")


