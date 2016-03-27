library(shiny)

shinyServer(function(input, output) {
  
# Creates Simulated TS Forecasting Data
  
  #Function to create dataset
  
  create_dataset <- function(x){
    
    numset <- 1:x
    time <- 1:x
    speed <- 1:x
    
    time_temp = 1
    speed_temp = 50
    
    
    for (i in numset) {
      time[i] = runif(1)*2 + time_temp
      time_temp = time[i]
      
      speed[i] = speed_temp - 10 + 10 *rnorm(1, mean = 1, sd = 1)
      speed_temp = speed[i]
    }
    
    final <- cbind(time,speed)
    return(final)
    
  }
  
  output$forecastplot <- renderPlot({
    
    library(forecast)
    
    set.seed(input$seed_in)
    timeseries <- create_dataset(input$points)
    ts_object = ts(timeseries[,2], start = c(2016-round(input$points/12),6), frequency=12)
    
    fit <- auto.arima(ts_object)
    
    #plot(timeseries[,1],timeseries[,2])
    plot(ts_object)
    plot(forecast(fit,input$fc_period))
        title(main = '',
        xlab = 'Date',
        ylab = 'Value')
    
  })
  
})
