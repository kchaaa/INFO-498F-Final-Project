library(plotly)
library(shiny)
library(dplyr)
library(ggplot2)
library(ggmap)

shinyServer(
  function(input, output) {
    output$plot1 <- renderPlot({
      p <- get_filter_map
      print(p)
    })
    
    output$Hover_Info <- renderPrint({
      cat("input$plot_hover:\n")
      str(input$plot_hover)
    })
  })





