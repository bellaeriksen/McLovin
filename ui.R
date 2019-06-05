library("dplyr")
library("ggplot2")
library("shiny")
library("shinythemes")
source("server.R")

getObstacle <- df %>% select("Obstacle Name")
uniqueObstacle <- unique(getObstacle)
uniqueList <- uniqueObstacle$`Obstacle Name`

getCompetition <- df %>% select("Round/Stage")
theRound <- unique(getCompetition)
uniqueRounds <- theRound$`Round/Stage`

ui <- navbarPage(
  "American Ninja Warrior",
  theme = shinytheme("darkly"),
  tabPanel("Obstacles in Your Locality", fluidPage(
    sidebarLayout(
      sidebarPanel(
        selectInput("selectObstacle", label = h3("Select Obstacle"),
                   choices = c(uniqueList), selected = uniqueList[1])
        #selectInput("selectRound", label = h3("Select Round"),
                    #choices = c(uniqueRounds), selected = uniqueRounds[1])
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