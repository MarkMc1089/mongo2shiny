#' table_from_mongo_example UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_table_from_mongo_ui <- function(id) {
  ns <- NS(id)
  tagList(
    DT::dataTableOutput(ns("table"))
  )
}

#' table_from_mongo_example Server Functions
#'
#' @noRd
#' @importFrom utils head
mod_table_from_mongo_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # File .mongo-credentials.example should be edited and renamed according to
    # users own credentials
    eval_lines(".mongo-credentials")

    output$table <- DT::renderDataTable({
      get_mongo_collection(
        "rocks", "readr_samples",
        connection_string = glue::glue(
          "mongodb+srv://{MONGO_USER}:{MONGO_PASS}@{MONGO_HOST}",
          "/?tls=true&retryWrites=true&w=majority"
        )
      ) %>%
        utils::head()
    })
  })
}
