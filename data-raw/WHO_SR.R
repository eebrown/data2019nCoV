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


library(tidyverse)

sarscov2_who_2019 <- WHO_SR

sarscov2_who_2019 <- rename(sarscov2_who_2019,
    situation_report = SituationReport,
    date = Date,

    cases_chn = China,
    cases_jpn = Japan,
    cases_kor = RepublicofKorea,
    cases_vnm = VietNam,
    cases_sgp = Singapore,
    cases_aus = Australia,
    cases_mys = Malaysia,
    cases_khm = Cambodia,
    cases_nzl = NewZealand,
    cases_phl = Philippines,
    cases_tha = Thailand,
    cases_npl = Nepal,
    cases_lka = SriLanka,
    cases_ind = India,
    cases_idn = Indonesia,
    cases_usa = UnitedStatesofAmerica,
    cases_can = Canada,
    cases_bra = Brazil,
    cases_mex = Mexico,
    cases_ecu = Ecuador,
    cases_dom = DominicanRepublic,
    cases_maf = SaintMartin,
    cases_blm = SaintBarthelemy,
    cases_arg = Argentina,
    cases_chl = Chile,

    cases_fin = Finland,
    cases_hrv = Croatia,
    cases_aut = Austria,
    cases_dnk = Denmark,
    cases_est = Estonia,
    cases_geo = Georgia,
    cases_grc = Greece,
    cases_mkd = NorthMacedonia,
    cases_nor = Norway,
    cases_rou = Romania,
    cases_che = Switzerland,
    cases_blr = Belarus,
    cases_ltu = Lithuania,
    cases_nld = Netherlands,
    cases_smr = SanMarino,
    cases_aze = Azerbaijan,
    cases_irl = Ireland,
    cases_mco = Monaco,
    cases_cze = Czechia,
    cases_isl = Iceland,
    cases_arm = Armenia,
    cases_lux = Luxembourg,
    cases_prt = Portugal,
    cases_and = Andorra,
    cases_lva = Latvia,
    cases_pol = Poland,
    cases_ukr = Ukraine,
    cases_lie = Liechtenstein,
    cases_bih = BosniaHerzegovina,
    cases_hun = Hungary,
    cases_svn = Slovenia,
    cases_gib = Gibraltar,
    cases_isr = Israel,
    cases_fra = France,
    cases_deu = Germany,
    cases_ita = Italy,
    cases_rus = RussianFederation,
    cases_esp = Spain,
    cases_swe = Sweden,
    cases_gbr = UnitedKingdom,
    cases_bel = Belgium,

    cases_are = UnitedArabEmirates,
    cases_egy = Egypt,
    cases_irn = Iran,
    cases_lbn = Lebanon,
    cases_kwt = Kuwait,
    cases_afg = Afghanistan,
    cases_bhr = Bahrain,
    cases_irq = Iraq,
    cases_omn = Oman,
    cases_pak = Pakistan,
    cases_qat = Qatar,
    cases_jor = Jordan,
    cases_mar = Morocco,
    cases_sau = SaudiArabia,
    cases_tun = Tunisia,
    cases_pse = OccupiedPalestinianTerritory,

    cases_dza = Algeria,
    cases_nga = Nigeria,
    cases_sen = Senegal,

    cases_internationconveyance = InternationalConveyance,

    cases_global = Global.confirmed,

    suspected_chn = China.suspected,
    severe_chn = China.severe,

    deaths_chn = China.deaths,
    deaths_phl = Philippines.deaths,
    deaths_jpn = Japan.deaths,
    deaths_fra = France.deaths,
    deaths_kor = RepublicofKorea.deaths,
    deaths_irn = Iran.deaths,
    deaths_ita = Italy.deaths, 
    deaths_aus = Australia.deaths,
    deaths_tha = Thailand.deaths,
    deaths_usa = UnitedStatesofAmerica.deaths,
    deaths_irq = Iraq.deaths,
    deaths_internationalconveyance = InternationalConveyance.deaths,

    critical_chn = China.critical,
    clinical_chn_hubei = Hubei.clinicaldx,
    cases_outside_chn = Cases.nonChina,
    countries_outside_chn = Countries.nonChina,
    deaths_outside_chn = Deaths.nonChina,
    cases_outside_chn_wuhan_travel_history = Cases.nonChina.WuhanTravel,
    cases_outside_chn_chn_travel_history = Cases.nonChina.ChinaTravel,

    risk_chn = RA.China,
    risk_regional = RA.Regional,
    risk_global = RA.Global,

    cases_health_care_workers = HealthCareWorkers,
    cases_chn_wuhan = China.WuhanCity,

    cases_chn_hubei = China.Hubei,
    cases_chn_guangdong = China.Guangdong,
    cases_chn_beijing = China.Beijing,
    cases_chn_shanghai = China.Shanghai,
    cases_chn_chongqing = China.Chongqing,
    cases_chn_zhejiang = China.Zhejiang,
    cases_chn_jiangxi = China.Jiangxi,
    cases_chn_sichuan = China.Sichuan,
    cases_chn_tianjin = China.Tianjin,
    cases_chn_henan = China.Henan,
    cases_chn_hunan = China.Hunan,
    cases_chn_shandong = China.Shandong,
    cases_chn_yunnan = China.Yunnan,
    cases_chn_taiwan = China.Taiwan,
    cases_chn_taipei = China.Taipei,
    cases_chn_hkg = China.HongKongSAR,
    cases_chn_mac = China.Macao,
    cases_chn_unspecified = China.Unspecified,
    cases_chn_anhui = China.Anhui,
    cases_chn_jiangsu = China.Jiangsu,
    cases_chn_fujian = China.Fujian,
    cases_chn_shaanxi = China.Shaanxi,
    cases_chn_guangxi = China.Guangxi,
    cases_chn_hebei = China.Hebei,
    cases_chn_heilongjiang = China.Heilongjiang,
    cases_chn_liaoning = China.Liaoning,
    cases_chn_hainan = China.Hainan,
    cases_chn_shanxi = China.Shanxi,
    cases_chn_gansu = China.Gansu,
    cases_chn_guizhou = China.Guizhou,
    cases_chn_ningxia = China.Ningxia,
    cases_chn_mng = China.InnerMongolia,
    cases_chn_xinjiang = China.Xinjiang,
    cases_chn_jilin = China.Jilin,
    cases_chn_qinghai = China.Qinghai,
    cases_chn_xizang = China.Xizang,

    deaths_chn_hubei = China.Hubei.deaths,
    deaths_chn_guangdong = China.Guangdong.deaths,
    deaths_chn_beijing = China.Beijing.deaths,
    deaths_chn_shanghai = China.Shanghai.deaths,
    deaths_chn_chongqing = China.Chongqing.deaths,
    deaths_chn_zhejiang = China.Zhejiang.deaths,
    deaths_chn_jiangxi = China.Jiangxi.deaths,
    deaths_chn_sichuan = China.Sichuan.deaths,
    deaths_chn_tianjin = China.Tianjin.deaths,
    deaths_chn_henan = China.Henan.deaths,
    deaths_chn_hunan = China.Hunan.deaths,
    deaths_chn_shandong = China.Shandong.deaths,
    deaths_chn_yunnan = China.Yunnan.deaths,
    deaths_chn_taipei = China.Taipei.deaths,
    deaths_chn_hkg = China.HongKongSAR.deaths,
    deaths_chn_mac = China.Macao.deaths,
    deaths_chn_anhui = China.Anhui.deaths,
    deaths_chn_jiangsu = China.Jiangsu.deaths,
    deaths_chn_fujian = China.Fujian.deaths,
    deaths_chn_shaanxi = China.Shaanxi.deaths,
    deaths_chn_guangxi = China.Guangxi.deaths,
    deaths_chn_hebei = China.Hebei.deaths,
    deaths_chn_heilongjiang = China.Heilongjiang.deaths,
    deaths_chn_liaoning = China.Liaoning.deaths,
    deaths_chn_hainan = China.Hainan.deaths,
    deaths_chn_shanxi = China.Shanxi.deaths,
    deaths_chn_gansu = China.Gansu.deaths,
    deaths_chn_guizhou = China.Guizhou.deaths,
    deaths_chn_ningxia = China.Ningxia.deaths,
    deaths_chn_mng = China.InnerMongolia.deaths,
    deaths_chn_xinjiang = China.Xinjiang.deaths,
    deaths_chn_jilin = China.Jilin.deaths,
    deaths_chn_qinghai = China.Qinghai.deaths,
    deaths_chn_xizang = China.Xizang.deaths
  )

save(sarscov2_who_2019, file = "sarscov2_who_2019.RData", version = 2)

