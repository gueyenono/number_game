hot_module_ui <- function(id){
  
  ns <- NS(id)
  
  tagList(
    rHandsontableOutput(outputId = ns("grid")),
    br(),
    actionButton(inputId = ns("submit"), label = "Submit"),
    br(),
    tableOutput(outputId = ns("df"))
  )
  
}


hot_module <- function(input, output, session){
  
  values <- as.data.frame(matrix(sample(9), nrow = 3))
  
  react <- reactiveValues()
  
  observe({
    na_df <- values
    na_df[] <- as.integer(NA)
    react$hot_display <-  rhandsontable(na_df, rowHeaders = NULL, colHeaders = NULL)
  })
  
  observeEvent(input$submit, {
    react$hot_display <- update_hot(hot = input$grid, x = values)
  })
  
  output$grid <- renderRHandsontable({
    react$hot_display
  })
  
  output$df <- renderTable({
    values
  })
}