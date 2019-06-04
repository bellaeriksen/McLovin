library("dplyr")
library("ggplot2")
library("shiny")
library("shinythemes")

library("httr")
library("readxl")
GET("https://query.data.world/s/ymhlkbigf63uimejlhgmmwbnucwbly", write_disk(tf <- tempfile(fileext = ".xlsx")))
df <- read_excel(tf)
 View(df)
 
 #data <- df %>% select("Location", "Obstacle Name") %>% 
   #filter("Venice" == Location)
       
server <- function(input, output) {
  output$plot <- renderPlot({
    data <- df %>% select("Location", "Obstacle Name") %>% 
            filter(Location == input$selectPlace)
    x <- unique(data$`Obstacle Name`)
    y <- sum(data$`Obstacle Name` == "Obstacle Name")
        
    title <- paste0(
      "American Ninja Warrior in", input$selectPlace, "."
    )
         
    plot <- ggplot(data, aes(x = x, y = y)) +
      geom_col()
    print(plot)
       
     #hist(x, breaks = y, col = 'darkgray', border = 'white')
  })
}