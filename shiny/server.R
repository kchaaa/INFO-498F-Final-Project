library(plotly)
library(shiny)
library(dplyr)

setwd("C:/Users/Administrator.UWIT-JAIE3J3AAH/Documents/Code/info498f/INFO-498F-Final-Project")
data <- read.csv("data/Flint-Samples-Final.csv")
source("scripts/plot.R")

shinyServer(function(input, output) {
  output$bar <- renderPlotly({
    plot(data, input$choice)
  })
})