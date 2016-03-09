setwd("C:/Users/Administrator.UWIT-JAIE3J3AAH/Documents/Code/info498f/INFO-498F-Final-Project")
data <- read.csv("data/Flint-Samples-FINAL.CSV")
data2 <- read.csv("data/Flint_Water_Filter_Locations.CSV")
#-------------------------
# Exclusion of data should be more in depth rather than just eleiminating those with values above 100.
# Possibly just omit the value that breaches 1000.
#-------------------------
#--------------------------------------------------------------#
# This section implements the shiny framework in an inline fashion
library(shiny)
library(plotly)
setdata <- list("Above EPA" = above_epa, "Warning Levels" = warning_levels)
flush <- colnames(data)[4:6]
shinyApp(
  ui = fluidPage(
    titlePanel("Flint Water Contamination"),
    sidebarLayout(
      sidebarPanel(
        "Contamination",
        selectInput("choice", label = h3("Time"),
                    choices = flush, selected = "Pb.Bottle.1..ppb....First.Draw"),
        selectInput("dataset", label = h3("Warning Level"),
                    choices = setdata, selected = warning_levels)
      ),
      mainPanel(
        tabsetPanel(
          tabPanel("Bar", plotlyOutput("bar")),
          tabPanel("Scatter", plotlyOutput("warning"))
        )
      )
    )
  ),
  #--
  server = function(input, output) {
    output$bar <- renderPlotly({
      plot(data, input$choice)
    })
    output$warning <- renderPlotly({
      plot2(input$dataset)
    })
  })
