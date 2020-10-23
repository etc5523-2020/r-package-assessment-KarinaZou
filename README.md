
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Coviddata

<!-- badges: start -->

<!-- badges: end -->

Coviddata contains a Shiny app which provides the information about the
Covid-19.Download the package to use the shiny app can explore the data
through the table,map and a plot.

Download this package and know more about the details.

## Installation

You can install the released version of Coviddata from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("Coviddata")
```

The development version can be installed from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("etc5523-2020/r-package-assessment-KarinaZou")
```

## Example

This is a basic example show you how to launch the app::

``` r
library(Coviddata)
library(tibble)
tb
#> # A tibble: 260 x 4
#>    date       confirmed death recovered
#>    <chr>          <int> <int>     <int>
#>  1 2020-10-07     50341   915     47505
#>  2 2020-10-06     41939   705     17248
#>  3 2020-10-05     39557   460     23443
#>  4 2020-10-04     35504   337     14377
#>  5 2020-10-03     50044   687     23953
#>  6 2020-10-02     54506   907     12719
#>  7 2020-10-01     44749   858     19962
#>  8 2020-09-30     41405   946     27383
#>  9 2020-09-29     42100   914     18697
#> 10 2020-09-28     33312   316     28328
#> # ... with 250 more rows
```

You can also embed plots, for example:
