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

## ---- fig.width=6, fig.height=6-----------------------------------------------

# Global Cases
options(scipen=5)
plot(WHO_SR$Date, WHO_SR$Global.confirmed, 
     main = "Global 2019-CoV Confirmed Cases",
     xlab = "Date",
     ylab = "Confirmed Cases",
     type = "b")


## ---- fig.width=6, fig.height=6-----------------------------------------------
# A function to calculate the daily change
daily_change <- function(series) {
  change <- c(series, NA) - c(NA, series)
  change <- change[-1]
  change <- change[-length(change)]
  return(change)
}

# Remove the change introduced with SR 27, when the definition was expanded.
change_cases <- daily_change(WHO_SR$Global.confirmed)
change_cases[27] <- NA

plot(WHO_SR$Date[-1], change_cases,
     main = "Change in Global Cases by Date",
     ylab = "New Confirmed Cases",
     xlab = "Date",
     type = "b")

plot(WHO_SR$Date, WHO_SR$Cases.nonChina,
     main = "SARS-CoV-2 Confirmed Cases Excluding China",
     xlab = "Date",
     ylab = "Confirmed Cases",
     type = "b")

# Change in Cases Between Reports - Excluding China
plot(WHO_SR$Date[-1], daily_change(WHO_SR$Cases.nonChina),
     main = "Change in Global Cases, Excluding China, by Date",
     ylab = "New Confirmed Cases",
     xlab = "Date",
     type = "b")


## ---- fig.width=7, fig.height=7-----------------------------------------------

# Every country
gather(WHO_SR, key, value, 
       
       China,
       
       RepublicofKorea, Japan, Singapore, Australia, Malaysia, VietNam, 
       Philippines, Cambodia, NewZealand, BruneiDarussalam,
       Mongolia,
       
       Thailand, India, Nepal, SriLanka, Indonesia, Bhutan, Maldives, 
       Reunion,
       
       UnitedStatesofAmerica, Canada, Brazil, Mexico, Ecuador, DominicanRepublic,
       Argentina, Chile, Colombia, Peru, CostaRica, FrenchGuiana, Martinique,
       Panama, Bolivia, Jamaica, Guyana, SaintVincentandtheGrenadines, Cuba, Jersey,
       
       Italy, Germany, France, UnitedKingdom, Spain, Croatia, Austria, 
       Finland, Israel, RussianFederation, Sweden, Belgium, Denmark, 
       Estonia, Georgia, Greece, NorthMacedonia, Norway, Romania, Switzerland, 
       Belarus, Lithuania, Netherlands, SanMarino, Azerbaijan, Ireland, Monaco,
       Czechia, Iceland, Armenia, Luxembourg, Portugal, Andorra, Latvia,
       Poland, Ukraine, Liechtenstein, BosniaHerzegovina, Hungary, Slovenia, 
       Gibraltar, Serbia, Slovakia, HolySee, Malta, Bulgaria, RepublicofMoldova,
       FaroeIslands, Cyprus, Guernsey,

       Iran, Kuwait, Bahrain, UnitedArabEmirates, Iraq, Oman, Lebanon, Pakistan,
       Afghanistan, Egypt, Qatar, Jordan, Morocco, SaudiArabia, Tunisia,
       OccupiedPalestinianTerritory,
       
       Algeria, Nigeria, Senegal, Cameroon, SouthAfrica, Togo, BurkinaFaso,
       DemocraticRepublicoftheCongo,
       
       InternationalConveyance) %>%
  ggplot(aes(x=Date, y=value, col=key)) +
  geom_line() +
  theme(legend.position="none") +
  labs(title = "Confirmed Cases by Region",
       x = "Date", 
       y = "Confirmed Cases") +
  theme(legend.title = element_blank())

