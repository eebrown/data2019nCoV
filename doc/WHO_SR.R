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
     main = "Global COVID-19 Cases",
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


## ---- fig.width=7, fig.height=7-----------------------------------------------

# Every country
gather(WHO_SR, key, value, 
       
       China,
       
       RepublicofKorea, Japan, Singapore, Australia, Malaysia, VietNam, 
       Philippines, Cambodia, NewZealand, BruneiDarussalam,
       Mongolia, Guam, Fiji,NewCaledonia,PapuaNewGuinea, Myanmar,
       LaoPeoplesDemocraticRepublic,NorthernMarianaIslands,
       
       Thailand, India, Nepal, SriLanka, Indonesia, Bhutan, Maldives, TimorLeste,
       
       UnitedStatesofAmerica, Canada, Brazil, Mexico, Ecuador, DominicanRepublic,
       Argentina, Chile, Colombia, Peru, CostaRica, FrenchGuiana, Martinique,
       Panama, Bolivia, Jamaica, Guyana, SaintVincentandtheGrenadines, Cuba, Jersey,
       Venezuela, AntiguaandBarbuda, Guadeloupe, TrinidadandTobago, PuertoRico,
       CaymanIslands, Curacao, Uruguay, SaintLucia, Guatemala, Suriname, Bahamas,
       Aruba, UnitedStatesVirginIslands,Barbados,Montserrat,ElSalvador,
       Nicaragua, SintMaarten,Haiti,Dominica,TurksandCaicos,SaintKittsandNevis,
       Anguilla, BritishVirginIslands,
       
       Italy, Germany, France, UnitedKingdom, Spain, Croatia, Austria, 
       Finland, Israel, RussianFederation, Sweden, Belgium, Denmark, 
       Estonia, Georgia, Greece, NorthMacedonia, Norway, Romania, Switzerland, 
       Belarus, Lithuania, Netherlands, SanMarino, Azerbaijan, Ireland, Monaco,
       Czechia, Iceland, Armenia, Luxembourg, Portugal, Andorra, Latvia,
       Poland, Ukraine, Liechtenstein, BosniaHerzegovina, Hungary, Slovenia, 
       Gibraltar, Serbia, Slovakia, HolySee, Malta, Bulgaria, RepublicofMoldova,
       FaroeIslands, Cyprus, Guernsey, Kazakhstan, Uzbekistan, Kyrgyzstan,
       Greenland, Montenegro, Kosovo,

       Iran, Kuwait, Bahrain, UnitedArabEmirates, Iraq, Oman, Lebanon, Pakistan,
       Afghanistan, Egypt, Qatar, Jordan, Morocco, SaudiArabia, Tunisia, Somalia,
       OccupiedPalestinianTerritory, Djibouti,SyrianArabRepublic,Libya,
       
       Algeria, Nigeria, Senegal, Cameroon, SouthAfrica, Togo, BurkinaFaso,
       DemocraticRepublicoftheCongo, Reunion, Namibia, CentralAfricanRepublic,
       Congo, EquatorialGuinea, Eswatini, Mauritania, Mayotte,Rwanda, Seychelles,
       Benin, Liberia, UnitedRepublicofTanzania,Mauritius,Zambia,Gambia,
       Chad, Niger,CaboVerde,Zimbabwe,
       Madagascar, Angola, Eritrea, Uganda,Mozambique,GuineaBissau,Mali,
       
       InternationalConveyance) %>%
  ggplot(aes(x=Date, y=value, col=key)) +
  geom_line() +
  theme(legend.position="none") +
  labs(title = "Confirmed Cases by Region",
       x = "Date", 
       y = "Confirmed Cases") +
  theme(legend.title = element_blank())

