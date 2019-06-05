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
    data <- df %>% select("Location", "Obstacle Name") %>% 
            filter(`Obstacle Name` == input$selectObstacle)
    
    x <- unique(data$`Location`)

    # How to count for the number of Locations this Obstacle appears in!?
    # y <- count(data, data$`Obstacle Name` == "Obstacle Name", data$Location ==  'Location')
    y <- data %>% () 
        
    title <- paste0(
      "American Ninja Warrior in", input$selectPlace, "."
    )
         
    plot <- ggplot(data, aes(x = x, y = y)) +
      geom_col()
    print(plot)
       
    #hist(x, breaks = y, col = 'darkgray', border = 'white')
  })
}