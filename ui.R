library(shiny)

## Define the overall UI (use a fluid Bootstrap layout)
shinyUI(fluidPage(
    
    ## Give the page a title
    titlePanel("Price of Gas / Electricity / Water over One Year"),
    
    ## Generate a row with a sidebar
    sidebarLayout(
        
        ## Define the sidebar with one input
        sidebarPanel(
            selectInput("energy", "Type of Energy:",
                        choices=c("Gas", "Electricity", "Water")),
            selectInput("year", "Year:",
                        choices=c("2012", "2013", "2014")),
            hr(),
            helpText("Data from our House Renovation (since 2012).", br(), br(),
                     "Select a Type of Energy and the Year to get the appropriate bar plot.")),
        
        ## Create a spot for the barplot
        mainPanel(
            plotOutput("plot1")))))