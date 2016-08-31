library(shiny)
library(ggplot2)  # for the diamonds dataset

shinyUI(pageWithSidebar(
  
  headerPanel(""),
  
  sidebarPanel(
    selectizeInput('foo',label="test",choices=NULL, multiple=TRUE),
    uiOutput("choose_columns")

  ),
  
  
  mainPanel(
    tableOutput("data_table")
  )
))

# fluidPage(
#   title = 'Examples of DataTables',
#   sidebarLayout(
#     sidebarPanel(
#       conditionalPanel(
#         'input.dataset === "optimizeData"',
#         checkboxGroupInput('show_vars', 'Columns in diamonds to show:', c("players": "players"))
#       )
#       ),
#       mainPanel(
#         tabsetPanel(
#           id = 'dataset',
#           tabPanel('diamonds', DT::dataTableOutput('mytable1')),
#           tabPanel('mtcars', DT::dataTableOutput('mytable2'))
#         )
#       )
#     )
#   )
  