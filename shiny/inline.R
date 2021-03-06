library(shiny)
library(plotly)

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
  },
  options = list(height = 463)
  )

# Implements the line graph for shiny
shinyApp(
  ui = fluidPage(
    titlePanel("Flint Water Contamination"),
      mainPanel(
        plotlyOutput("bar")
      )
    ),
  #--
  server = function(input, output) {
    output$bar <- renderPlotly({
      month_line(avg_sep, avg_oct, avg_nov, avg_dec, avg_jan, avg_feb, avg_mar)
    })
  },
  options = list(height = 463)
)
