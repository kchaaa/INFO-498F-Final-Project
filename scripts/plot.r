# Requires packages to be used in script
library(dplyr)
library(plotly)
library(shiny)

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
