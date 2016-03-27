library(shiny)

# Define UI for application that simulates time series ARIMA forecasting
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Forecast Simulation on Randomly Generate Dataset"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("points",
                  "Number of Points:",
                  min = 1,
                  max = 100,
                  value = 50),
      
      sliderInput("seed_in",
                   "Set Seed:",
                   min = 1000,
                   max = 2000,
                   value = 1337),
      
      sliderInput("fc_period",
                  "Forecast Length (Months):",
                  min = 1,
                  max = 72,
                  value = 12),
      
      "Instructions:",
      " ",
      "This application simulates the ARIMA forecasting model for time series data and allows a user to change a few parameters.",
      "You can adjust the number of points in the dataset, the seed used to randomly generate the data,
      as well as the number of months to forecast forward using the three sliders. The plot will automatically
      update after adjusting one of the three inputs."
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("forecastplot")
    )
  )
))
