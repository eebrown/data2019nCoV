## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(data2019nCoV)
library(ggplot2)
library(tidyr)
library(dplyr)
library(scales)
library(data.table)

daily_change <- function(series) {
  change <- c(series, NA) - c(NA, series)
  change <- change[-1]
  change <- change[-length(change)]
  return(change)
}

ON_cumulative$LastUpdated[length(ON_cumulative$LastUpdated)]

ON_mohreports$date[length(ON_mohreports$date)]

ON_status$date[length(ON_status$date)]

## ---- fig.width=6, fig.height=8-----------------------------------------------

# Red lines reflect government mandated closures/restrictions
# Green lines reflect government loosinging of closures/restrictions

openings <- function() {
  
  # Banning gatherings over 250 people https://news.ontario.ca/mtc/en/2020/03/statement-from-minister-elliott-and-minister-macleod-on-the-2019-novel-coronavirus-covid-19-1.html
  abline(v = as.POSIXct("2020-03-13"), col = "orangered")
  
  # Schools remain closed after march break https://news.ontario.ca/opo/en/2020/03/title.html
  abline(v = as.POSIXct("2020-03-14"), col = "red")
  
  # Provincial closure of non-essential businesses
  abline(v = as.POSIXct("2020-03-24"), col = "red")
  
  # https://news.ontario.ca/opo/en/2020/05/certain-businesses-allowed-to-reopen-under-strict-safety-guidelines.html
  abline(v = as.POSIXct("2020-05-04"), col = "yellow") # many businesses opening
  
  #https://news.ontario.ca/mtc/en/2020/05/ontario-eases-restrictions-on-professional-sports-training-facilities.html
  abline(v = as.POSIXct("2020-05-08"), col = "yellow") #pro sports
  
 # http://www.ontarioparks.com/covid19 Reopening parks May 11, 2020
  abline(v = as.POSIXct("2020-05-11"), col = "yellow") #parks
  
  # pre-phase 1 (marinas, golf courses...)
  abline(v = as.POSIXct("2020-05-16"), col = "yellow") #parks 

 # Phase 1 opening
  abline(v = as.POSIXct("2020-05-19"), col = "green") # phase 1
  
  # Phase 2 opening
  abline(v = as.POSIXct("2020-06-12"), col = "green") # phase 2 (with exceptions)
  
  # phase 2 - remaining
  abline(v = as.POSIXct("2020-06-19"), col = "green") 
  abline(v = as.POSIXct("2020-06-19"), col = "green") #niagara...
  abline(v = as.POSIXct("2020-06-24"), col = "green") #toronto,peel...
  abline(v = as.POSIXct("2020-06-25"), col = "green") #windsor
  
  # PHase 3 opening
    abline(v = as.POSIXct("2020-07-17"), col = "green") # phase 3 except GTA
    abline(v = as.POSIXct("2020-07-31"), col = "green") # phase 3 GTA
}

plot(ON_status$date, ON_status$cases,
     main = "Cumulative Confirmed COVID-19 Cases in Ontario",
     xlab = "Date",
     ylab = "Cases",
     type = "b")

plot(ON_status$date, ON_status$cases,
     main = "Cumulative COVID-19 Cases in Ontario (Semilog.)",
     xlab = "Date",
     ylab = "Confirmed Cases",
     type = "b",
     log = "y")

plot(ON_status$date[-1], daily_change(ON_status$tested_patients),
     main = "Change in COVID-19 Patients Tested",
     xlab = "Date",
     ylab = "Change in Patients Tests",
     type = "b")

par(mfrow=c(2,1))

plot(ON_status$date, ON_status$positive,
     main = "Active COVID-19 Cases in Ontario",
     xlab = "Date",
     ylab = "Confirmed Cases (Active)",
     type = "l")
openings()

plot(ON_status$date[-1], daily_change(ON_status$cases),
     main = "New COVID-19 Cases in Ontario",
     xlab = "Date",
     ylab = "New Confirmed Cases",
     type = "l")
openings()



## ---- fig.width=6, fig.height=8-----------------------------------------------
colours <- c("red",   "blue",  "black", "magenta", "green")

