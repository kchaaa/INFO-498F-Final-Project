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
names <- colnames(safe_num[2:4])
shinyApp(
  ui = fluidPage(
    titlePanel("Flint Water Contamination"),
    sidebarLayout(
      sidebarPanel(
        selectInput("choice", label = h3("Test Type"),
                    choices = names, selected = "First_Ward_Num")
      ),
      mainPanel(
        plotlyOutput("bar")
      )
    )
  ),
  #--
  server = function(input, output) {
    output$bar <- renderPlotly({
      stackbar(safe_num, warning_num, above_num, input$choice)
    })
  })