# data2019nCoV R Package

This is a simple R package to store data about the 2019-2020 novel coronavirus, COVID-19, outbreak. Currently, it contains the data extracted from the World Health Organization (WHO) [situation reports](https://www.who.int/emergencies/diseases/novel-coronavirus-2019/situation-reports) up to 2020-02-19 (Situation Reports # 1-30).

Plots of the data can be found in the [vignette](https://htmlpreview.github.io/?https://github.com/eebrown/data2019nCoV/blob/master/doc/WHO_SR.html). 

Once the package is installed and loaded, the data is available in a data.frame object, `WHO_SR`. 

The package can be installed via `devtools::install_github("eebrown/data2019nCoV")`. Be sure to reinstall to obtain the latest version as new data is released (including the errata periodically reported by WHO).


## Contributions

Contributions are welcome in the form of corrections and the contribution of new datasets, provided they are publicly available, verifiable, and from a reputable source.

### Data Structure

Raw/transcribed data are stored as `.csv` files in the `/data-raw` directory, e.g. `/data-raw/WHO_SR.csv`. The scripts to convert the raw data into an R object are in a corresponding `.R` file in that directory (e.g. `/data-raw/WHO_SR.R`). That is, a `.csv` file is what is updated, and then the corresponding `.R` file's scripts should be run to generate the data object for the package.

## Licence

This package uses freely available data, and itself is freely available with the CC0 licence. Information from WHO may be subject to WHO [copyright and terms](https://www.who.int/publishing/copyright/en/). The data source and package should be attributed. No warranty is made as to the accuracy of the data or transcription: use at your own risk. Please file an issue if you find any errors. 