library("dplyr")
library("ggplot2")
library("shiny")
library("shinythemes")
source("server.R")

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
   

ui <- navbarPage(
  "American Ninja Warrior",
  theme = shinytheme("darkly"),
  introduction,
  page_two
)

shinyApp(ui = ui, server = server)