library("dplyr")
library("ggplot2")
library("shiny")
library("shinythemes")
source("server.R")

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      radioButtons("selectPlace", label = h3("Location"),
                   choices = list(), selected = 1)
    ),
    mainPanel(plotOutput("plot"))
  )
)

shinyApp(ui = ui, server = server)