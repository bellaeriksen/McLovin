library("dplyr")
library("ggplot2")
library("shiny")
library("shinythemes")
source("server.R")

getLocation <- df %>% select("Location")
uniqueLocation <- unique(getLocation)
uniqueList <- uniqueLocation$Location

getCompetition <- df %>% select("Round/Stage")
theRound <- unique(getCompetition)
uniqueRounds <- theRound$`Round/Stage`

ui <- navbarPage(
  "American Ninja Warrior",
  theme = shinytheme("darkly"),
  tabPanel("Obstacles in Your Locality", fluidPage(
    sidebarLayout(
      sidebarPanel(
        selectInput("selectPlace", label = h3("Select Location"),
                   choices = c(uniqueList), selected = uniqueList[1]),
        selectInput("selectRound", label = h3("Select Round"),
                    choices = c(uniqueRounds), selected = uniqueRounds[1])
      ),
    mainPanel(plotOutput("plot"))
    )
  ))
  # tabPanel("Add title lols", fluidPage(
    # sidebarLayout(
      # sidebarPanel(
        # selectInput()
      # )
    # ) 
  # ))
)

shinyApp(ui = ui, server = server)