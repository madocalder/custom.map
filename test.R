devtools::load_all()
library(highcharter)

hc_custom_map(data = test_data, joinBy = "fips", value = "value") |> 
  hc_colorAxis(min = 4600)

highcharter::highchart(type = "map") |>
  hc_add_custom_map(data = test_data, joinBy = "fips", value = "value") |> 
  hc_colorAxis(min = 4600)
