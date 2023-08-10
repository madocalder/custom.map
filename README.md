<!-- badges: start -->
<!-- badges: end -->

# custom.map

Custom map of the 'United States of America' including 'Freely Associated States' for highcharter.

## Installation

You can install the development version of custom.map from [GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("devOpifex/custom.map")
```

## Example

Creating a map from scratch.

``` r
library(custom.map)

hc_custom_map(data = test_data, joinBy = "fips", value = "value") |> 
  highcharter::hc_colorAxis(min = 4600)
```

Adding the series to an existing highchart.

``` r
highcharter::highchart(type = "map") |>
  hc_add_custom_map(data = test_data, joinBy = "fips", value = "value") |> 
  hc_colorAxis(min = 4600)
```

