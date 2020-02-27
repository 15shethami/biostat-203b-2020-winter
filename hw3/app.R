# Load packages ----
library(shiny)
library(maps)
library(mapproj)

# Source helper functions -----
source("reading_data.R")
source("plotting_helper.R")


# User interface ----
ui <- fluidPage(
  titlePanel("Coronavirus Cases in China"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create plots with 
               information about coronavirus cases in China from the JHU CSSE."),
      
      selectInput("var", 
                  label = "Choose a type of case",
                  choices = c("Confirmed", "Recovered", "Death"),
                  selected = "Confirmed"),
      
      dateInput("date", 
                label = "Select a date",
                min = "2020-01-22", 
                max = as.character(Sys.Date()))
    ),
    mainPanel(plotOutput("map1"), plotOutput("map2"))
  )
)

# Server logic ----
# server function is run once each time a user visits the app
server <- function(input, output) {
  # renderPlot is run once each time a user changes a widget that output$map depends on
  output$map1 <- renderPlot({
    data <- switch(input$var,
                   "Confirmed" = "confirmed",
                   "Recovered" = "recovered",
                   "Death" = "death")
    
    china_map(input$date, data, input$var)
  })
  
  output$map2 <- renderPlot({
    data <- switch(input$var,
                   "Confirmed" = "confirmed",
                   "Recovered" = "recovered",
                   "Death" = "death")

    province_bar(input$date, data, input$var)
  })
}

# Run app ----
shinyApp(ui, server)