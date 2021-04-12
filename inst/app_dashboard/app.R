## app.R ##
devtools::load_all()
library(shiny)
library(shinydashboard)

ui <- shinydashboard::dashboardPage(

    shinydashboard::dashboardHeader(

        title = "eatthis",

        # Dropdown menu for messages
        shinydashboard::dropdownMenu(

            type        = "messages",
            badgeStatus = "success",

            shinydashboard::messageItem(
                from    = "Support Team",
                message = "This is the content of a message.",
                time    = "5 mins"
            ),

            shinydashboard::messageItem(
                from    = "Support Team",
                message = "This is the content of another message.",
                time    = "2 hours"
            ),

            shinydashboard::messageItem(
                from    = "New User",
                message = "Can I get some help?",
                time    = "Today"
            )

        ),

        # Dropdown menu for notifications
        shinydashboard::dropdownMenu(

            type        = "notifications",
            badgeStatus = "warning",

            shinydashboard::notificationItem(
                icon    = shiny::icon("users"),
                status  = "info",
                text    = "5 new members joined today"
            ),

            shinydashboard::notificationItem(
                icon    = shiny::icon("warning"),
                status  = "danger",
                text    = "Resource usage near limit."
            ),

            shinydashboard::notificationItem(
                icon    = shiny::icon("shopping-cart", lib = "glyphicon"),
                status  = "success",
                text    = "25 sales made"
            ),

            shinydashboard::notificationItem(
                icon    = shiny::icon("user", lib = "glyphicon"),
                status  = "danger",
                text    = "You changed your username"
            )

        ),

        # Dropdown menu for tasks, with progress bar
        shinydashboard::dropdownMenu(

            type        = "tasks",
            badgeStatus = "danger",

            shinydashboard::taskItem(
                value   = 20,
                color   = "aqua",
                text    = "Refactor code"
            ),

            shinydashboard::taskItem(
                value   = 40,
                color   = "green",
                text    = "Design new layout"
            ),

            shinydashboard::taskItem(
                value   = 60,
                color   = "yellow",
                text    = "Another task"
            ),

            shinydashboard::taskItem(
                value   = 80,
                color   = "red",
                text    = "Write documentation"
            )

        )

    ),

    shinydashboard::dashboardSidebar(
        shinydashboard::sidebarMenu(

            shinydashboard::menuItem(
                text    = "Breakfast",
                tabName = "breakfast",
                icon    = shiny::icon("seedling")
            ),

            shinydashboard::menuItem(
                text    = "Lunch & Dinner",
                tabName = "lunchdinner",
                icon    = shiny::icon("seedling")
            ),

            shinydashboard::menuItem(
                text    = "Sides and Veggies",
                tabName = "sidesveggies",
                icon    = shiny::icon("seedling")
            ),

            shinydashboard::menuItem(
                text    = "Source code",
                icon    = icon("file-code-o"),
                href    = "https://github.com/abons8/eatthis/")


        )
    ),

    shinydashboard::dashboardBody(

        shinydashboard::tabItems(

            shinydashboard::tabItem(

                tabName = "breakfast",

                shiny::fluidRow(

                    shinydashboard::box(
                        shiny::actionButton(inputId = "inp_eatthis0", label = "Eat This"),
                        width = 1
                    ),

                    shinydashboard::box(
                        shinydashboard::valueBoxOutput(outputId = "out_eatthis0", width = 12),
                        width = 5
                    )

                )

            ),

            shinydashboard::tabItem(

                tabName = "lunchdinner",

                shiny::fluidRow(

                    shinydashboard::box(
                        shiny::actionButton(inputId = "inp_eatthis1", label = "Eat This"),
                        width = 1
                    ),

                    shinydashboard::box(
                        shinydashboard::valueBoxOutput(outputId = "out_eatthis1", width = 12),
                        width = 5
                    )

                ),

                shiny::fluidRow(

                    shinydashboard::box(
                        shiny::actionButton(inputId = "inp_eatthis2", label = "Eat This"),
                        width = 1
                    ),

                    shinydashboard::box(
                        shinydashboard::valueBoxOutput(outputId = "out_eatthis2", width = 12),
                        width = 5
                    )

                ),

                shiny::fluidRow(

                    shinydashboard::box(
                        shiny::actionButton(inputId = "inp_eatthis3", label = "Eat This"),
                        width = 1
                    ),

                    shinydashboard::box(
                        shinydashboard::valueBoxOutput(outputId = "out_eatthis3", width = 12),
                        width = 5
                    )

                ),

                shiny::fluidRow(

                    shinydashboard::box(
                        shiny::actionButton(inputId = "inp_eatthis4", label = "Eat This"),
                        width = 1
                    ),

                    shinydashboard::box(
                        shinydashboard::valueBoxOutput(outputId = "out_eatthis4", width = 12),
                        width = 5
                    )

                )

            ),

            shinydashboard::tabItem(

                tabName = "sidesveggies",

                shiny::fluidRow(

                    shinydashboard::box(
                        shiny::actionButton(inputId = "inp_eatthis5", label = "Eat This Side"),
                        width = 2
                    ),

                    shinydashboard::box(
                        shinydashboard::valueBoxOutput(outputId = "out_eatthis5", width = 12),
                        width = 5
                    )

                ),

                shiny::fluidRow(

                    shinydashboard::box(
                        shiny::actionButton(inputId = "inp_eatthis6", label = "Eat This Veggie"),
                        width = 2
                    ),

                    shinydashboard::box(
                        shinydashboard::valueBoxOutput(outputId = "out_eatthis6", width = 12),
                        width = 5
                    )

                )

            )


        )
    )

)

