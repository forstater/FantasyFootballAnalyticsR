library(shiny)
risk5=optimizeDraft(maxRisk = 5.0, omit = drafted)$playerInfo
data_sets <- c("risk5")

shinyServer(function(input, output,session) {
 
   # Get the data set with the appropriate name

  dataIn <- data_sets
  colnames <- names(dataIn)

  updateSelectizeInput(session, 'foo', choices = draftData$player, server = TRUE)
  
# Output the data
  output$data_table <- renderTable({
    # If missing input, return to avoid error later in function
    if(is.null(input$dataset))
      return()
    
    # Get the data set
    dat <- get(input$dataset)
    riskTeam5 = optimizeDraft(maxRisk = 5.0, omit = drafted)$playerInfo
    output$mytable1 <- DT::renderDataTable({
        DT::datatable(riskTeam5[, input$show_vars, drop = FALSE])})
    # Make sure columns are correct for data set (when data set changes, the
    # columns will initially be for the previous data set)
    if (is.null(input$columns) || !(input$columns %in% names(dat)))
      return()
    
    # Keep the selected columns
    dat <- dat[, input$columns, drop = FALSE]
    
    # Return first 20 rows
    head(dat, 20)
  })
})

# 
# function(input, output) {
#   
#   # choose columns to display
#   riskTeam5 = optimizeDraft(maxRisk = 5.0, omit = drafted)$playerInfo
#   output$mytable1 <- DT::renderDataTable({
#     DT::datatable(riskTeam5[, input$show_vars, drop = FALSE])
#   })
#   
#   # sorted columns are colored now because CSS are attached to them
#   output$mytable2 <- DT::renderDataTable({
#     DT::datatable(mtcars, options = list(orderClasses = TRUE))
#   })
#   
# }
# 
# 
# #Priorities
# # - Update Drafted with Selectize
# # - Update myTeam with selectize + include cost and update
# # - Enable player to be removed from selection
# #
# #
# #
# 
# # **Future***
# # **Pos Name
# #  ** Bye Week
# #
# #
# #