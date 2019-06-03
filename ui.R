library("dplyr")
library("ggplot2")
library("shiny")
library("shinythemes")
source("server.R")

getLocation <- df %>% select("Location")
uniqueLocation <- unique(getLocation)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      radioButtons("selectPlace", label = h3("Location"),
                   choices = (uniqueLocation), selected = 1)
    ),
    mainPanel(plotOutput("plot"))
  )
)

shinyApp(ui = ui, server = server)