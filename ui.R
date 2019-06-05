library("dplyr")
library("ggplot2")
library("shiny")
library("shinythemes")
source("server.R")
source("helper.R")

<<<<<<< HEAD
getLocation <- df %>% select("Location")
uniqueLocation <- unique(getLocation)
uniqueListLocation <- uniqueLocation$Location

getRound <- df %>% select("Round/Stage")
uniqueRound <- unique(getRound)
uniqueListRound <- uniqueRound$'Round/Stage'

getSeason <- df %>% select("Season")
uniqueSeason <- unique(getSeason)
uniqueListSeason <- uniqueSeason$Season
  
introduction <- tabPanel(
  "Introduction", fluidPage(
    mainPanel(
      h5(textOutput("intro"))
    )
  )    
)
   page_two <- tabPanel(
     "Obstacles per Specific Round", fluidPage(
     sidebarLayout(
       sidebarPanel(
         radioButtons("season", label = h3("Select Season"),
                      choices = c(uniqueListSeason), selected = uniqueListSeason[1]),
         selectInput("location", label = h3("Select Location"),
                     choices = c(uniqueListLocation), selected = uniqueListLocation[1]),
         selectInput("round", label = h3("Select Round"),
                       choices = c(uniqueListRound), selected = uniqueListRound[1])
         ),
       mainPanel(
         tableOutput("table"),
         h5(textOutput("text"))
       )
     )
   ) 
)
   
=======
rsconnect::setAccountInfo(name='roshani-shiwa', token='4A880C6FE1D688961A003EC789AD2CF2', 
                         secret='QAZnTdSISlUkqFMyQMTX+NCQHFg7gz/c5YETedU4')
>>>>>>> 595c7a7f882d9d7df33da115695410d09b089f97

ui <- navbarPage(
  "American Ninja Warrior",
  theme = shinytheme("darkly"),
<<<<<<< HEAD
  introduction,
  page_two
=======
  introduction <- tabPanel(
    "Introduction", fluidPage(
      mainPanel(
        h5(textOutput("intro")))
    )    
  ),
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
  tabPanel("Conclusion", fluidPage(
    mainPanel(h5(textOutput("conclusionText")))
  ))
>>>>>>> 595c7a7f882d9d7df33da115695410d09b089f97
)

shinyApp(ui = ui, server = server)
rsconnect::deployApp()