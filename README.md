# data2019nCoV R Package

This is a simple R package to store data about the 2019-2020 novel coronavirus outbreak. Currently, it contains the data extracted from the World Health Organization (WHO) [situation reports](https://www.who.int/emergencies/diseases/novel-coronavirus-2019/situation-reports) stored in an object, `WHO_SR`.

The package can be installed via `devtools::install_github("eebrown/data2019nCoV")`.

More information and plotted examples can be found in the [vignette](https://htmlpreview.github.io/?https://github.com/eebrown/data2019nCoV/blob/master/doc/WHO_SR.html). 

## Contributions

Contributions are welcome in the form of updates, corrections, and the contribution of new datasets, provided they are publicly available, verifiable, and from a reputable source.

Raw data files (e.g. `.csv`) are in the `/raw-data` directory, along with a `.R` file that can be run to generate the data object for the package.

## Licence

This package uses freely available data, and itself is freely available with the CC0 licence. Information from WHO may be subject to WHO [copyright and terms](https://www.who.int/publishing/copyright/en/). The data source and package should be attributed. No warranty is made as to the accuracy of the data: use at your own risk. Please file an issue if you find any errors. 