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
    x <- df[[df$ObstacleName]]
    y <- df[[nrow(df$input)]]
    
    title <- paste0(
      "American Ninja Warrior in", input
    )
    
    ggplot(data = df) +
      geom_bar(mapping = aes( x = x, y = y)) +
      
  })
}