# No China
gather(WHO_SR, key, value, 
       
       RepublicofKorea, Japan, Singapore, Australia, Malaysia, VietNam, 
       Philippines, Cambodia, NewZealand, BruneiDarussalam,
       Mongolia,
       
       Thailand, India, Nepal, SriLanka, Indonesia, Bhutan, Maldives, 
       Reunion,
       
       UnitedStatesofAmerica, Canada, Brazil, Mexico, Ecuador, DominicanRepublic,
       Argentina, Chile, Colombia, Peru, CostaRica, FrenchGuiana, Martinique,
       Panama, Bolivia, Jamaica, Guyana, SaintVincentandtheGrenadines, Cuba, Jersey,
       
       Italy, Germany, France, UnitedKingdom, Spain, Croatia, Austria, 
       Finland, Israel, RussianFederation, Sweden, Belgium, Denmark, 
       Estonia, Georgia, Greece, NorthMacedonia, Norway, Romania, Switzerland, 
       Belarus, Lithuania, Netherlands, SanMarino, Azerbaijan, Ireland, Monaco,
       Czechia, Iceland, Armenia, Luxembourg, Portugal, Andorra, Latvia,
       Poland, Ukraine, Liechtenstein, BosniaHerzegovina, Hungary, Slovenia, 
       Gibraltar, Serbia, Slovakia, HolySee, Malta, Bulgaria, RepublicofMoldova,
       FaroeIslands, Cyprus, Guernsey,

       Iran, Kuwait, Bahrain, UnitedArabEmirates, Iraq, Oman, Lebanon, Pakistan,
       Afghanistan, Egypt, Qatar, Jordan, Morocco, SaudiArabia, Tunisia,
       OccupiedPalestinianTerritory,
       
       Algeria, Nigeria, Senegal, Cameroon, SouthAfrica, Togo, BurkinaFaso,
       DemocraticRepublicoftheCongo,
       
       InternationalConveyance) %>%
  ggplot(aes(x=Date, y=value, col=key)) +
  geom_line() +
  theme(legend.position="none") +
  labs(title = "Confirmed Cases Outside of China",
       x = "Date", 
       y = "Confirmed Cases") +
  theme(legend.title = element_blank())

# No China, Korea, Italy, Iran
gather(WHO_SR, key, value, 
       
       Japan, Singapore, Australia, Malaysia, VietNam, 
       Philippines, Cambodia, NewZealand, BruneiDarussalam,
       Mongolia,
       
       Thailand, India, Nepal, SriLanka, Indonesia, Bhutan, Maldives, 
       Reunion,
       
       UnitedStatesofAmerica, Canada, Brazil, Mexico, Ecuador, DominicanRepublic,
       Argentina, Chile, Colombia, Peru, CostaRica, FrenchGuiana, Martinique,
       Panama, Bolivia, Jamaica, Guyana, SaintVincentandtheGrenadines, Cuba, Jersey,
       
       Germany, France, UnitedKingdom, Spain, Croatia, Austria, 
       Finland, Israel, RussianFederation, Sweden, Belgium, Denmark, 
       Estonia, Georgia, Greece, NorthMacedonia, Norway, Romania, Switzerland, 
       Belarus, Lithuania, Netherlands, SanMarino, Azerbaijan, Ireland, Monaco,
       Czechia, Iceland, Armenia, Luxembourg, Portugal, Andorra, Latvia,
       Poland, Ukraine, Liechtenstein, BosniaHerzegovina, Hungary, Slovenia, 
       Gibraltar, Serbia, Slovakia, HolySee, Malta, Bulgaria, RepublicofMoldova,
       FaroeIslands, Cyprus, Guernsey,

       Kuwait, Bahrain, UnitedArabEmirates, Iraq, Oman, Lebanon, Pakistan,
       Afghanistan, Egypt, Qatar, Jordan, Morocco, SaudiArabia, Tunisia,
       OccupiedPalestinianTerritory,
       
       Algeria, Nigeria, Senegal, Cameroon, SouthAfrica, Togo, BurkinaFaso,
       DemocraticRepublicoftheCongo,
       
       InternationalConveyance) %>%
  ggplot(aes(x=Date, y=value, col=key)) +
  geom_line() +
  theme(legend.position="none") +
  labs(title = "Confirmed Cases Outside of China, Korea, Italy, and Iran",
       x = "Date", 
       y = "Confirmed Cases") +
  theme(legend.title = element_blank())