matplot(ON_mohreports$date, cbind( 
                ( (ON_mohreports$deaths / ON_mohreports$cases) * 100 ),
                ( (ON_mohreports$severity_hospitalized / ON_mohreports$cases) * 100 ),
                ( (ON_mohreports$severity_icu / ON_mohreports$cases) * 100 ),
                ( (ON_mohreports$deaths_ltc_residents / ON_mohreports$cases_ltc_residents) * 100 ),
                ( (ON_mohreports$deaths_hospital_pts / ON_mohreports$cases_hospital_pts) * 100 )
               ),
                           
     main = "Ontario Severity and Outcomes",
     xlab = "Date (2020)",
     ylab = "Outcome (Percent)",
     type = "l",
     col = colours,
     lty = c("solid", "solid", "solid", "solid", "solid"),
     ylim = c(0,40),
     ylog = TRUE,
     xaxt="n")
dates<-format(ON_mohreports$date,"%b %d")
axis(1, at=ON_mohreports$date, labels=dates)
legend(x="top", 
       legend = c("CFR (Overall)", 
                  "Hospitalized (Cumulative)", 
                  "ICU (Cumulative)", 
                  "CFR (LTC Residents)",
                  "CFR (Hospital Outbreak Patients)"), 
       col = colours,
       lty = c("solid", "solid", "solid", "solid"), pch=18)


colours <- c("red",   "blue",  "black", "magenta", "green", "brown", "orange", "purple", "pink",
             "tomato1", "yellow")

matplot(ON_mohreports$date, cbind( 
                ( (ON_mohreports$deaths_80andover / ON_mohreports$age_80plus) * 100 ),
                ( (ON_mohreports$deaths_ltc_residents / ON_mohreports$cases_ltc_residents) * 100 ),
                ( (ON_mohreports$deaths_rh_residents / ON_mohreports$rh_residents) * 100 ),         
                ( (ON_mohreports$deaths_hospital_pts / ON_mohreports$cases_hospital_pts) * 100 ),
                ( (ON_mohreports$deaths_60to79 / ON_mohreports$age_60to79) * 100 ),
                ( (ON_mohreports$deaths / ON_mohreports$cases) * 100 ),
                ( (ON_mohreports$deaths_40to59 / ON_mohreports$age_40to59) * 100 ),
                ( (ON_mohreports$deaths_20to39 / ON_mohreports$age_20to39) * 100 ),
                ( (ON_mohreports$deaths_hospital_staff / ON_mohreports$cases_hospital_staff) * 100 ),
                ( (ON_mohreports$deaths_ltc_staff / ON_mohreports$cases_ltc_staff) * 100 ),
                ( (ON_mohreports$deaths_19under / ON_mohreports$age_19under) * 100 )
               ),
                           
     main = "Ontario Case Fatality Rates",
     xlab = "Date (2020)",
     ylab = "CFR (Percent)",
     type = "l",
     col = colours,
     lty = c("solid"),
     ylim = c(0,40),
     ylog = FALSE,
     xaxt="n")
dates<-format(ON_mohreports$date,"%b %d")
axis(1, at=ON_mohreports$date, labels=dates)
legend(x="topleft", 
       legend = c("Age 80+",
                  "LTC residents",
                  "RH residents",
                  "Hospital outbreak patients",
                  "Age 60-79",
                  "CFR (Overall)", 
                  "Age 40-59",
                  "Age 20-39", 
                  "Hospital staff",
                  "LTC staff",
                  "Age 19 and under"
                  ), 
       col = colours,
       lty = c("solid"), pch=18)


# by age
matplot(ON_mohreports$date[-1], cbind( 
                ( frollmean(daily_change(ON_mohreports$age_19under), 7) ),
                ( frollmean(daily_change(ON_mohreports$age_20to39), 7) ),
                ( frollmean(daily_change(ON_mohreports$age_40to59), 7) ),
                ( frollmean(daily_change(ON_mohreports$age_60to79), 7) ),
                ( frollmean(daily_change(ON_mohreports$age_80plus), 7) )
               ),
                           
     main = "Ontario New Cases by Age",
     xlab = "Date (2020)",
     ylab = "New Cases",
     type = "l",
     col = colours,
     lty = c("solid"),
     #ylim = c(0,30),
     ylog = FALSE,
     xaxt="n")
dates<-format(ON_mohreports$date[-1],"%b %d")
axis(1, at=ON_mohreports$date[-1], labels=dates)
 legend(x="topleft", 
        legend = c("<20",
                   "20-39",
                   "40-59",
                   "60-79",
                   ">79"
                   ), 
       col = colours,
       lty = c("solid"), pch=18)


