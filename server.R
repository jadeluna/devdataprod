library(shiny)

data <- read.csv("consumption.csv", sep=",", header=T)
colnames(data)[4] <-"Gas"
colnames(data)[7] <-"Electricity"
colnames(data)[10] <-"Water"


## Define the server for the Shiny app
shinyServer(function(input, output) {
    
    dataInput <-reactive({
        #subset(data, subset=(substring(data$Date,1,4) == input$year))
        subset(data, grepl(input$year, data$Date))
    })
    
    ## Fill in the spot we created for a plot
    output$plot1 <-renderPlot({
        
        ## Render a barplot
        barplot(dataInput()[,input$energy],
                main=paste(input$energy, "in", input$year),
                ylab="Consumption (in kW)", ylim=c(0,80),
                xlab="Weeks (Jan to Dec)")
    })
})