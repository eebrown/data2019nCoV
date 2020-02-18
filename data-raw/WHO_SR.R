## Code to prepare `WHO_SR` dataset goes here.
## Package users ignore this code.

# SOURCE https://www.who.int/emergencies/diseases/novel-coronavirus-2019/situation-reports

devtools::load_all()
WHO_SR <- read.csv("data-raw/WHO_SR.csv")
WHO_SR$Date <- as.Date(WHO_SR$Date)


usethis::use_data(WHO_SR, overwrite = TRUE)


# Once the data in the CSV is updated, run the above code, update the package 
# version, followed by:

devtools::document()
devtools::build_vignettes()
devtools::check()


## Below creates alternately labelled object, for use by downstream outbreaks


existing <- c("SituationReport","Date",

	          "China","Japan","RepublicofKorea",
	          "VietNam","Singapore","Australia","Malaysia","Cambodia",
              "Philippines","Thailand","Nepal","SriLanka","India",
              "UnitedStatesofAmerica","Canada","Finland","France","Germany",
              "Italy","RussianFederation","Spain","Sweden","UnitedKingdom",
              "Belgium","UnitedArabEmirates","Egypt",
              "InternationalConveyance",

              "Global.confirmed","China.suspected","China.severe",
              "China.deaths", "Philippines.deaths", "Japan.deaths",
              "France.deaths",

              "China.critical","Hubei.clinicaldx",
              "Cases.nonChina","Countries.nonChina","Deaths.nonChina",
              "Cases.nonChina.WuhanTravel","Cases.nonChina.ChinaTravel",
              
              "RA.China","RA.Regional","RA.Global",

              "HealthCareWorkers",
              "China.WuhanCity",

              "China.Hubei","China.Guangdong","China.Beijing",
              "China.Shanghai","China.Chongqing","China.Zhejiang",
              "China.Jiangxi","China.Sichuan","China.Tianjin",
              "China.Henan","China.Hunan","China.Shandong",
              "China.Yunnan","China.Taiwan","China.Taipei",
              "China.HongKongSAR","China.Macao","China.Unspecified",
              "China.Anhui","China.Jiangsu","China.Fujian",
              "China.Shaanxi","China.Guangxi","China.Hebei",
              "China.Heilongjiang","China.Liaoning","China.Hainan",
              "China.Shanxi","China.Gansu","China.Guizhou",
              "China.Ningxia","China.InnerMongolia","China.Xinjiang",
              "China.Jilin","China.Qinghai","China.Xizang")

new <- c("situation_report","date",

	     "cases_chn","cases_jpn","cases_kor",
         "cases_vnm","cases_sgp","cases_aus","cases_mys","cases_khm",
         "cases_phl","cases_tha","cases_npl","cases_lka","cases_ind",
         "cases_usa","cases_can","cases_fin","cases_fra","cases_deu",
         "cases_ita","cases_rus","cases_esp","cases_swe","cases_gbr",
         "cases_bel","cases_are","cases_egy",
         "cases_internationconveyance",

         "cases_global","suspected_chn","severe_chn",
         "deaths_chn", "deaths_phl", "deaths_jpn",
         "deaths_fra",

         "critical_chn","clinical_chn_hubei",
         "cases_outside_chn","countries_outside_chn","deaths_outside_chn",
         "cases_outside_chn_wuhan_travel_history","cases_outside_chn_chn_travel_history",

         "risk_chn","risk_regional","risk_global",

         "cases_health_care_workers",
         "cases_chn_wuhan",

         "cases_chn_hubei","cases_chn_guangdong","cases_chn_beijing",
         "cases_chn_shanghai","cases_chn_chongqing","cases_chn_zhejiang",
         "cases_chn_jiangxi","cases_chn_sichuan","cases_chn_tianjin",
         "cases_chn_henan","cases_chn_hunan","cases_chn_shandong",
         "cases_chn_yunnan","cases_chn_taiwan","cases_chn_taipei",
         "cases_chn_hkg","cases_chn_mac","cases_chn_unspecified",
         "cases_chn_anhui","cases_chn_jiangsu","cases_chn_fujian",
         "cases_chn_shaanxi","cases_chn_guangxi","cases_chn_hebei",
         "cases_chn_heilongjiang","cases_chn_liaoning","cases_chn_hainan",
         "cases_chn_shanxi","cases_chn_gansu","cases_chn_guizhou",
         "cases_chn_ningxia","cases_chn_mng","cases_chn_xinjiang",
         "cases_chn_jilin","cases_chn_qinghai","cases_chn_xizang")


if (identical(names(WHO_SR), existing)) {

	sarscov2_who_2019 <- WHO_SR
	names(sarscov2_who_2019) <- new
	save(sarscov2_who_2019, file = "sarscov2_who_2019.RData", version = 2)

} else {
	
  stop("The variable names have changed.")

}
