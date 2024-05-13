devtools::load_all()
library(shiny)
library(dplyr)
library(highcharter)

ui <- fluidPage(
  highchartOutput("map3", width = "100%", height = 1000),
  highchartOutput("map", width = "100%", height = 1000),
  highchartOutput("map4", width = "100%", height = 1000),
  highchartOutput("map2", width = "100%", height = 1000)
)

server <- function(input, output) {
  output$map3 <- renderHighchart({
    highcharter::highchart(type = "map") |> 
      hc_add_custom_map(data = test_data, joinBy = "fips", value = "value", mapType = "c") |>
      highcharter::hc_colorAxis(min = 4600)
  })

  output$map4 <- renderHighchart({
    highcharter::highchart(type = "map") |> 
      hc_add_custom_map(data = test_data, joinBy = "fips", value = "value", mapType = "a") |>
      highcharter::hc_colorAxis(min = 4600)
  })

  output$map <- renderHighchart({
    highcharter::highchart(type = "map") |> 
      hc_add_custom_map(data = test_data, joinBy = "fips", value = "value", mapType = "b") |>
      highcharter::hc_colorAxis(min = 4600)
  })


  output$map2 <- renderHighchart({
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
}

shinyApp(ui, server, options = list(port = 3030L))

