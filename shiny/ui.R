library(shiny)
library(plotly)
library(ggplot2)

shinyUI(fluidPage(
  titlePanel("Flint Water Contamination"),
  sidebarLayout(
    sidebarPanel(
      h4("Test Plot")),
      mainPanel(
        plotOutput("plot1")
      )
  ),
  
  fluidRow(
    column(width = 3,
           div(class = "option-group"),
           radioButtons("dataset", "Data set",
                        choices = c("First Draw", "45 Seconds", "2 Minutes"), inline = TRUE),
           )
  )
))