## ---- fig.width=7, fig.height=7-----------------------------------------------
# Western Pacific and Southeast Asia
gather(WHO_SR, key, value, 
       
       RepublicofKorea, Japan, Singapore, Australia, Malaysia, VietNam, 
       Philippines, Cambodia, NewZealand, BruneiDarussalam,
       Mongolia, Guam, Fiji,NewCaledonia,PapuaNewGuinea,Myanmar,
       LaoPeoplesDemocraticRepublic,NorthernMarianaIslands,
       
       Thailand, India, Nepal, SriLanka, Indonesia, Bhutan, Maldives, TimorLeste,
       
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
       FaroeIslands, Cyprus, Guernsey, Kazakhstan, Uzbekistan, Kyrgyzstan,
       Greenland, Montenegro,  Kosovo
       
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
       Panama, Bolivia, Jamaica, Guyana, SaintVincentandtheGrenadines, Cuba, Jersey,
       Venezuela, AntiguaandBarbuda, Guadeloupe, TrinidadandTobago, PuertoRico,
       CaymanIslands, Curacao, Uruguay, SaintLucia, Guatemala, Suriname, Bahamas,
       Aruba, UnitedStatesVirginIslands,Barbados,Montserrat,ElSalvador,
       Nicaragua, SintMaarten, Haiti,Dominica,TurksandCaicos,SaintKittsandNevis,
       Anguilla, BritishVirginIslands
       
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
       Afghanistan, Egypt, Qatar, Jordan, Morocco, SaudiArabia, Tunisia, Somalia,
       OccupiedPalestinianTerritory, Djibouti,SyrianArabRepublic,Libya,
       
       ) %>%
  ggplot(aes(x=Date, y=value, col=key)) +
  geom_line() +
  theme(legend.position="bottom") +
  labs(title = "Eastern Mediterranean Region",
       x = "Date", 
       y = "Confirmed Cases") +
  theme(legend.title = element_blank())

# Eastern Mediterranean and Africa
gather(WHO_SR, key, value, 
      
    Algeria, Nigeria, Senegal, Cameroon, SouthAfrica, Togo,
    BurkinaFaso,DemocraticRepublicoftheCongo,CotedIvoire,
    Ethiopia,Gabon,Ghana,Guinea,Kenya,Namibia,CentralAfricanRepublic,
    Congo,EquatorialGuinea,Eswatini,Mauritania,Mayotte, Rwanda,
    Seychelles,Benin,Liberia,UnitedRepublicofTanzania,Mauritius,
    Zambia,  Gambia, Chad, Niger, Reunion, CaboVerde,  Zimbabwe, Madagascar,
    Angola,  Eritrea, Uganda, Mozambique,GuineaBissau,Mali,
    
       ) %>%
  ggplot(aes(x=Date, y=value, col=key)) +
  geom_line() +
  theme(legend.position="bottom") +
  labs(title = "African Region",
       x = "Date", 
       y = "Confirmed Cases") +
  theme(legend.title = element_blank())


# Southern Hemisphere
gather(WHO_SR, key, value, 
       
       Australia, NewZealand, Fiji, NewCaledonia, PapuaNewGuinea,
       
       Brazil, Ecuador, Argentina, Chile, Peru, Colombia,
       DemocraticRepublicoftheCongo, Bolivia, Uruguay,TimorLeste,

       SouthAfrica, Reunion, Gabon, Kenya, Namibia, Congo, 
       Eswatini, Mayotte, Rwanda, Seychelles,
       UnitedRepublicofTanzania,Mauritius,Zambia,Zimbabwe,Madagascar,
       Angola, Uganda
       
       ) %>%
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
       Netherlands, 
       UnitedKingdom, 
       Austria
       ) %>%
  ggplot(aes(x=Date, y=value, col=key)) +
  geom_line() +
  theme(legend.position="right", legend.title = element_blank()) +
  scale_y_continuous(trans = 'log10', labels = comma) +
  labs(title = "Major COVID-19 Outbreaks (Semilogarithmic)",
       x = "Date", 
       y = "Confirmed Cases") 

overx <- function(country, x) {
  over <- country[country > x] 
  over <- c(over, rep(NA, length(WHO_SR$Date)))
  return(over)
}

start_no <- 5000

plot(overx(WHO_SR$China, start_no), col="red", type="l",
     xlab=paste0("Days Since ", start_no, " Cases"),
     ylab= "Cases",
     main=paste0("Outbreak Progression from ", start_no, " Cases"),
     xlim=c(0,50),
     ylim=c(1000,400000))
