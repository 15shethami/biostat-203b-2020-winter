# Load packages ----
library(shiny)
library(maps)
library(mapproj)

# Source helper functions -----
source("reading_data.R")
source("plotting_helper.R")


# User interface ----
ui <- fluidPage(
  titlePanel("Map of Coronovirus Cases"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create demographic maps with 
               information from the JHU CSSE."),
      
      selectInput("var", 
                  label = "Choose a type of case to display",
                  choices = c("Confirmed", "Recovered", "Death"),
                  selected = "Confirmed"),
      
      dateInput("date", 
                "Date",
                min = "2020-01-22", 
                max = as.character(Sys.Date())),
    ),
    mainPanel(plotOutput("map"))
  )
)

# Server logic ----
# server function is run once each time a user visits the app
server <- function(input, output) {
  # renderPlot is run once each time a user changes a widget that output$map depends on
  output$map <- renderPlot({
    #data <- switch(input$var,
                   #"Confirmed" = "confirmed",
                   #"Recovered" = "recovered",
                   #"Death" = "death")
    #date <- switch(input$dates)
    
    china_map(date, data)
  })
}

# Run app ----
shinyApp(ui, server)