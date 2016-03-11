shinyServer(function(input, output, session){
  output$bar <- renderPlotly({
    # Uses a functioni from plot.r to generate a graph
    stackbar(safe_num, warning_num, above_num, input$choice)
  })
  output$barstack <- renderPlotly({
    month_bar(total)
  })
  output$bar2 <- renderPlotly({
    month_line(avg_sep, avg_oct, avg_nov, avg_dec, avg_jan, avg_feb, avg_mar)
  })
}

)