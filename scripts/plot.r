library(dplyr)
library(plotly)
library(shiny)

plot <- function(dataset, input1) {
  return(plot_ly(data = dataset, x = data[,3], y = paste0(dataset[,input1]), type = "bar") %>% 
           layout(xaxis = list(title = "Wards"), yaxis = list(title = input1)))  
}

plot2 <- function(dataset) {
  return(plot_ly(data = dataset, x = dataset[,4], y = dataset[,6], color = dataset[,3], type = "scatter", mode = "markers") %>% 
           layout(xaxis = list(title = "Pb Level Pre-Flush"), yaxis = list(title = "Pb Level 2 Min After")))
}

stackbar <- plot_ly(
  x = warning_levels[,3],
  y = warning_levels[,6],
  name = "Warning Level",
  type = "bar"
)
stackbar2 <- add_trace(
  p,
  x = above_epa[,3],
  y = above_epa[,6],
  name = "Action Level"
) %>% 
  layout(barmode = "stack")