## ---- fig.width=7, fig.height=7-----------------------------------------------
# Western Pacific and Southeast Asia
gather(WHO_SR, key, value, 
       
       RepublicofKorea, Japan, Singapore, Australia, Malaysia, VietNam, 
       Philippines, Cambodia, NewZealand, BruneiDarussalam,
       Mongolia,
       
       Thailand, India, Nepal, SriLanka, Indonesia, Bhutan, Maldives,
       Reunion
       
       ) %>%
  ggplot(aes(x=Date, y=value, col=key)) +
  geom_line() +
  theme(legend.position="bottom") +
  labs(title = "Western Pacific and Southeast Asia (Excluding China)",
       x = "Date", 
       y = "Confirmed Cases") +
  theme(legend.title = element_blank())

# Europe
gather(WHO_SR, key, value, 

       Italy, Germany, France, UnitedKingdom, Spain, Croatia, Austria, 
       Finland, Israel, RussianFederation, Sweden, Belgium, Denmark, 
       Estonia, Georgia, Greece, NorthMacedonia, Norway, Romania, Switzerland, 
       Belarus, Lithuania, Netherlands, SanMarino, Azerbaijan, Ireland, Monaco,
       Czechia, Iceland, Armenia, Luxembourg, Portugal, Andorra, Latvia,
       Poland, Ukraine, Liechtenstein, BosniaHerzegovina, Hungary, Slovenia, 
       Gibraltar, Serbia, Slovakia, HolySee, Malta, Bulgaria, RepublicofMoldova,
       FaroeIslands, Cyprus, Guernsey
       
       ) %>%
  ggplot(aes(x=Date, y=value, col=key)) +
  geom_line() +
  theme(legend.position="bottom") +
  labs(title = "Europe",
       x = "Date", 
       y = "Confirmed Cases") +
  theme(legend.title = element_blank())

# Americas
gather(WHO_SR, key, value, 
       
       UnitedStatesofAmerica, Canada, Brazil, Mexico, Ecuador, DominicanRepublic,
       Argentina, Chile, Colombia, Peru, CostaRica, FrenchGuiana, Martinique,
       Panama, Bolivia, Jamaica, Guyana, SaintVincentandtheGrenadines, Cuba, Jersey
       
       ) %>%
  ggplot(aes(x=Date, y=value, col=key)) +
  geom_line() +
  theme(legend.position="bottom") +
  labs(title = "Americas",
       x = "Date", 
       y = "Confirmed Cases") +
  theme(legend.title = element_blank())

# Eastern Mediterranean and Africa
gather(WHO_SR, key, value, 
       
       Iran, Kuwait, Bahrain, UnitedArabEmirates, Iraq, Oman, Lebanon, Pakistan,
       Afghanistan, Egypt, Qatar, OccupiedPalestinianTerritory,
       
       Algeria, Nigeria, Senegal, Cameroon, SouthAfrica, Togo, BurkinaFaso,
       DemocraticRepublicoftheCongo
       
       ) %>%
  ggplot(aes(x=Date, y=value, col=key)) +
  geom_line() +
  theme(legend.position="bottom") +
  labs(title = "Eastern Mediterranean and Africa",
       x = "Date", 
       y = "Confirmed Cases") +
  theme(legend.title = element_blank())



# Southern Hemisphere
gather(WHO_SR, key, value, 
       
       Australia, NewZealand,
       
       Brazil, Ecuador, Argentina, Chile, Peru, Colombia,
       DemocraticRepublicoftheCongo, Bolivia,
       
       SouthAfrica, Reunion, Gabon, Kenya) %>%
  ggplot(aes(x=Date, y=value, col=key)) +
  geom_line() +
  theme(legend.position="bottom") +
  labs(title = "Confirmed Cases in Southern Hemisphere",
       x = "Date", 
       y = "Confirmed Cases") +
  theme(legend.title = element_blank())


# Chinese Provinces
gather(WHO_SR, key, value, China.Hubei,
       China.Guangdong, China.Beijing, China.Shanghai, China.Chongqing,        
       China.Zhejiang, China.Jiangxi, China.Sichuan, China.Tianjin, China.Henan,
       China.Hunan, China.Shandong, China.Yunnan, China.Taiwan, China.Taipei, 
       China.HongKongSAR, China.Macao, China.Unspecified, China.Anhui, China.Jiangsu,   
       China.Fujian, China.Shaanxi, China.Guangxi, China.Hebei, China.Heilongjiang,
       China.Liaoning, China.Hainan, China.Shanxi, China.Gansu, China.Guizhou, China.Ningxia,
       China.InnerMongolia, China.Xinjiang, China.Jilin, China.Qinghai, China.Xizang) %>%
  ggplot(aes(x=Date, y=value, col=key)) +
  geom_line() +
  scale_y_continuous(trans = 'log10', labels = comma) +
  labs(title = "Cases by Chinese Province (Semilogarithmic)",
       x = "Date", 
       y = "Confirmed Cases") +
  theme(legend.title = element_blank())


