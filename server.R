library("dplyr")
library("ggplot2")
library("shiny")
library("shinythemes")

library("httr")
library("readxl")
GET("https://query.data.world/s/ymhlkbigf63uimejlhgmmwbnucwbly", write_disk(tf <- tempfile(fileext = ".xlsx")))
df <- read_excel(tf)
 View(df)

server <- function(input, output) {
  output$plot <- renderPlot({
    data <- df %>% filter("Location" == input$selectPlace)
    ##x <- unique(data)
    ##y <- tally(data, "Obstacle Name")

    
     ##title <- paste0(
       ##"American Ninja Warrior in", input$selectPlace, "."
     ##)
     
    ##plot <- ggplot(data, aes(x = x, y = num)) +
      ##geom_col(stat = "identity")
     ##print(plot)
       
     #hist(x, breaks = y, col = 'darkgray', border = 'white')
  })
}