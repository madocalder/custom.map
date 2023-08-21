#' Custom Map
#' 
#' Custom map of the United States.
#' 
#' @param ... Arguments passed to [highcharter::hc_add_series()].
#' @param data Dataset to map.
#' @param value Categorical value to map, column of `data`.
#' @param joinBy Column to join with map dataset.
#' @param mapType Type of map, accepts `a` or `b`.
#' 
#' @examples
#' hc_custom_map(data = test_data, joinBy = "fips", value = "value") |> 
#'   highcharter::hc_colorAxis(min = 4600)
#' 
#' @name custom_map
#' @export
hc_custom_map <- function(..., mapType = c("a", "b")) {
  map <- get_map(mapType)

  h <- highcharter::highchart(type = "map") |>
    highcharter::hc_add_series(
      type = "map",
      mapData = map,
      showInLegend = FALSE,
      ...
    )
  
  if(mapType[1] != "a")
    return(h)
  
  h |>
    highcharter::hc_add_series(
      type = "mapline",
      mapData = separators,
      showInLegend = FALSE,
      enableMouseTracking = FALSE
    )
}

#' @name custom_map
#' @export
hc_add_custom_map <- function(..., mapType = c("a", "b")) {
  map <- get_map(mapType)

  h <- highcharter::hc_add_series(
    ...,
    type = "map",
    mapData = map,
    showInLegend = FALSE
  ) 

  if(mapType[1] != "a")
    return(h)
  
  h |>
    highcharter::hc_add_series(
      type = "mapline",
      mapData = separators,
      showInLegend = FALSE,
      enableMouseTracking = FALSE
    )
}

#' @name custom_map
#' @export
hc_add_custom_map_cat <- function(data, value, joinBy, ..., mapType = c("a", "b")) {
  map <- get_map(mapType)

  data$value <- NULL

  map <- map |>
    purrr::map_dfr(as.data.frame) |>
    dplyr::left_join(data, by = joinBy) |>
    dplyr::rename(value = value)

  h <- highcharter::hc_add_series(
    ...,
    data = map
  )

  if(mapType[1] != "a")
    return(h)
  
  h |>
    highcharter::hc_add_series(
      type = "mapline",
      mapData = separators,
      showInLegend = FALSE,
      enableMouseTracking = FALSE
    )
}

get_map <- function(type = c("a", "b")) {
  type <- match.arg(type)

  if(type == "a")
    return(us_map)

  return(us_map2)
}

