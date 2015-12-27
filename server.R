library(shiny)

# Plotting 
library(ggplot2)
library(rCharts)
library(ggvis)

# Data processing libraries
library(data.table)
library(reshape2)
library(dplyr)

# Required by includeMarkdown
library(markdown)

# It has to loaded to plot ggplot maps on shinyapps.io
library(mapproj)
library(maps)

# Load  functions
source("explore_map.R", local = TRUE)


# Load data
data(countryExData)
regions <- sort(unique(countryExData$EPI_regions))

# Shiny server 
shinyServer(function(input, output, session) {
  
  # Define and initialize reactive values
  values <- reactiveValues()
  values$regions <- regions
  
  # Create epi regions checkbox
  output$regionsControls <- renderUI({
    checkboxGroupInput('regions', 'EPI Regions', regions, selected=values$regions)
  })
  
  # Add observers on clear and select all buttons
  observe({
    if(input$clear_all == 0) return()
    values$regions <- c()
  })
  
  observe({
    if(input$select_all == 0) return()
    values$regions <- regions
  })
  
  # Preapre datasets
  
  # Prepare dataset for maps
  dt.agg <- reactive({
    dt.agg<-aggregate_by_country(countryExData, input$regions)
  })
  
  # Render Plots
  
  # Population impact by state
  output$populationImpactByCountry <- renderPlot({
    print(barfun(dt=compute_affected(dt.agg(),input$Category), input$Category ))}) 
          
output$environmentImpactByCountry <- renderPlot({
  print(barfun1(dt=compute_factor(dt.agg(),input$environmentalCategory), input$environmentalCategory ))}) 
})