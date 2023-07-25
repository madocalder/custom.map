library(dplyr)

m <- jsonlite::read_json("inst/mapdata.json")

us_map <- m[[1]]$mapData
separators <- m[[2]]$mapData

test_data <- us_map |>
  purrr::map_dfr(as.data.frame) |>
  select(id, name, fips) |>
  mutate(
    value = 1e5 * abs(rt(n(), df = 10))
  )

usethis::use_data(us_map, separators, overwrite = TRUE, internal = TRUE)
usethis::use_data(test_data, overwrite = TRUE)
