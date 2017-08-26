library(ggplot2)
library(plotly)
fluidPage(    
   
   # Give the page a title
   titlePanel("ACF comparison (finite sample vs population)"),
   
   # Generate a row with a sidebar
   sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
         numericInput('n', 'Sample size', 100),
         hr(),
         helpText("ACF comparison of finite sample and the population ACF for example 1.9 from the book"),
         submitButton("Update View")
      ),
      
      # Create a spot for the barplot
      mainPanel(
         plotlyOutput("Plot")  
      )
      
   )
)