# Requires packages to be used in script
library(dplyr)
library(plotly)
library(shiny)

source("scripts/test_results.r")
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
      y = c(data1[1,5], data2[1,5], data3[1,5], 
            data4[1,5], data5[1,5], data6[1,5], data7[1,5])
      return(plot_ly(x = x, y = y,
                     line = list(shape = "linear")) %>% 
              layout(xaxis = list(title = "Month"),
                     yaxis = list(title = "Average Lead Level(ppb)")))
}

month_bar <- plot_ly(x = total[,1],
                     y = total[,3],
                     name = "Warning",
                     type = "bar",
                     marker = list(color = toRGB("wheat"))) %>% 
           add_trace(x = total[,1],
                     y = total[,4],
                     name = "Danger",
                     marker = list(color = toRGB("firebrick2"))) %>% 
              layout(barmode = "stack")
