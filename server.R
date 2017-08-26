
library(ggplot2)
library(plotly)

compare = function(n){
   LAG = c(0:20)
   acf.p = c(1, 2/3, 1/3, rep(0,18))
   ACF.df.p = data.frame(lag = LAG, acf = acf.p)

   w = rnorm((n+2),0,1)
   v = filter(w, sides=2, rep(1/3,3))[-c(1,(n+2))] # moving average
   
   ACF = acf(v, lag.max = 20, plot = FALSE)
   ACF.df = with(ACF, data.frame(lag, acf))
   
   dat = data.frame(rbind(ACF.df, ACF.df.p), N = c(rep(n, 21), rep("population", 21)))
   
   # comparsion
   p = ggplot(data = dat, mapping = aes(x = lag, y = acf)) +
      geom_hline(aes(yintercept = 0)) +
      facet_grid(N ~ . )+
      geom_segment(mapping = aes(xend = lag, yend = 0))
   ggplotly(p)
}



# Define a server for the Shiny app
function(input, output) {
   
   # Fill in the spot we created for a plot
   output$Plot <- renderPlotly({
      compare(input$n)
   })
}

