library("dplyr")
library("ggplot2")
library("shiny")
library("shinythemes")
source("server.R")

getLocation <- df %>% select("Location")
uniqueLocation <- unique(getLocation)
uniqueList <- uniqueLocation$Location

ui <- fluidPage(
  theme = shinytheme("darkly"),
  sidebarLayout(
    sidebarPanel(
      selectInput("selectPlace", label = h3("Select Location"),
                   choices = c(uniqueList), selected = uniqueList[1])
    ),
    mainPanel(plotOutput("plot"))
  )
)

shinyApp(ui = ui, server = server)