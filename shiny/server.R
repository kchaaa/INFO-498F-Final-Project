library(plotly)
library(shiny)
library(dplyr)
library(ggplot2)
library(ggmap)

<<<<<<< HEAD
source("/Users/Pema/info498f/INFO-498F-Final-Project/scripts/help_find.R")

filter_loc <- read.csv("/Users/Pema/info498f/INFO-498F-Final-Project/data/Flint_Water_Filter_Locations.csv")
=======
source("c:/Users/Administrator.UWIT-JAIE3J3AAH/Documents/Code/info498f/INFO-498F-Final-Project/scripts")

filter_loc <- read.csv("C:/Users/Administrator.UWIT-JAIE3J3AAH/Documents/Code/info498f/INFO-498F-Final-Project/data/Flint_Water_Filter_Locations.csv")
>>>>>>> 0296d42574afd4261fd9cda1b6a8932bf38d5527

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





