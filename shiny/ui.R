library(shiny)
library(plotly)

shinyUI(fluidPage(
  titlePanel("Flint Water Contamination"),
  sidebarLayout(
    sidebarPanel(
      h4("Test Plot")),
      mainPanel(
        plotOutput("plot1")
      )
  )
))