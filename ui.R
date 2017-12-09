#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(markdown)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    navbarPage("Inpatient Prospective Payment System",
               tabPanel("Plot",
                        sidebarPanel(
                            uiOutput("drugchoices"),
                            uiOutput("statechoices")
                        ),
                        
                        mainPanel(
                            tabsetPanel(
                                tabPanel('By state',
                                         h4('Medicare Payment Summary: Relationship between Mean Covered Charges and Mean 
                                         Total Payments vary by medical condition for each state', align = "center"),
                                         plotOutput("plotlegend", height = "240px"),
                                         plotOutput("plotbystateCA"),
                                         plotOutput("plotbystateFL"),
                                         plotOutput("plotbystateIL"),
                                         plotOutput("plotbystateNY"),
                                         plotOutput("plotbystatePA"),
                                         plotOutput("plotbystateTX")),

                                tabPanel('View Data & Download',dataTableOutput(outputId="table"),downloadButton('downloadData.csv', 'Download'))
                            )
                        )
               ),
               tabPanel("Help", mainPanel(includeMarkdown("README.md")))
    )
))