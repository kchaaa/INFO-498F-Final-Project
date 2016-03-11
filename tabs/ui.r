library(shiny)
library(dplyr)
#source('C:/Users/Administrator.UWIT-JAIE3J3AAH/Documents/Code/info498f/INFO-498F-Final-Project/scripts/help_find.r')
#source('C:/Users/Administrator.UWIT-JAIE3J3AAH/Documents/Code/info498f/INFO-498F-Final-Project/scripts/plot.r')
#source('C:/Users/Administrator.UWIT-JAIE3J3AAH/Documents/Code/info498f/INFO-498F-Final-Project/scripts/test_results.r')
#source("C:/Users/Administrator.UWIT-JAIE3J3AAH/Documents/Code/info498f/INFO-498F-Final-Project/tabs/wrangling.r")
names <- colnames(safe_num[2:4])
#--------------------------------------------------------------#


shinyUI(navbarPage("Nav!",
  tabPanel("plot",
    sidebarLayout(
      sidebarPanel(
        selectInput("choice", label = h3("Test Type"), choices = names, selected = "First_Ward_Num")
      ),
        mainPanel(plotlyOutput("bar"))
    )
  ),
  tabPanel("barstack",
    plotlyOutput("barstack")
  ),
  tabPanel("nutzonhischin",
    plotlyOutput("bar2")
  )
))

