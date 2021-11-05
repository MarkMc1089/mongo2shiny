#' table_from_mongo_example UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_table_from_mongo_example_ui <- function(id) {
  ns <- NS(id)
  tagList(
    DT::dataTableOutput(ns("table"))
  )
}

#' table_from_mongo_example Server Functions
#'
#' @noRd
#' @importFrom utils head
mod_table_from_mongo_example_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    output$table <- DT::renderDataTable({
      get_mongo_collection(
        "rocks", "readr_samples",
        connection_string = paste0(
          "mongodb+srv://admin:admin@sandbox.qyjv9",
          ".mongodb.net/?tls=true&retryWrites=true&w=majority"
        )
      ) %>%
        utils::head()
    })
  })
}

## To be copied in the UI
# mod_table_from_mongo_example_ui("table_from_mongo_example_ui_1")

## To be copied in the server
# mod_table_from_mongo_example_server("table_from_mongo_example_ui_1")
