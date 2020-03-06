[![DOI](https://zenodo.org/badge/237660917.svg)](https://zenodo.org/badge/latestdoi/237660917)

# data2019nCoV R Package

This is a simple R package to store data about the 2019-2020 novel coronavirus, COVID-19, outbreak. Currently, it contains the data extracted from the World Health Organization (WHO) [situation reports](https://www.who.int/emergencies/diseases/novel-coronavirus-2019/situation-reports) up to 2020-03-05 (Situation Reports # 1-45).

There is no guarantee as to the accuracy of the transcribed data or graphs in the vignette. Please file an issue if any errors (discrepancies with the WHO reports) are noticed.

## Demo

Plots of the data can be found in the [vignette](https://htmlpreview.github.io/?https://github.com/eebrown/data2019nCoV/blob/master/doc/WHO_SR.html). 

## Usage

The package can be installed via `devtools::install_github("eebrown/data2019nCoV")`. Be sure to reinstall to obtain the latest version as new data is released (including the errata periodically reported by WHO).

Once the package is installed and loaded, the data is available in a data.frame object, `WHO_SR`. 

Although it may be less up-to-date, the data from this package will also appear in the package [`outbreaks`](https://github.com/reconhub/outbreaks), with variable names consistent with that package's norms.

### Data Structure

Raw/transcribed data are stored as `.csv` files in the `/data-raw` directory, e.g. `/data-raw/WHO_SR.csv`. The scripts that converted the raw data into an R object are in a corresponding `.R` file in that directory (e.g. `/data-raw/WHO_SR.R`).

## Licence

This package uses freely available data, and itself is freely available with the CC0 licence. Information from WHO may be subject to WHO [copyright and terms](https://www.who.int/publishing/copyright/en/). The data source and package should be attributed. No warranty is made as to the accuracy of the data or transcription: use at your own risk. Please file an issue if you find any errors. 