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

## ---- fig.width=6, fig.height=6-----------------------------------------------
plot(WHO_SR$Date, WHO_SR$Global.confirmed, 
     main = "Global 2019-CoV Confirmed Cases",
     xlab = "Date",
     ylab = "Confirmed Cases")

gather(WHO_SR, key, value, Japan, RepublicofKorea, VietNam, Singapore, Australia, Malaysia, Cambodia, Philippines, Thailand, Nepal, SriLanka, India, UnitedStatesofAmerica, Canada, Finland, France, Germany, Italy, UnitedArabEmirates) %>%
  ggplot(aes(x=Date, y=value, colour=key)) +
  geom_line() +
  theme(legend.position="bottom") +
  labs(title = "Confirmed Cases Outside of China",
       x = "Date", 
       y = "Confirmed Cases") +
  theme(legend.title = element_blank())

## ---- fig.width=6, fig.height=6-----------------------------------------------
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


