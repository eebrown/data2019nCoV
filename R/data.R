#' World Health Organization situation reports data
#'
#' A dataset containing the data reported in the WHO 2019 novel
#' coronavirus situation reports.
#'
#' @format A data frame with a row for each situation report
#' @source \url{https://www.who.int/emergencies/diseases/novel-coronavirus-2019/situation-reports}
"WHO_SR"

#' Ontario Ministry of Health Coronavirus Cumulative Case Totals
#'
#' A dataset containing the data reported online by the Ontario Ministry of 
#' Health. For verification purposes, the data is retrieved from the Internet
#' Archive web archives, with the URL of the snapshot provided.
#'
#' @source \url{https://www.ontario.ca/page/2019-novel-coronavirus}
#' @docType data
#' @format A data frame where each row represents a reporting time
#'  \describe{
#'     \item{URL}{Internet Archive snapshot of URL for source data}
#'     \item{AsOf}{The results are updated to this date}
#'     \item{LastUpdated}{The date the data were reported on the webpage}
#'     \item{Negative}{Negative tests.}
#'     \item{UnderInvestigation}{Number of current pending tests.}
#'     \item{PresumptivePositive}{Awaiting confirmation at national laboratory.}
#'     \item{Deceased}{Confirmed deceased cases.}
#'     \item{ConfirmedPositive}{"Patient still testing positive and has not had two consecutive negative results greater than 24 hours apart"}
#'     \item{Cases}{"Number of confirmed cases reported to date in iPHIS by 34 Public Health Units, including resolved and deceased cases"}
#'     \item{Resolved}{"Patient is no longer infectious based on two consecutive negative tests performed"}
#'     \item{TotalTested}{"Total number of patients approved for COVID-19 testing to date"}
#'     \item{Male}{"Male cases"}
#'     \item{Female}{"Female cases"}
#'     \item{X19andunder}{"Cases age 19 and under"} 
#'     \item{X20to64}{"Cases age 20 to 64"}
#'     \item{X65andover}{"Cases age 65 and over"}
#'     \item{X20to39}{"Cases age 20 to 39"}
#'     \item{X40to59}{"Cases age 40 to 59"}
#'     \item{X60to79}{"Cases age 60 to 79"}
#'     \item{X80andover}{"Cases age 80 and over"}
#'     \item{Hospitalized}{"Cases currently hospitalized"}
#'     \item{ICU}{"Cases currently in ICU"}
#'     \item{Ventilator}{"Cases currently in ICU and on ventilator"}
#'  }
"ON_cumulative"

#' Ontario Ministry of Health Epidemiologic Summaries (PDF reports)
#'
#' A dataset containing the data reported online by the Ontario Ministry of 
#' Health in its Epidemiologic Summary reports.
#'
#' @source \url{https://www.ontario.ca/page/2019-novel-coronavirus}
#' @docType data
#' @format A data frame where each row represents a report
"ON_mohreports"

