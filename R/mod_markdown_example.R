#' markdown_example UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_markdown_example_ui <- function(id) {
  ns <- NS(id)
  tagList(
    includeMarkdown(system.file("app", "www", "mod_markdown_example.md", package = "mongo2shiny"))
  )
}

#' markdown_example Server Function
#'
#' @noRd
mod_markdown_example_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
  })
}

## To be copied in the UI
# mod_markdown_example_ui("markdown_example_1")

## To be copied in the server
# callModule(mod_markdown_example_server, "markdown_example_1")
