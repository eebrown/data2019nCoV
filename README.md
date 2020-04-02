[![DOI](https://zenodo.org/badge/237660917.svg)](https://zenodo.org/badge/latestdoi/237660917)

# data2019nCoV R Package

This is a simple R package to store data about the 2019-2020 outbreak of the novel coronavirus, SARS-CoV-2, causing COVID-19.

There is no guarantee as to the accuracy of the transcribed data or graphs in the vignette. Please file an issue if any errors (discrepancies with the WHO reports) are noticed.

Currently, this package contains 3 datasets. 

### 1. World Health Organization (WHO)

`WHO_SR`: The transcribed WHO [situation reports](https://www.who.int/emergencies/diseases/novel-coronavirus-2019/situation-reports) up to 2020-04-01 (Situation Reports # 1-72).

### 2. Ontario Ministry of Health Cumulative Cases

`ON_cumulative`: The source of this data is the official Ontario Government's [website](https://www.ontario.ca/page/2019-novel-coronavirus). Data is included from page updates that were captured by the [Internet Archive](https://web.archive.org/web/*/https://www.ontario.ca/page/2019-novel-coronavirus) where possible. It has been updated up to 2020-04-01.

### 3. Government of Canada Cumulative Cases

`CAN_cumulative`: The source of this data is the official Canadian Government's [website](https://www.canada.ca/en/public-health/services/diseases/2019-novel-coronavirus-infection.html). Data is included from page updates that were captured by the Internet Archive where possible. It has been updated up to 2020-03-27. After this time, the government started releasing CSVs containing the full data. 

## Demo

Plots of the WHO data can be found in the [WHO SR vignette](https://htmlpreview.github.io/?https://github.com/eebrown/data2019nCoV/blob/master/doc/WHO_SR.html). 

Plots of the Ontario data can be found in the [ON vignette](https://htmlpreview.github.io/?https://github.com/eebrown/data2019nCoV/blob/master/doc/ON_cumulative.html).

Plots of the Canada data can be found in the [CAN vignette](https://htmlpreview.github.io/?https://github.com/eebrown/data2019nCoV/blob/master/doc/Canada.html).

## Usage

The package can be installed via `devtools::install_github("eebrown/data2019nCoV")`. Be sure to reinstall to obtain the latest version as new data is released (including the errata periodically reported by WHO).

Once the package is installed and loaded, the data is available in a data.frame object, `WHO_SR`. This package uses plain lanugage variable names. The data is also available in the object `sarscov2_who_2019`, which uses more systematic variable names. The latter object also appears in the package [`outbreaks`](https://github.com/reconhub/outbreaks), though may be slightly less updated there.

### Wiki

If you use the data for a project, please consider adding the project link to the [wiki](https://github.com/eebrown/data2019nCoV/wiki). If you verify the data (confirm it to be equivalent to the WHO Situation Reports), please also consider noting that on the wiki. The purpose is to facilitate data analysis in this rapidly evolving pandemic. 

### Data Structure

Raw/transcribed data are stored as `.csv` files in the `/data-raw` directory, e.g. `/data-raw/WHO_SR.csv`. The scripts that converted the raw data into an R object are in a corresponding `.R` file in that directory (e.g. `/data-raw/WHO_SR.R`).

## Licence

This package uses freely available data, and itself is freely available with the CC0 licence. Information from WHO may be subject to WHO [copyright and terms](https://www.who.int/publishing/copyright/en/). The data source and package should be attributed. No warranty is made as to the accuracy of the data or transcription: use at your own risk. Please file an issue if you find any errors. 