
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

# Fix tag("div", list(...)) : could not find function "showOut. 
library(rCharts)

shinyUI(
  navbarPage("Country map Database Explorer",
             tabPanel("Plot",
                      sidebarPanel(

                        uiOutput("regionsControls"),
                        actionButton(inputId = "clear_all", label = "Clear selection", icon = icon("check-square")),
                        actionButton(inputId = "select_all", label = "Select all", icon = icon("check-square-o"))
                      ),
                      
                      mainPanel(
                        tabsetPanel(
                          
                          # Data by Country
                          tabPanel(p(icon("map-marker"), "By country"),
                                   column(3,
                                          wellPanel(
                                            radioButtons(
                                              "Category",
                                              "By Factors:",
                                              c("Population2005", "GDP_capita.MRYA"))
                                          )
                                   ),
                                   column(3,
                                          wellPanel(
                                            radioButtons(
                                              "environmentalCategory",
                                              "By Environmental factors :",
                                              c("AIR_E", "WATER_E","BIODIVERSITY"))
                                          )
                                   ),
                                   column(7,
                                          plotOutput("populationImpactByCountry"),
                                          plotOutput("environmentImpactByCountry")
                                   )
                                   
                          )
                          )
                      
                      
             )),
             
             tabPanel("About",
                      mainPanel(
                        includeMarkdown("include.md")
                      )
             )
  )
)