## ---- fig.width=6, fig.height=6-----------------------------------------------
# Major Outbreaks

gather(WHO_SR, key, value, 
       China, 
       Italy,
       Iran,
       RepublicofKorea, 
       Spain, 
       Germany,
       France, 
       UnitedStatesofAmerica,
       Switzerland, 
       Norway, 
       UnitedKingdom, 
       Netherlands,
       Sweden
       ) %>%
  ggplot(aes(x=Date, y=value, col=key)) +
  geom_line() +
  theme(legend.position="right", legend.title = element_blank()) +
  scale_y_continuous(trans = 'log10', labels = comma) +
  labs(title = "Major COVID-19 Outbreaks (Semilogarithmic)",
       x = "Date", 
       y = "Confirmed Cases") 


## ---- fig.width=6, fig.height=20----------------------------------------------
outbreaks <- list(Korea = WHO_SR$RepublicofKorea, 
                  Iran = WHO_SR$Iran,
                  Italy = WHO_SR$Italy,
                  France = WHO_SR$France,
                  Germany = WHO_SR$Germany,
                  USA = WHO_SR$UnitedStatesofAmerica,
                  Spain = WHO_SR$Spain,
                  Switzerland = WHO_SR$Switzerland)

par(mfrow=c(4,2))

for (i in 1:length(outbreaks)) {
  
 plot(WHO_SR$Date[-1], daily_change(outbreaks[[i]]),
      main = names(outbreaks)[[i]],
      ylab = "Daily Cases",
      xlab = "Date",
      type = "l",
      ylim = c(0,3000))
}

## ---- fig.width=6, fig.height=6-----------------------------------------------
plot(WHO_SR$Date, WHO_SR$China.deaths,
     main = "Cumulative COVID-19 Deaths in China",
     xlab = "Date",
     ylab = "Deaths",
     type = "b")

plot(WHO_SR$Date, WHO_SR$China.deaths,
     main = "Cumulative COVID-19 Deaths in China (Semilogarithmic)",
     xlab = "Date",
     ylab = "Deaths",
     log = "y",
     type = "b")

# Change in Cases Between Reports
plot(WHO_SR$Date[-1], daily_change(WHO_SR$China.deaths),
     main = "Change in Deaths in China by Date",
     ylab = "New Deaths",
     xlab = "Date",
     type = "b")

plot(WHO_SR$Date, 
     WHO_SR$Deaths.nonChina,
     main = "Cumulative COVID-19 Deaths Outside of China",
     xlab = "Date",
     ylab = "Deaths",
     type = "b")

plot(WHO_SR$Date[-1], daily_change(WHO_SR$Deaths.nonChina),
     main = "Change in Deaths Outside China by Date",
     xlab = "Date",
     ylab = "New Deaths",
     type = "b")

## ---- fig.width=6, fig.height=6-----------------------------------------------

matplot(as.Date(WHO_SR$Date), cbind( ((WHO_SR$China.deaths + WHO_SR$Deaths.nonChina) / 
                                              (WHO_SR$China + WHO_SR$Cases.nonChina))*100, 
                           (WHO_SR$China.deaths/ WHO_SR$China)*100,
                           (WHO_SR$RepublicofKorea.deaths / WHO_SR$RepublicofKorea)*100,
                           (WHO_SR$Italy.deaths / WHO_SR$Italy)*100,
                           (WHO_SR$UnitedStatesofAmerica.deaths / WHO_SR$UnitedStatesofAmerica)*100),
     main = "Case Fatality Rate",
     xlab = "Date",
     ylab = "Deaths / Confirmed Cases (%)",
     type = "l",
     col = c("black", "red",   "blue",  "green", "magenta"),
     ylim = c(0,8))
legend(x="top", 
       legend = c("World", "China", "Korea", "Italy", "USA"), 
       col =    c("black", "red",   "blue",  "green", "magenta"), 
       pch=18)


