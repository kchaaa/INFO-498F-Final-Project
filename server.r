shinyServer(function(input, output, session){
  output$bar <- renderPlotly({
    # Uses a function from plot.r to generate a graph for ward.
    stackbar(safe_num, warning_num, above_num, input$choice)
  })
  # Creates the interactive graph for time.
  output$barstack <- renderPlotly({
    month_bar(total, input$name)
  })
  # Creates the average line graph.
  output$bar2 <- renderPlotly({
    month_line(avg_sep, avg_oct, avg_nov, avg_dec, avg_jan, avg_feb, avg_mar)
  })
  # Creates the map
  output$plot1 <- renderPlot({
    p <- get_filter_map
    print(p)
  })
}

)