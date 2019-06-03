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
  data <- input$selectPlace
  output$plot <- renderPlot({
    plot(data$)
    
    title <- paste0(
      "American Ninja Warrior in", input$selectPlace, "."
    )
    
    ggplot(data = df) +
      geom_bar(mapping = aes(x = , y = )) +
      
  })
}