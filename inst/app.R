#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

devtools::load_all()
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Eat This"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            actionButton(inputId = "inp_eatthis", label = "Eat This")
        ),

        # Show a plot of the generated distribution
        mainPanel(
           textOutput(outputId = "out_eatthis")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    seed <- eventReactive(input$inp_eatthis, {
        sample(x = 1:10000, size = 1)
    })

    output$out_eatthis <- renderText({
        eatthis(dat = eatthis_data, seed = seed())
    })

}

# Run the application
shinyApp(ui = ui, server = server)