## ---- fig.width=6, fig.height=8-----------------------------------------------

plot(ON_mohreports$date, 
     ON_mohreports$cases_female / 
       (ON_mohreports$cases_male + ON_mohreports$cases_female),
     main = "Ontario COVID-19 Cases - Gender",
     ylab = "Proportion of Female Cases",
     xlab = "Date",
     type = "l")


## ---- fig.width=6, fig.height=8-----------------------------------------------

ON_forplot <- rename(ON_mohreports,
    Ontario = cases, Toronto = cases_phu_toronto, Peel = cases_phu_peel, 
    York = cases_phu_york, Ottawa = cases_phu_ottawa, Durham = cases_phu_durham, 
    Waterloo = cases_phu_waterloo, Hamilton = cases_phu_hamilton, 
    Windsor... = cases_phu_windsoressex, Middlesex... = cases_phu_middlesexlondon, 
    Halton = cases_phu_halton, Niagara = cases_phu_niagara, 
    Simcoe... = cases_phu_simcoemuskoka, Haliburton... = cases_phu_haliburtonkawarthapineridge,
    Lambton = cases_phu_lambton, Wellington... = cases_phu_wellingtondufferinguelph, 
    Kingston... = cases_phu_kingstonfrontenaclennoxaddington, 
    Haldimand... = cases_phu_haldimandnorfolk, Peterborough = cases_phu_peterborough, 
    Leeds... = cases_phu_leedsgrenvillelanark, Brant = cases_phu_brant, 
    Eastern = cases_phu_easternontario, Porcupine = cases_phu_porcupine, 
    Sudbury = cases_phu_sudbury, Hastings... = cases_phu_hastingsprinceedward, 
    Grey... = cases_phu_greybruce, Southwestern = cases_phu_southwestern, 
    Chatham... = cases_phu_chathamkent, ThunderBay = cases_phu_thunderbay, 
    Renfrew = cases_phu_renfrew, Algoma = cases_phu_algoma, 
    HuronPerth = cases_phu_huronperth, NorthBay... = cases_phu_northbayparrysound, 
    Northwestern = cases_phu_northwestern, Timiskaming = cases_phu_timiskaming)


gather(ON_forplot, key, value, 
       Ontario, Toronto, Peel, York, Ottawa, Durham, Waterloo, Hamilton,
       Windsor..., Middlesex..., Halton, Niagara, Simcoe..., Haliburton...,
    Lambton, Wellington..., Kingston..., Haldimand..., Peterborough, 
    Leeds..., Brant, Eastern, Porcupine, Sudbury, Hastings..., 
    Grey..., Southwestern, Chatham..., ThunderBay, Renfrew, Algoma, 
    HuronPerth, NorthBay..., Northwestern, Timiskaming
       ) %>%
  ggplot(aes(x=date, y=value, col=key)) +
  geom_path() +
  scale_y_continuous(trans = 'log10', labels = comma) +
  theme(legend.position="bottom") +
  labs(title = "Ontario COVID-19 Cases by Public Health Unit",
       x = "Date", 
       y = "Confirmed Cases") +
  guides(shape = guide_legend(override.aes = list(size = 0.5))) +
  guides(color = guide_legend(override.aes = list(size = 0.5))) +
  theme(legend.text = element_text(size = 7)) +
  theme(legend.title = element_blank())

gather(ON_mohreports, key, value, 
       cases,deaths,
       severity_hospitalized,severity_icu,
       cases_ltc_residents, cases_ltc_staff,
       cases_hospital_pts, deaths_hospital_pts,
       deaths_ltc_residents, cases_hcp
       ) %>%
  ggplot(aes(x=date, y=value, col=key)) +
  geom_line() +
  guides(shape = guide_legend(override.aes = list(size = 0.5))) +
  scale_y_continuous(trans = 'log10', labels = comma) +
  theme(legend.position="right") +
  labs(title = "Ontario COVID-19 Cases (Semilog.)",
       x = "Date", 
       y = "Confirmed Cases") +
  theme(legend.title = element_blank())

## ---- fig.width=6, fig.height=8-----------------------------------------------

par(mfrow=c(3,2))

plot(ON_mohreports$date[-1], daily_change(ON_mohreports$cases),
     type = "b",
     xlab = "Date",
     ylab = "New Cases")

