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
  tagList(
    includeMarkdown(system.file("app", "www", "mod_markdown_example.md",
      package = "mongo2shiny"
    ))
  )
}

#' markdown_example Server Function
#'
#' @noRd
mod_markdown_example_server <- function(id) {
  moduleServer(id, function(input, output, session) {

  })
}
