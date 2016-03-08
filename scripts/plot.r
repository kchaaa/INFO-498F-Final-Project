library(dplyr)
library(plotly)
library(shiny)

setwd("C:/Users/Administrator.UWIT-JAIE3J3AAH/Documents/Code/info498f/INFO-498F-Final-Project")
data <- read.csv("data/Flint-Samples-Final.csv")

plot <- function(dataset, input1) {
  return(plot_ly(data = dataset, x = data[,3], y = paste0(dataset[,input1]), type = "bar") %>% 
           layout(xaxis = list(title = "Wards"), yaxis = list(title = input1)))  
}