plot(ON_mohreports$date[-1], daily_change(ON_mohreports$deaths),
     type = "b",
     xlab = "Date",
     ylab = "New Deaths")

plot(ON_mohreports$date[-1], daily_change(ON_mohreports$severity_hospitalized),
     type = "b",
     xlab = "Date",
     ylab = "New Hospitalized Cases")

plot(ON_mohreports$date[-1], daily_change(ON_mohreports$severity_icu),
     type = "b",
     xlab = "Date",
     ylab = "New ICU Cases")

plot(ON_mohreports$date[-1], daily_change(ON_mohreports$cases_ltc),
     type = "b",
     xlab = "Date",
     ylab = "Change LTC Cases")

plot(ON_mohreports$date[-1], daily_change((ON_mohreports$cases - ON_mohreports$cases_ltc - ON_mohreports$cases_hospital_pts)),
     type = "b",
     xlab = "Date",
     ylab = "Change Non-Outbreak Cases")


## ---- fig.width=6, fig.height=8-----------------------------------------------
plot(ON_mohreports$date[-1], daily_change(ON_mohreports$cases_phu_toronto),
     type = "p",
     xlab = "Date",
     ylab = "New Cases in Toronto",
     ylim = c(0, 300))
lines(ON_mohreports$date[-1], frollmean(daily_change(ON_mohreports$cases_phu_toronto), 7), col="red")

## ---- fig.width=6, fig.height=8-----------------------------------------------

# gendercount <- ON_linelist %>%
#   filter(Outbreak_Related != "Yes") %>%
#   filter(age_group != "<20") %>%
#   select(date, gender) %>%
#   group_by(date, gender) %>%
#   summarise(count=n()) %>%
#   pivot_wider(names_from = gender, values_from = count) %>%
#   mutate(ratio = FEMALE/MALE)
# 
# gendercount$date[[1]] <- NA
# 
# par(mfrow=c(2,1))
# 
# matplot(as.Date(gendercount$date), cbind(gendercount$MALE, gendercount$FEMALE),
#      main = "ON Non-Outbreak Adult Cases",
#      xlab = "Date (2020)",
#      ylab = "Cases",
#      type = "l",
#      col = c("blue",   "pink"),
#      lty = c("solid", "solid"),
#      #ylim = c(0,1),
#      xlim=c(as.Date("2020-03-01"), as.Date(gendercount$date)[length(gendercount$date)-2]),
#      #ylog = TRUE,
#      xaxt="n")
# dates<-format(as.Date(gendercount$date),"%b %d")
# axis(1, at=as.Date(gendercount$date), labels=dates)
# legend(x="left",
#        legend = c("Male", "Female"),
#        col =    c("blue",   "pink"),
#        lty = c("solid", "solid"),
#        pch=18)
# 
# plot(as.Date(gendercount$date[1:(length(gendercount$ratio)-2)]),
#      gendercount$ratio[1:(length(gendercount$ratio)-2)],
#      type="l", xlab="Date", ylab="Ratio F:M",
#      main = "Gender Ratio of ON Cases (Non-Outbreak, Age >= 20)",
#      xlim=c(as.Date("2020-03-01"), as.Date(gendercount$date)[length(gendercount$date)-2]),
#      ylim=c(0,2))
# lines(as.Date(gendercount$date)[1:(length(gendercount$ratio)-2)], frollmean(gendercount$ratio[1:(length(gendercount$ratio)-2)], 14), col="tomato1")
# lines(as.Date(gendercount$date)[1:(length(gendercount$ratio)-2)],
# frollmean(gendercount$ratio[1:(length(gendercount$ratio)-2)], 2), col="green")
# abline(h=1, col="grey")
# abline(v=as.Date("2020-05-10"), col="pink")
# polygon(c(as.Date("2020-05-24"), as.Date("2020-05-11"), as.Date("2020-05-11"), as.Date("2020-05-24")), c(2, 2, 0, 0),
#         col=rgb(1, 0, 0,0.1), border=NA)

## ---- fig.width=6, fig.height=8-----------------------------------------------
weekdays <- as.factor(as.numeric(as.Date(ON_status$date))%% 7)
levels(weekdays) <- c("Thurs", "Fri", "Sat", "Sun", "Mon", "Tues", "Wed")
plot(weekdays, ON_status$tests_last_day,
     ylab="Tests reported", xlab="Day of Report (by 4 pm)")


