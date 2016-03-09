library(dplyr)
library(plotly)
library(shiny)

setwd("/Users/Pema/info498f/INFO-498F-Final-Project")
data <- read.csv("data/Flint-Samples-Final.csv")

plot <- function(dataset, input1) {
  return(plot_ly(data = dataset, x = data[,3], y = paste0(dataset[,input1]), type = "bar") %>% 
           layout(xaxis = list(title = "Wards"), yaxis = list(title = input1)))  
}

plot2 <- function(dataset) {
  Wards <- dataset[,3]
  return(plot_ly(data = dataset, x = dataset[,4], y = dataset[,6], color = Wards, type = "scatter", mode = "markers") %>% 
           layout(xaxis = list(title = "Pb Level Pre-Flush"), yaxis = list(title = "Pb Level 2 Min After")))
  }
