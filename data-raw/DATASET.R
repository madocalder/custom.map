library(dplyr)

m <- jsonlite::read_json("inst/mapdata.json")
m2 <- jsonlite::read_json("inst/mapdata2.json")
m3 <- jsonlite::read_json("inst/mapdata3.json")

us_map <- m[[1]]$mapData
us_map <- purrr::map2(us_map, m2[[1]]$mapData, \(m1, m2) {
  m1$fips <- as.numeric(m1$fips)
  m1$path <- m2$path
  return(m1)
})
us_map2 <- m3[[1]]$mapData
us_map2 <- purrr::map(us_map2, \(m) {
  m$fips <- as.numeric(m$fips)
  return(m)
})

separators <- m2[[2]]$mapData

test_data <- us_map |>
  purrr::map_dfr(as.data.frame) |>
  select(id, name, fips) |>
  mutate(
    value = 1e5 * abs(rt(n(), df = 10))
  )

usethis::use_data(us_map, us_map2, separators, overwrite = TRUE, internal = TRUE)
usethis::use_data(test_data, overwrite = TRUE)
