# Load packages ----
library(shiny)
library(maps)
library(mapproj)

# Source helper functions -----
source("reading_data.R")
source("plotting_helper.R")


# User interface ----
ui <- fluidPage(
  titlePanel("Map of Coronavirus Cases in China"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create map of China with 
               information about coronavirus cases from the JHU CSSE."),
      
      selectInput("var", 
                  label = "Choose a type of case",
                  choices = c("Confirmed", "Recovered", "Death"),
                  selected = "Confirmed"),
      
      dateInput("date", 
                label = "Date",
                min = "2020-01-22", 
                max = as.character(Sys.Date()))
    ),
    mainPanel(plotOutput("map"))
  )
)

# Server logic ----
# server function is run once each time a user visits the app
server <- function(input, output) {
  # renderPlot is run once each time a user changes a widget that output$map depends on
  output$map <- renderPlot({
    data <- switch(input$var,
                   "Confirmed" = "confirmed",
                   "Recovered" = "recovered",
                   "Death" = "death")
    
    china_map(input$date, data)
  })
}

# Run app ----
shinyApp(ui, server)