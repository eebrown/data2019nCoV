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

gather(CAN_cumulative, key, value, 
       bc_confirmed,
       ab_confirmed,
       sk_confirmed,
       mb_confirmed,
       on_confirmed,
       qc_confirmed,
       nl_confirmed,
       nb_confirmed,
       pe_confirmed,
       repatriated_confirmed
       ) %>%
  ggplot(aes(x=date, y=value, col=key)) +
  geom_line() +
  theme(legend.position="right") +
  labs(title = "Confirmed Cases by Province",
       x = "Date", 
       y = "Confirmed Cases") +
  theme(legend.title = element_blank())


