library(shiny)

flush <- colnames(data)[4:6]

shinyUI(fluidPage(
  titlePanel("Flint Water Contamination"),
  sidebarLayout(
    sidebarPanel(
      "Contamination",
      selectInput("choice", label = h3("Time"),
                  choices = flush, selected = "Pb.Bottle.1..ppb....First.Draw")
    ),
    mainPanel(
      plotlyOutput("bar")
    )
  )
))