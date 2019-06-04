library("dplyr")
library("ggplot2")
library("shiny")
library("shinythemes")
source("server.R")

getLocation <- df %>% select("Location")
uniqueLocation <- unique(getLocation)
uniqueList <- uniqueLocation$Location

ui <- navbarPage(
  titlePanel("American Ninja Warrior"),
  theme = shinytheme("darkly"),
  tabPanel("Obstacles in your Locality", fluidPage(
    sidebarLayout(
      sidebarPanel(
        selectInput("selectPlace", label = h3("Select Location"),
                   choices = c(uniqueList), selected = uniqueList[1])
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