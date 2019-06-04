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
<<<<<<< HEAD
    data_frame <- as.data.frame(input$selectPlace)
    data <- data_frame %>% df %>% select("Obstacle Name")
    ##x <- df[[data]]
    ##num <- add_count(data, "Obstacle Name")
    ## y <- num
    x <- unique(data)
    y <- count(data, "Obstacle Name")
    title <- paste0(
      "American Ninja Warrior in", input$selectPlace, "."
    )
    ggplot(mapping = aes(x = x, y = num)) +
    geom_col()
=======

    # data_frame <- as.data.frame(input$selectPlace)
    # data <- data_frame %>% select("Obstacle Name")
    data <- df %>% filter(Location == input$selectPlace)
    ## x <- df[[data]]
    ## num <- add_count(data, "Obstacle Name")
    ## y <- num
    x <- unique(data)
    y <- tally(data, "Obstacle Name", sort = FALSE)

    
     title <- paste0(
       "American Ninja Warrior in", input$selectPlace, "."
     )
     
    plot <- ggplot(data, aes(x = x, y = num)) +
      geom_col(stat = "identity")
     print(plot)
       
     #hist(x, breaks = y, col = 'darkgray', border = 'white')
>>>>>>> aacedcda3decfde7152a3ae202c8fb900c09f87a
  })
}