lines(overx(WHO_SR$Italy, start_no), col="green")
lines(overx(WHO_SR$Iran, start_no), col="orange")
lines(overx(WHO_SR$RepublicofKorea, start_no), col="magenta")
lines(overx(WHO_SR$Spain, start_no), col="brown")
lines(overx(WHO_SR$Germany, start_no), col="coral")
lines(overx(WHO_SR$France,  start_no), col="purple")
lines(overx(WHO_SR$UnitedStatesofAmerica, start_no), col="blue")
lines(overx(WHO_SR$Switzerland,  start_no), col="black")
lines(overx(WHO_SR$Austria,  start_no), col="black")
lines(overx(WHO_SR$UnitedKingdom,  start_no), col="cornflowerblue")
lines(overx(WHO_SR$Netherlands, start_no), col="black")
lines(overx(WHO_SR$Norway, start_no), col="black")
lines(overx(WHO_SR$Sweden, start_no), col="black")
lines(overx(WHO_SR$Denmark, start_no), col="black")
lines(overx(WHO_SR$Belgium, start_no), col="black")

legend(x = "right", legend = c("USA", "Spain", "Germany", 
                               "Italy", "China", "UK", 
                               "France", "Iran", "Korea"),
       col =    c("blue", "brown",   "coral",  
                  "green", "red", "cornflowerblue", 
                  "purple", "orange", "magenta"), 
       pch=18)


## ---- fig.width=6, fig.height=20----------------------------------------------
outbreaks <- list(China = WHO_SR$China, 
                  Italy = WHO_SR$Italy,
                  Canada = WHO_SR$Canada,
                  Spain = WHO_SR$Spain,
                  Germany = WHO_SR$Germany,
                  Iran = WHO_SR$Iran,
                  France = WHO_SR$France,
                  Korea = WHO_SR$RepublicofKorea)

par(mfrow=c(4,2))

for (i in 1:length(outbreaks)) {
  
 plot(WHO_SR$Date[-1], daily_change(outbreaks[[i]]),
      main = names(outbreaks)[[i]],
      ylab = "Daily Cases",
      xlab = "Date",
      type = "l",
      ylim = c(0,10000))
}

 par(mfrow=c(4,2))
 
 plot(WHO_SR$Date[-1], daily_change(WHO_SR$UnitedStatesofAmerica),
      main = "United States - Cases",
      ylab = "Daily Cases",
      xlab = "Date",
      type = "l",
      ylim = c(0,40000))
 
  plot(WHO_SR$Date[-1], daily_change(WHO_SR$UnitedStatesofAmerica.deaths),
      main = "United States - Deaths",
      ylab = "Daily Cases",
      xlab = "Date",
      type = "l",
      ylim = c(0,4000))
  
   plot(WHO_SR$Date[-1], daily_change(WHO_SR$Italy),
      main = "Italy - Cases",
      ylab = "Daily Cases",
      xlab = "Date",
      type = "l",
      ylim = c(0,40000))
   
    plot(WHO_SR$Date[-1], daily_change(WHO_SR$Italy.deaths),
      main = "Italy - Deaths",
      ylab = "Daily Cases",
      xlab = "Date",
      type = "l",
      ylim = c(0,4000))
 
     plot(WHO_SR$Date[-1], daily_change(WHO_SR$Spain),
      main = "Spain - Cases",
      ylab = "Daily Cases",
      xlab = "Date",
      type = "l",
      ylim = c(0,40000))
     
      plot(WHO_SR$Date[-1], daily_change(WHO_SR$Spain.deaths),
      main = "Spain - Deaths",
      ylab = "Daily Cases",
      xlab = "Date",
      type = "l",
      ylim = c(0,4000))
      
           plot(WHO_SR$Date[-1], daily_change(WHO_SR$France),
      main = "France - Cases",
      ylab = "Daily Cases",
      xlab = "Date",
      type = "l",
      ylim = c(0,40000))
     
      plot(WHO_SR$Date[-1], daily_change(WHO_SR$France.deaths),
      main = "France - Deaths",
      ylab = "Daily Cases",
      xlab = "Date",
      type = "l",
      ylim = c(0,4000))


## ---- fig.width=6, fig.height=6-----------------------------------------------
plot(WHO_SR$Date, WHO_SR$China.deaths,
     main = "Cumulative COVID-19 Deaths in China",
     xlab = "Date",
     ylab = "Deaths",
     type = "b")

# Change in Cases Between Reports
plot(WHO_SR$Date[-1], daily_change(WHO_SR$China.deaths),
     main = "Change in Deaths in China by Date",
     ylab = "New Deaths",
     xlab = "Date",
     type = "b")

