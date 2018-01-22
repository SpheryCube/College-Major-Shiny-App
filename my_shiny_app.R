library(shiny)
library(ggplot2)

all_ages <- read.csv("all-ages.csv")

ui <- fluidPage(
  
  sliderInput(inputId = "num", 
              label = "Choose a number", 
              value = 25, min = 1, max = 100),
  plotOutput("hist")
)


server <- function(input, output) {
  output$hist <- renderPlot({
    hist(breaks = input$num, x = all_ages$Median)
  })
}

shinyApp(ui = ui, server = server)