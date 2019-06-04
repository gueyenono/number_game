library(shiny)
library(rhandsontable)
source("R/update_hot.R")
source("R/helper_functions.R")

ui <- fluidPage(
  
  titlePanel("The number game"),
  
  mainPanel(
    hot_module_ui("table1")
  )
)