Deaths.nonChina <- c(WHO_SR$Deaths.nonChina[1:56], 
                      (WHO_SR$Region.WesternPacific.deaths[57:length(WHO_SR$Date)] + 
                         WHO_SR$Region.European.deaths[57:length(WHO_SR$Date)] +
                         WHO_SR$Region.SouthEastAsia.deaths[57:length(WHO_SR$Date)] +
                         WHO_SR$Region.EasternMediterranean.deaths[57:length(WHO_SR$Date)] +
                         WHO_SR$Region.Americas.deaths[57:length(WHO_SR$Date)] +
                         WHO_SR$Region.African.deaths[57:length(WHO_SR$Date)] +
                         WHO_SR$Region.Other.deaths[57:length(WHO_SR$Date)] -
                         WHO_SR$China.deaths[57:length(WHO_SR$Date)]))

plot(WHO_SR$Date, 
     Deaths.nonChina,
     main = "Cumulative COVID-19 Deaths Outside of China",
     xlab = "Date",
     ylab = "Deaths",
     type = "b")

plot(WHO_SR$Date[-1], daily_change(Deaths.nonChina),
     main = "Change in Deaths Outside China by Date",
     xlab = "Date",
     ylab = "New Deaths",
     type = "b")

## ---- fig.width=6, fig.height=6-----------------------------------------------

matplot(as.Date(WHO_SR$Date), cbind( 
                           (WHO_SR$China.deaths/ WHO_SR$China)*100,
                           (WHO_SR$RepublicofKorea.deaths / WHO_SR$RepublicofKorea)*100,
                           (WHO_SR$Italy.deaths / WHO_SR$Italy)*100,
                           (WHO_SR$UnitedStatesofAmerica.deaths / 
                                WHO_SR$UnitedStatesofAmerica)*100,
                           (WHO_SR$Canada.deaths / WHO_SR$Canada)*100,
                           (WHO_SR$Spain.deaths / WHO_SR$Spain)*100),
     main = "Case Fatality Rate",
     xlab = "Date",
     ylab = "Deaths / Confirmed Cases (%)",
     type = "l",
     lty = "solid",
     col = c("black",   "blue",  "green", "magenta", "red", "brown"),
     ylim = c(0,14),
     xaxt="n")
dates<-format(WHO_SR$Date,"%b-%d")
axis(1, at=WHO_SR$Date, labels=dates)
legend(x="top", 
       legend = c("China", "Korea", "Italy", "USA", "Canada", "Spain"), 
       col =    c("black",   "blue",  "green", "magenta", "red", "brown"), 
       pch=18)


## ---- fig.width=6, fig.height=6-----------------------------------------------
population_US <- 329968629
population_CAN <- 37894799

range <- 50:length(WHO_SR$Canada)

matplot(as.Date(WHO_SR$Date[range]), cbind( 
                           ( (WHO_SR$Canada / population_CAN)[range] * 100000 ),
                           ( (WHO_SR$Canada.deaths/ population_CAN)[range] * 1000000 ),
                           ( (WHO_SR$UnitedStatesofAmerica/ population_US)[range] * 100000 ),
                           ( (WHO_SR$UnitedStatesofAmerica.deaths/ population_US)[range] * 1000000 )
                           ),
                           
     main = "Cases and Deaths Per Capita",
     xlab = "Date (2020)",
     ylab = "Cases Per 100k / Deaths per Million",
     type = "l",
     col = c("red",   "red",  "blue", "blue"),
     lty = c("solid", "dotted", "solid", "dotted"),
     ylim = c(0,200),
     ylog = TRUE,
     xaxt="n")
dates<-format(WHO_SR$Date,"%b %d")
axis(1, at=WHO_SR$Date, labels=dates)
legend(x="top", 
       legend = c("Canada Cases per 100k", "Canada Deaths per Million", "USA Cases per 100k", "USA Deaths per Million", "Estimates of Annual Influenza Deaths per Million"), 
       col =    c("red",   "red",  "blue", "blue", "grey"),
       lty = c("solid", "dotted", "solid", "dotted", "dotted"),
       pch=18)
#annual mortality from influenza per million (https://ipac-canada.org/influenza-resources.php)
abline(h = 20, col="grey", lty="dotted") 
#lower and upper annual mortality from influenza per million (CDC)
abline(h = 36, col="grey", lty="dotted") 
abline(h = 184, col="grey", lty="dotted") 
# (https://www.ontario.ca/page/flu-facts)
abline(h = 92, col="grey", lty="dotted") 


