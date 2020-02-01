## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(data2019nCoV)

## ---- fig.width=6-------------------------------------------------------------
plot(WHO_SR$Date, WHO_SR$Global.confirmed, 
     main = "Global 2019-CoV Confirmed Cases",
     xlab = "Date",
     ylab = "Confirmed Cases")

## ---- fig.width=6-------------------------------------------------------------
plot(WHO_SR$Date, WHO_SR$China.deaths,
     main = "2019-CoV Deaths (Logarithmic)",
     xlab = "Date",
     ylab = "Deaths",
     log = "y")

plot(WHO_SR$Date, WHO_SR$Global.confirmed, 
     main = "Global 2019-CoV Confirmed Cases (Logarithmic)",
     xlab = "Date",
     ylab = "Confirmed Cases",
     log = "y")


