#' chart_example UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_chart_example_ui <- function(id) {
  ns <- NS(id)
  tagList(
    sliderInput(
      inputId = ns("bins"),
      label = "Number of bins:",
      min = 1,
      max = 50,
      value = 30
    ),
    highcharter::highchartOutput(
      outputId = ns("chart")
    )
  )
}

#' chart_example Server Function
#'
#' @noRd
#'
#' @importFrom graphics hist
mod_chart_example_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$chart <- highcharter::renderHighchart({

      # Generate bins based on input$bins from ui.R
      x <- mongo2shiny::faithful[, 2]
      bins <- seq(min(x), max(x), length.out = input$bins + 1)

      # Draw the histogram with the specified number of bins
      chart <- hist(x, breaks = bins)

      # Output interactive chart
      chart %>%
        highcharter::hchart() %>%
        theme_nhsbsa()
    })
  })
}
