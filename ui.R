#load libraries
library("dplyr")
library("ggplot2")
library("shiny")
library("shinythemes")
library("rsconnect")
source("server.R")
source("helper.R")
   
rsconnect::setAccountInfo(name='bellaeriksen',
                          token='40C645D5E3B1DE2789024044822AACC6',
                          secret='Nu9MZEJimk1hAM4d8JQfRhaLfVPSJtLfViOXOmF1')
#create shiny ui
ui <- navbarPage(
  "American Ninja Warrior",
  theme = shinytheme("darkly"),
  
  # create 'introduction' panel
  tabPanel(
    "Introduction", fluidPage(
      mainPanel(
        h5(textOutput("intro")))
    )    
  ),
  
  # create 'localities per obstacle' panel
  tabPanel("Localities per Obstacle", fluidPage(
    sidebarLayout(
      sidebarPanel(
        selectInput("selectObstacle", label = h3("Select Obstacle"),
                   choices = c(uniqueList), selected = uniqueList[1]),
        sliderInput("slider", label = h3("Select Season"), min = seasonMin,
                    max = seasonMax, value = c(4, 6))
      ),
      mainPanel(plotOutput("plot"), h5(textOutput("text2")))
    )
  )),
  
  # create 'obstacles per specific round' panel
  tabPanel("Obstacles per Specific Round", fluidPage(
      sidebarLayout(
        sidebarPanel(
          radioButtons("season", label = h3("Select Season"),
                       choices = c(uniqueListSeason), selected = uniqueListSeason[1]),
          selectInput("location", label = h3("Select Location"),
                      choices = c(uniqueListLocation), selected = uniqueListLocation[1]),
          selectInput("round", label = h3("Select Round"),
                      choices = c(uniqueListRound), selected = uniqueListRound[1])
        ),
        mainPanel(tableOutput("table"),h5(textOutput("text")))
    )
  )),
  
  #create 'conclusion' panel
  tabPanel("Conclusion", fluidPage(
    mainPanel(h5(textOutput("conclusionText")))
  ))
)

# publishes shiny online
shinyApp(ui = ui, server = server)
rsconnect::deployApp()