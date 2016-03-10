library(plotly)
library(shiny)
library(dplyr)
library(ggplot2)

source("scripts/help_find.R")

filter_loc <- read.csv("data/Flint_Water_Filter_Locations.csv")

shinyServer(
  function(input, output) {
    output$plot1 <- renderPlot({
      p <- get_filter_map
      print(p)
    })
  })