#' Canada Public Health Coronavirus Cumulative Case Totals
#'
#' A dataset containing the data reported online by the Canadian government.
#' For verification purposes, the data is retrieved from the Internet
#' Archive web archives, with the URL of the snapshot provided.
#'
#' @source \url{https://www.canada.ca/en/public-health/services/diseases/2019-novel-coronavirus-infection.html}
#' @docType data
#' @format A data frame where each row represents a reporting time
#'  \describe{
#'     \item{url}{Internet Archive snapshot of URL for source data}
#'     \item{date}{The date the of the data reported on the webpage}
#'     \item{bc_confirmed}{Confirmed cases in British Columbia}
#'     \item{bc_probable}{Probable cases in British Columbia}
#'     \item{bc_deaths}{Deaths in British Columbia}
#'     \item{ab_confirmed}{Confirmed cases in Alberta}
#'     \item{ab_probable}{Probable cases in Alberta}
#'     \item{ab_deaths}{Deaths in Alberta}
#'     \item{sk_confirmed}{Confirmed cases in Saskatchewan}
#'     \item{sk_probable}{Probable cases in Saskatchewan}
#'     \item{sk_deaths}{Deaths in Saskatchewan}
#'     \item{mb_confirmed}{Confirmed cases in Manitoba}
#'     \item{mb_probable}{Probable cases in Manitoba}
#'     \item{mb_deaths}{Deaths in Manitoba}
#'     \item{on_confirmed}{Confirmed cases in Ontario}
#'     \item{on_probable}{Probable cases in Ontario}
#'     \item{on_deaths}{Deaths in Ontario}
#'     \item{qc_confirmed}{Confirmed cases in Quebec}
#'     \item{qc_probable}{Probable cases in Quebec}
#'     \item{qc_deaths}{Deaths in Quebec}
#'     \item{nl_confirmed}{Confirmed cases in Newfoundland and Labrador}
#'     \item{nl_probable}{Probable cases in Newfoundland and Labrador}
#'     \item{nl_deaths}{Deaths in Newfoundland and Labrador}
#'     \item{nb_confirmed}{Confirmed cases in New Brunswick}
#'     \item{nb_probable}{Probable cases in New Brunswick}
#'     \item{nb_deaths}{Deaths in New Brunswick}
#'     \item{ns_confirmed}{Confirmed cases in Nova Scotia}
#'     \item{ns_probable}{Probable cases in Nova Scotia}
#'     \item{ns_deaths}{Deaths in Nova Scotia}
#'     \item{pe_confirmed}{Confirmed cases in Prince Edward Island}
#'     \item{pe_probable}{Probable cases in Prince Edward Island}
#'     \item{pe_deaths}{Deaths in Prince Edward Island}
#'     \item{yt_confirmed}{Confirmed cases in Yukon}
#'     \item{yt_probable}{Probable cases in Yukon}
#'     \item{yt_deaths}{Deaths in Yukon}
#'     \item{nt_confirmed}{Confirmed cases in Northwest Territories}
#'     \item{nt_probable}{Probable cases in Northwest Territories}
#'     \item{nt_deaths}{Deaths in Northwest Territories}
#'     \item{nu_confirmed}{Confirmed cases in Nunavut}
#'     \item{nu_probable}{Probable cases in Nunavut}
#'     \item{nu_deaths}{Deaths in Nunavut}
#'     \item{repatriated_confirmed}{Confirmed repatriated cases}
#'     \item{repatriated_probable}{Probable repatriated cases}
#'     \item{repatriated_deaths}{Deaths among repatriated cases}
#'     \item{total_confirmed}{Total confirmed cases}
#'     \item{total_probable}{Total probable cases}
#'     \item{total_deaths}{Total deaths}
#'     \item{proportion_female}{Proportion of cases that are female}
#'     \item{proportion_40plus}{Proportion of cases aged 40 and over}
#'     \item{proportion_60plus}{Proportion of cases aged 60 and over}
#'     \item{proportion_hospitalized}{Proportion of cases that are in hospital}
#'     \item{proportion_travellers}{Proportion of cases that are trevellers}
#'     \item{proportion_contactoftravellers}{Proportion of cases that are close contacts of travellers}
#'  }
"CAN_cumulative"

#' Canada Public Health Coronavirus Cumulative Case Totals
#'
#' A dataset containing the data reported online by the Canadian government,
#' which is published as a .csv file, titled covid19.csv. The data is
#' transformed into wide format.
#'
#' @source \url{https://www.canada.ca/en/public-health/services/diseases/2019-novel-coronavirus-infection.html}
#' @docType data
#' @format A data frame where each row represents a reporting date
"CAN_govcsv"

#' SARS-CoV-2 World Health Organization Situation Reports 2019 Outbreak (COVID-19)
#'
#' These data are transcribed from the WHO Situation Reports on the COVID-19
#' outbreak (SARS-CoV-2). Data was not available for all variables in all 
#' reports. For full details, see the original Situation Reports as published 
#' by WHO. Data were manually transcribed and errors are possible.
#' 
#' @docType data
#' @format A data frame where each row represents a new Situation Report
#'
#' @rdname sarscov2_who_2019
#'
#' @author Data from World Health Organization (WHO), published as Sitation
#' Reports. Transfer to R and documentation by Eric Brown.
#'
#' @source World Health Organization (2020)
#'
#' @references
#'
#' World Health Organization. 2020. <https://www.who.int/emergencies/diseases/novel-coronavirus-2019/situation-reports>
#'
#' @examples
#' ## show global cases
#' sarscov2_who_2019$cases_global
#'
"sarscov2_who_2019"
