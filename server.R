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
<<<<<<< HEAD

    # data_frame <- as.data.frame(input$selectPlace)
    # data <- data_frame %>% select("Obstacle Name")
    data <- df %>% filter(Location == input$selectPlace)
    ## x <- df[[data]]
    ## num <- add_count(data, "Obstacle Name")
    ## y <- num
    x <- unique(data$"Obstacle Name")
    y <- tally(as.data.table(data$"Obstacle Name"), wt = FALSE, sort = FALSE)

    
     #title <- paste0(
      # "American Ninja Warrior in", input$selectPlace, "."
     #)
     
   # plot <- ggplot(data, aes(x = x, y = num)) +
    #  geom_col(stat = "identity")
    # print(plot)
=======
    data <- df %>% select("Location", "Obstacle Name") %>% 
            filter("Location" == input$selectPlace)
    x <- unique(data$`Obstacle Name`)
    ##y <- tally(data, "Obstacle Name")
    y <- sum(data$`Obstacle Name` == "Obstacle Name")
  
     title <- paste0(
       "American Ninja Warrior in", input$selectPlace, "."
     )
     
    plot <- ggplot(data, aes(x = x, y = y)) +
      geom_col()
     print(plot)
>>>>>>> 773bc208bed92b4af2402ef9d827f51a0d43f32d
       
  })
}