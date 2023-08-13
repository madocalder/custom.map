devtools::load_all()
library(shiny)
library(dplyr)
library(highcharter)

ui <- fluidPage(
  highchartOutput("map"),
  highchartOutput("map2")
)

server <- function(input, output) {
  output$map <- renderHighchart({
    data <- test_data
    data$categories <- sample(LETTERS[1:3], nrow(data), replace = TRUE)

    highcharter::highchart(type = "map") |> 
      hc_add_custom_map_cat(data = data, joinBy = "fips", value = "categories") |>
      highcharter::hc_colorAxis(
        dataClasses = list(
          list(
            from = "A",
            to = "A",
            name = "A"
          ),
          list(
            from = "B",
            to = "B",
            name = "B"
          ),
          list(
            from = "C",
            to = "C",
            name = "C"
          )
        )
      )
  })

  output$map2 <- renderHighchart({
    data <- us_map
    data <- purrr::map(data, \(x){
      x$value <- sample(LETTERS[1:3], 1, replace = TRUE)
      return(x)
    })

    highcharter::highchart(type = "map") |>
      highcharter::hc_add_series(
        data = data
      ) |>
      highcharter::hc_colorAxis(
        dataClasses = list(
          list(
            from = "A",
            to = "A",
            name = "A"
          ),
          list(
            from = "B",
            to = "B",
            name = "B"
          ),
          list(
            from = "C",
            to = "C",
            name = "C"
          )
        )
      )
  })
}

shinyApp(ui, server, options = list(port = 3030L))

