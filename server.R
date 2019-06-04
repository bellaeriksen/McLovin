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
    data_frame <- as.data.frame(input$selectPlace)
    data <- df %>% data_frame %>% select("Obstacle Name")
    x <- df[[data]]
    num <- add_count(data, "Obstacle Name")
    y <- num
    
     title <- paste0(
       "American Ninja Warrior in", input$selectPlace, "."
     )
     
     ggplot(data = df) +
      geom_col(mapping = aes(x = x, y = num))
       
  })
}