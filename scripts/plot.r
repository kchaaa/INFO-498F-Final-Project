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
  x = safe_num[,1],
  y = safe_num[,2],
  name = "Safe Level",
  type = "bar",
  marker = list(color = toRGB("springgreen4"))
  ) %>% 
 add_trace(
  x = warning_num[,1],
  y = warning_num[,2],
  name = "Warning Level",
  marker = list(color = toRGB("darkorange"))
  ) %>% 
  add_trace(
    x = above_num[,1],
    y = above_num[,2],
    name = "Danger Level",
    marker = list(color = toRGB("firebrick2"))
  ) %>% 
  layout(
    xaxis = list(title = "Wards"),
    yaxis = list(title = "Number of Houses"),
    barmode = "stack"
  )



