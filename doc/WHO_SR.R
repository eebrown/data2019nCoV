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

# Global Cases
plot(WHO_SR$Date, WHO_SR$Global.confirmed, 
     main = "Global 2019-CoV Confirmed Cases",
     xlab = "Date",
     ylab = "Confirmed Cases",
     type = "b")

# Change in Cases Between Reports
change_cases <- c(WHO_SR$Global.confirmed, NA) - c(NA, WHO_SR$Global.confirmed)
change_cases <- change_cases[-1]
change_cases <- change_cases[-length(change_cases)]

# Remove the change introduced with SR 27, when the definition was expanded.
change_cases[27] <- NA

plot(WHO_SR$Date[-1], change_cases,
     main = "Change in Global Cases by Date",
     ylab = "New Confirmed Cases",
     xlab = "Date",
     type = "b")

plot(WHO_SR$Date, WHO_SR$Global.confirmed, 
     main = "Global 2019-CoV Confirmed Cases",
     xlab = "Date",
     ylab = "Confirmed Cases",
     type = "b")


## ---- fig.width=6, fig.height=6-----------------------------------------------
gather(WHO_SR, key, value, Japan, RepublicofKorea, VietNam, Singapore, Australia, Malaysia, 
       Cambodia, Philippines, Thailand, Nepal, SriLanka, India, UnitedStatesofAmerica, 
       Canada, Finland, France, Germany, Italy, RussianFederation, Spain, Sweden, 
       UnitedKingdom, Belgium, UnitedArabEmirates, InternationalConveyance) %>%
  ggplot(aes(x=Date, y=value, col=key)) +
  geom_line() +
  theme(legend.position="bottom") +
  labs(title = "Confirmed Cases Outside of China",
       x = "Date", 
       y = "Confirmed Cases") +
  theme(legend.title = element_blank())

# Western Pacific and Southeast Asia
gather(WHO_SR, key, value, Japan, RepublicofKorea, VietNam, Singapore, Australia, Malaysia, 
       Cambodia, Philippines, Thailand, Nepal, SriLanka, India, InternationalConveyance) %>%
  ggplot(aes(x=Date, y=value, col=key)) +
  geom_line() +
  theme(legend.position="bottom") +
  labs(title = "Western Pacific and Southeast Asia (Excluding China)",
       x = "Date", 
       y = "Confirmed Cases") +
  theme(legend.title = element_blank())

# Americas, Europe, Middle East
gather(WHO_SR, key, value, UnitedStatesofAmerica, 
       Canada, Finland, France, Germany, Italy, RussianFederation, Spain, Sweden, 
       UnitedKingdom, Belgium, UnitedArabEmirates) %>%
  ggplot(aes(x=Date, y=value, col=key)) +
  geom_line() +
  theme(legend.position="bottom") +
  labs(title = "Americas, Europe, and Middle East",
       x = "Date", 
       y = "Confirmed Cases") +
  theme(legend.title = element_blank())

# Outbreaks Outside of China
gather(WHO_SR, key, value, Japan, Singapore, InternationalConveyance) %>%
  ggplot(aes(x=Date, y=value, col=key)) +
  geom_line() +
  theme(legend.position="bottom") +
  labs(title = "Outbreaks Outside of China",
       x = "Date", 
       y = "Confirmed Cases") +
  theme(legend.title = element_blank())



## ---- fig.width=6, fig.height=6-----------------------------------------------
plot(WHO_SR$Date, WHO_SR$China.deaths,
     main = "2019-CoV Deaths in China",
     xlab = "Date",
     ylab = "Deaths",
     type = "b")

plot(WHO_SR$Date, WHO_SR$China.deaths,
     main = "2019-CoV Deaths in China (Logarithmic)",
     xlab = "Date",
     ylab = "Deaths",
     log = "y",
     type = "b")

plot(WHO_SR$Date, (WHO_SR$China.deaths / WHO_SR$China)*100,
     main = "Deaths / Cases in China",
     xlab = "Date",
     ylab = "Deaths / Confirmed Cases (%)",
     type = "b")

