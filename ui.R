library(shiny)
source("codeHolder.R")

shinyUI(pageWithSidebar(
  headerPanel("Violent Crime Rates in California Counties"),
  sidebarPanel(
    h3("Compare Counties"),
    selectInput("countyRef", "1. Select a Reference County", as.character(unique(df$county_name))),
    selectInput("countyCom", "2. Select a Comparison County", as.character(unique(df$county_name))),
    h5("Mean Reference-to-Comparison Violent Crime Rate Ratio"),
    textOutput("avgRatio")
    ),
  mainPanel(
    plotOutput("ratePlot")
    )
  )
  )