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

exchina <- (WHO_SR$Japan + WHO_SR$RepublicofKorea + WHO_SR$VietNam + 
        WHO_SR$Singapore + WHO_SR$Australia + WHO_SR$Malaysia +
        WHO_SR$Cambodia + WHO_SR$Philippines + WHO_SR$Thailand +
        WHO_SR$Nepal + WHO_SR$SriLanka + WHO_SR$India + 
        WHO_SR$UnitedStatesofAmerica + WHO_SR$Canada + WHO_SR$Finland +
        WHO_SR$France + WHO_SR$Germany + WHO_SR$Italy + WHO_SR$RussianFederation +
        WHO_SR$Spain + WHO_SR$Sweden + WHO_SR$UnitedKingdom + WHO_SR$Belgium +
        WHO_SR$UnitedArabEmirates + WHO_SR$Egypt + WHO_SR$InternationalConveyance)

plot(WHO_SR$Date, exchina,
     main = "SARS-CoV-2 Confirmed Cases Excluding China",
     xlab = "Date",
     ylab = "Confirmed Cases",
     type = "b")

# Change in Cases Between Reports - Excluding China
change_cases_nochn <- c(exchina, NA) - c(NA, exchina)
change_cases_nochn <- change_cases_nochn[-1]
change_cases_nochn <- change_cases_nochn[-length(change_cases_nochn)]

plot(WHO_SR$Date[-1], change_cases_nochn,
     main = "Change in Global Cases, Excluding China, by Date",
     ylab = "New Confirmed Cases",
     xlab = "Date",
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


# Chinese Provinces
gather(WHO_SR, key, value, 
       China.Guangdong, China.Beijing, China.Shanghai, China.Chongqing,        
       China.Zhejiang, China.Jiangxi, China.Sichuan, China.Tianjin, China.Henan,
       China.Hunan, China.Shandong, China.Yunnan, China.Taiwan, China.Taipei, 
       China.HongKongSAR, China.Macao, China.Unspecified, China.Anhui, China.Jiangsu,   
       China.Fujian, China.Shaanxi, China.Guangxi, China.Hebei, China.Heilongjiang,
       China.Liaoning, China.Hainan, China.Shanxi, China.Gansu, China.Guizhou, China.Ningxia,
       China.InnerMongolia, China.Xinjiang, China.Jilin, China.Qinghai, China.Xizang) %>%
  ggplot(aes(x=Date, y=value, col=key)) +
  geom_line() +
  theme(legend.position="bottom") +
  labs(title = "Cases by Chinese Province, excluding Hubei",
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

# Change in Cases Between Reports
change_deaths <- c(WHO_SR$China.deaths, NA) - c(NA, WHO_SR$China.deaths)
change_deaths <- change_deaths[-1]
change_deaths <- change_deaths[-length(change_deaths)]
plot(WHO_SR$Date[-1], change_deaths,
     main = "Change in Deaths in China by Date",
     ylab = "New Deaths",
     xlab = "Date",
     type = "b")

plot(WHO_SR$Date, 
     (WHO_SR$France.deaths + WHO_SR$Philippines.deaths + WHO_SR$Japan.deaths),
     main = "SARS-CoV-2 Deaths outside of China",
     xlab = "Date",
     ylab = "Deaths",
     type = "b")


