library(shiny)
source("codeHolder.R")

ylabel <- "Number of Violent Crimes per 1000 Citizens"
xlabel <- "Year"
#display.mode = 'showcase'
shinyServer(function(input, output){
  cRefF <- reactive(filter(df, county_name == input$countyRef))
  cComF <- reactive(filter(df, county_name == input$countyCom))
  output$ratePlot <- renderPlot({
    cRef <- cRefF()
    cCom <- cComF()
    yvals <- union(cRef$ratex1000, cCom$ratex1000)
    ylimits <- c(min(yvals), max(yvals))
    cRefPlotTitle <- paste(input$countyRef, "vs.", input$countyCom, "Violent Crime Rates")
    plot(cRef$reportyear, cRef$ratex1000, type="b",col="red",lwd=3, xlab=xlabel,ylab=ylabel,main=cRefPlotTitle, ylim = ylimits)
    lines(cCom$reportyear, cCom$ratex1000, type="b", col = "green", lwd=3)
    legend(2006.5, ylimits[1], c(input$countyRef,input$countyCom), col=c("red", "green"), lwd=2, yjust = ((ylimits[2] - ylimits[1])/8)*-3)
  })
  output$avgRatio <- renderText({
    cRef <- cRefF()
    cCom <- cComF()
    mean(cRef$ratex1000/cCom$ratex1000)
  })
})