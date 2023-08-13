#' Custom Map
#' 
#' Custom map of the United States.
#' 
#' @param ... Arguments passed to [highcharter::hc_add_series()].
#' @param data Dataset to map.
#' @param value Categorical value to map, column of `data`.
#' @param joinBy Column to join with map dataset.
#' 
#' @examples
#' hc_custom_map(data = test_data, joinBy = "fips", value = "value") |> 
#'   highcharter::hc_colorAxis(min = 4600)
#' 
#' @name custom_map
#' @export
hc_custom_map <- function(...) {
  highcharter::highchart(type = "map") |>
    highcharter::hc_add_series(
      type = "map",
      mapData = us_map,
      showInLegend = FALSE,
      ...
    ) |>
    highcharter::hc_add_series(
      type = "mapline",
      mapData = separators,
      showInLegend = FALSE,
      enableMouseTracking = FALSE
    )
}

#' @name custom_map
#' @export
hc_add_custom_map <- function(...) {
  highcharter::hc_add_series(
    ...,
    type = "map",
    mapData = us_map,
    showInLegend = FALSE
  ) |>
    highcharter::hc_add_series(
      type = "mapline",
      mapData = separators,
      showInLegend = FALSE,
      enableMouseTracking = FALSE
    )
}

#' @name custom_map
#' @export
hc_add_custom_map_cat <- function(data, value, joinBy, ...) {
  data$value <- NULL

  map <- us_map |>
    purrr::map_dfr(as.data.frame) |>
    dplyr::left_join(data, by = joinBy) |>
    dplyr::rename(value = value) |>
    dplyr::glimpse()

  highcharter::hc_add_series(
    ...,
    data = map
  ) |>
    highcharter::hc_add_series(
      type = "mapline",
      mapData = separators,
      showInLegend = FALSE,
      enableMouseTracking = FALSE
    )
}
