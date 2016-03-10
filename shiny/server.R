library(plotly)
library(shiny)
library(dplyr)
library(ggplot2)
library(ggmap)

source("/Users/Pema/info498f/INFO-498F-Final-Project/scripts/help_find.R")

filter_loc <- read.csv("/Users/Pema/info498f/INFO-498F-Final-Project/data/Flint_Water_Filter_Locations.csv")

shinyServer(
  function(input, output) {
    output$plot1 <- renderPlot({
      p <- get_filter_map
      print(p)
    })
  })
