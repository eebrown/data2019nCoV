[![DOI](https://zenodo.org/badge/237660917.svg)](https://zenodo.org/badge/latestdoi/237660917) ![R-CMD-check](https://github.com/eebrown/data2019nCoV/workflows/R-CMD-check/badge.svg)

# COVID-19 Pandemic Data R Package

This R package stores data about the 2019-2020 COVID-19 pandemic (SARS-CoV-2). 

The date is transcribed or compiled from official sources, but there is no guarantee as to the accuracy of the transcribed data or graphs in the vignettes. Please file an issue if any errors (discrepancies with official reports) are noticed.

Currently, this package contains the documented data objects as listed below. 

## Data Visualization / Demos

Plots of the global data can be found in the [World vignette](https://htmlpreview.github.io/?https://github.com/eebrown/data2019nCoV/blob/master/doc/WHO_SR.html). 

Plots of the Ontario data can be found in the [Ontario vignette](https://htmlpreview.github.io/?https://github.com/eebrown/data2019nCoV/blob/master/doc/ON_cumulative.html).

Plots of the Canada data can be found in the [Canada vignette](https://htmlpreview.github.io/?https://github.com/eebrown/data2019nCoV/blob/master/doc/Canada.html).


### World 

`ECDC_owid` and `sarscov2_ecdc_2019`: The `fulldata.csv` file produced by [Our World In Data](https://ourworldindata.org/coronavirus-source-data), loaded as a data.frame, including cumulative cases and deaths for all countries. The first is the untransformed long format, and `sarscov2_ecdc_2019` is transformed into wide format similar to `sarscov2_who_2019`, and renamed with ISO 3-letter country codes with systematic snake case naming. Updated to 2020-08-23.

`WHO_SR` and `sarscov2_who_2019`: The transcribed WHO [situation reports](https://www.who.int/emergencies/diseases/novel-coronavirus-2019/situation-reports). The first uses the wordy names from the Situation Reports, and `sarscov2_who_2019` uses systmatic ISO 3-letter country code names with systematic snake case naming. Updated up to 2020-04-21 (Situation Reports # 1-92). *Note I am not currently able able to keep the WHO Situation Report transcriptions up to date.*

### Ontario

`ON_status`: The government of Ontario updates the Ontario testing data (e.g. cumulative case count) and current hospitalization data daily in a .csv file, [covidtesting.csv](https://data.ontario.ca/dataset/status-of-covid-19-cases-in-ontario). This object contains that data, with variables renamed. updated as of 2020-08-23.

`ON_linelist`: The list of [confirmed cases](https://data.ontario.ca/dataset/confirmed-positive-cases-of-covid-19-in-ontario) provided by the Government of Ontario. Last updated 2020-08-23.

`ON_mohreports`: This object contains data transcribed from the Public Health Ontario/Ontario Ministry of Health "Epidemiologic Summary" reports, published daily as PDFs from 2020-03-29. It is updated as of 2020-08-23.

~~`ON_cumulative`~~ (not updated, replaced with `ON_status`) The source of this data is the official Ontario Government's [website](https://www.ontario.ca/page/2019-novel-coronavirus). Data is included from page updates that were captured by the [Internet Archive](https://web.archive.org/web/*/https://www.ontario.ca/page/2019-novel-coronavirus) where possible. It has been updated to 2020-05-01.

### Canada

`CAN_govcsv`: The government of Canada releases provincial cumulative totals including cases, deaths, and number tested, released as a `covid19.csv` file. This object contains data from that file transformed into a wide data frame. It is updated as of 2020-08-23.

~~`CAN_cumulative`~~ (not updated, replaced with `CAN_govscv`): Prior to the government's release of data in `.csv`, this data was scraped from the Canadian Government's [website](https://www.canada.ca/en/public-health/services/diseases/2019-novel-coronavirus-infection.html), up to 2020-03-27. After this time, the government started releasing a daily .csv containing the full data (see `CAN_govcsv` above).


## Usage

The package can be installed via `devtools::install_github("eebrown/data2019nCoV")`. Be sure to reinstall to obtain the latest version as new data is released and old data is corrected.

Once the package is installed and loaded, the data is available in a data.frame object, `WHO_SR`. This package uses plain lanugage variable names. The data is also available in the object `sarscov2_who_2019`, which uses more systematic variable names. The latter object also appears in the package [`outbreaks`](https://github.com/reconhub/outbreaks), though may be slightly less updated there.

### Wiki

If you use the data for a project, please consider adding the project link to the [wiki](https://github.com/eebrown/data2019nCoV/wiki). If you verify the data (confirm it to be equivalent to the WHO Situation Reports), please also consider noting that on the wiki. The purpose is to facilitate data analysis in this rapidly evolving pandemic. 

### Data Structure

Raw/transcribed data are stored as `.csv` files in the `/data-raw` directory, e.g. `/data-raw/WHO_SR.csv`. The scripts that converted the raw data into an R object are in a corresponding `.R` file in that directory (e.g. `/data-raw/WHO_SR.R`).

## Licence

This package uses freely available data, and itself is freely available with the CC0 licence. Information from WHO may be subject to WHO [copyright and terms](https://www.who.int/publishing/copyright/en/). The data source and package should be attributed. No warranty is made as to the accuracy of the data or transcription: use at your own risk. Please file an issue if you find any errors. 