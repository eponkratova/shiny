#install.packages('rsconnect')
library(rsconnect)
library(radarchart)
library(shiny)
library(ggplot2)

#Creating a dataset
scores <- data.frame("Label"=c("Real-time","Scalability","Maintenance",
                               "Publishing, sharing and collaborating","Degree of analysis",
                               "Customizability","Cost","Visual appeal"),
                     "OSDV" = c(2,2,2,3,2,1,1,2),
                     "EDV" = c(1,1,1,3,2,2,1,2),
                     "OSR" = c(1,3,1,3,1,1,3,1),
                     "EDVI" = c(1,3,1,1,3,2,3,2),
                     "OSAA" = c(1,3,3,1,3,3,3,2),
                     "OSDV" = c(3,2,2,2,3,2,3,2)                     
                     )


# Define UI for application that plots features of movies
ui <- fluidPage(
  #App title
  titlePanel("Tools comparison"),
  
  # Sidebar layout with a input and output definitions
  sidebarLayout(
    
    # Inputs
    sidebarPanel(
      checkboxGroupInput('selectedPeople', 'Select a stack', 
                         names(scores)[-1], selected="OSDV")
    ),
    
    # Outputs
    mainPanel(
      chartJSRadarOutput("radar", width = "450", height = "300"), width = 7
    )
  )
)

# Define server function required to create the scatterplot
server <- function(input, output) {
  
  # Create the scatterplot object the plotOutput function is expecting
  output$radar <- renderChartJSRadar({
    c <- grDevices::col2rgb(c("#790000","#B83200","#F96900","#F98632","#F9B17D","#FFD87A"))
    chartJSRadar(scores[, c("Label", input$selectedPeople)], 
                 maxScale = 3, scaleStepWidth = 1, addDots = F, 
                 lineAlpha = 0, colMatrix = c, 
                 labelSize = 15)
  })
}

# Create a Shiny app object
shinyApp(ui = ui, server = server)
