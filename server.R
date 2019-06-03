library("dplyr")
library("ggplot2")
library("shiny")
library("shinythemes")

library("httr")
library("readxl")
GET("https://query.data.world/s/ymhlkbigf63uimejlhgmmwbnucwbly", write_disk(tf <- tempfile(fileext = ".xlsx")))
df <- read_excel(tf)
 #View(df)

server <- function(input, output) {
  output$plot <- renderPlot({
    #place <- input$selectPlace
    data <- input$selectPlace %>% select("Obstacle Name")
    x <- unique(data)
    y <- add_count(data, "Obstacle Name")
    
     title <- paste0(
       "American Ninja Warrior in", input$selectPlace, "."
     )
     
     ggplot() +
      geom_col(mapping = aes(x = x, y = num))
       
  })
}