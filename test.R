devtools::load_all()

hc_custom_map(data = test_data, joinBy = "fips", value = "value") |> 
  hc_colorAxis(min = 4600)