server <- function(input, output) {

    seed0 <- shiny::eventReactive(input$inp_eatthis0, {
        sample(x = 1:10000, size = 1)
    })

    output$out_eatthis0 <- shinydashboard::renderValueBox({
        tmpout <- eatthis(dat = eatthis_data, cat = "Breakfast", seed = seed0())
        shinydashboard::valueBox(
            value    = paste0(tmpout),
            subtitle = "testing",
            color    = "light-blue",
            icon     = shiny::icon("bread-slice")
        )
    })

    seed1 <- shiny::eventReactive(input$inp_eatthis1, {
        sample(x = 1:10000, size = 1)
    })

    output$out_eatthis1 <- shinydashboard::renderValueBox({
        tmpout <- eatthis(dat = eatthis_data, cat = "Lunch or Dinner", seed = seed1())
        shinydashboard::valueBox(
            value    = paste0(tmpout),
            subtitle = "testing",
            color    = "blue",
            icon     = shiny::icon("drumstick-bite")
        )
    })

    seed2 <- shiny::eventReactive(input$inp_eatthis2, {
        sample(x = 1:10000, size = 1)
    })

    output$out_eatthis2 <- shinydashboard::renderValueBox({
        tmpout <- eatthis(dat = eatthis_data, cat = "Lunch or Dinner", seed = seed2())
        shinydashboard::valueBox(
            value    = paste0(tmpout),
            subtitle = "testing",
            color    = "green",
            icon     = shiny::icon("drumstick-bite"),
            width    = 6
        )
    })

    seed3 <- shiny::eventReactive(input$inp_eatthis3, {
        sample(x = 1:10000, size = 1)
    })

    output$out_eatthis3 <- shinydashboard::renderValueBox({
        tmpout <- eatthis(dat = eatthis_data, cat = "Lunch or Dinner", seed = seed3())
        shinydashboard::valueBox(
            value    = paste0(tmpout),
            subtitle = "testing",
            color    = "yellow",
            icon     = shiny::icon("drumstick-bite")
        )
    })

    seed4 <- shiny::eventReactive(input$inp_eatthis4, {
        sample(x = 1:10000, size = 1)
    })

    output$out_eatthis4 <- shinydashboard::renderValueBox({
        tmpout <- eatthis(dat = eatthis_data, cat = "Lunch or Dinner", seed = seed4())
        shinydashboard::valueBox(
            value    = paste0(tmpout),
            subtitle = "testing",
            color    = "red",
            icon     = shiny::icon("drumstick-bite")
        )
    })

    seed5 <- shiny::eventReactive(input$inp_eatthis5, {
        sample(x = 1:10000, size = 1)
    })

    output$out_eatthis5 <- shinydashboard::renderValueBox({
        tmpout <- eatthis(dat = eatthis_data, cat = "Sides", seed = seed5())
        shinydashboard::valueBox(
            value    = paste0(tmpout),
            subtitle = "testing",
            color    = "purple",
            icon     = shiny::icon("lemon")
        )
    })

    seed6 <- shiny::eventReactive(input$inp_eatthis6, {
        sample(x = 1:10000, size = 1)
    })

    output$out_eatthis6 <- shinydashboard::renderValueBox({
        tmpout <- eatthis(dat = eatthis_data, cat = "Vegetables", seed = seed6())
        shinydashboard::valueBox(
            value    = paste0(tmpout),
            subtitle = "testing",
            color    = "olive",
            icon     = shiny::icon("seedling")
        )
    })

}

shinyApp(ui, server)
