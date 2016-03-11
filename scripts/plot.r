# Requires packages to be used in script
library(dplyr)
library(plotly)
library(shiny)
source("C:/Users/Kevin Cha/Documents/info498f/Info-498F-Final-Project/scripts/help_find.r")
source("C:/Users/Kevin Cha/Documents/info498f/Info-498F-Final-Project/scripts/test_results.r")
# Saves graph into a function to be used in the rmd
# And takes in three different dataframes to be used in it
stackbar <- function(data1, data2, data3, name) { 
  # First section of the chart that uses the safe_num dataset
  return(plot_ly(x = data1[, 1],
                 y = data1[, name],
                 name = "Safe Level",
                 type = "bar",
                 marker = list(color = toRGB("springgreen4"))) %>%
       # Second section that takes in the warning_num dataset   
       add_trace(x = data2[, 1],
                 y = data2[, name],
                 name = "Warning Level",
                 marker = list(color = toRGB("darkorange"))) %>%
       # Third section that takes in the abovee_num dataset
       add_trace(x = data3[, 1],
                 y = data3[, name],
                 name = "Danger Level",
                 marker = list(color = toRGB("firebrick2"))) %>% 
          # Adds a layout function that names the axis of the graph
          # As wells as stacks the three different sections into one stacked bar chart
          layout(xaxis = list(title = "Wards"),
                 yaxis = list(title = "Number of Houses"),
                 barmode = "stack"))
}

# Line graph of the average lead amount across months
month_line <- function(data1, data2, data3, data4, data5, data6, data7) {
      x = c(data1[1,1], data2[1,1], data3[1,1], 
            data4[1,1], data5[1,1], data6[1,1], data7[1,1])
      y = c(data1[1,4], data2[1,4], data3[1,4], 
            data4[1,4], data5[1,4], data6[1,4], data7[1,4])
      return(plot_ly(x = x, y = y,
                     line = list(shape = "linear")) %>% 
              layout(xaxis = list(title = "Month"),
                     yaxis = list(title = "Average Lead Level(ppb)")))
}

month_bar <- function(data) {
             return(plot_ly(x = data[,1],
                     y = data[,3],
                     name = "Warning",
                     type = "bar",
                     marker = list(color = toRGB("wheat"))) %>% 
           add_trace(x = data[,1],
                     y = data[,4],
                     name = "Danger",
                     marker = list(color = toRGB("firebrick2"))) %>% 
              layout(barmode = "stack", xaxis = list(title = "Month"), 
                     yaxis = list(title = "Number of Houses")))
}
