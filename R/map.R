#' Custom Map
#' 
#' Custom map of the United States.
#' 
#' @param ... Arguments passed to [highcharter::hc_add_series()].
#' 
#' @examples
#' hc_custom_map(data = test_data, joinBy = "fips", value = "value") |> 
#'   highcharter::hc_colorAxis(min = 4600)
#' 
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
