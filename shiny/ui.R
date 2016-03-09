library(shiny)
library(plotly)

setwd("C:/Users/Administrator.UWIT-JAIE3J3AAH/Documents/Code/info498f/INFO-498F-Final-Project")
data <- read.csv("data/Flint-Samples-Final.csv")

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