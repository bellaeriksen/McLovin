library("dplyr")
library("ggplot2")
library("shiny")
library("shinythemes")
library("httr")
library("readxl")

GET("https://query.data.world/s/ymhlkbigf63uimejlhgmmwbnucwbly", write_disk(tf <- tempfile(fileext = ".xlsx")))
df <- read_excel(tf)
       
## this will filter the count for the Locations this Obstacle/season appears in
server <- function(input, output) {
  output$intro <- renderText({
    "We worked with the American Ninja Warrior Obstacle History dataset, which we obtained
      through a GitHub repository called “Awesome Public Datasets”. This repository led us to the 
      dataset that we are currently working with--provided by data.world and assembled by a user. 
      The original information was credited to sasukepedia, where the information was last updated 
      in December of 2018. The data lists of all the obstacles from all 10 seasons of American Ninja 
      Warrior.  


      Primarily, our dataset would be of interest to people who are studying to be the next American 
      Ninja Warrior. Alternatively, it could also be used for avid fans, people who watch the show. For 
      the purpose of our project, we have decided to target this dataset to those who have an interest in 
      becoming the next American Ninja Warrior and would like to know about the obstacles they will have to 
      overcome.

      Three things our audience would want to learn from our data are: 

      What are the possible locations that they will have to compete at? This question would help them gain 
            insight on what weather they will be performing in and other factors that could become an obstacle 
            on their path to becoming the next American Ninja Warrior.
      What order will the obstacles be in during the competition, and in what round will they face which obstacles?
            Knowing this information allows for the audience to plan and organize themselves. 
      What type of obstacles will competitors face? By knowing more about this, the user is able to practice these 
            obstacles, and train themselves to overcome them for the real battle.
    
"
  })
  
  # creates the bar graph plot that allows user to select obstacle and the seasons,
  # returns a graph that shows the number of locations that occur given the location and seasons
  output$plot <- renderPlot({
    filtered <- df %>%
      rename(ObstacleName = "Obstacle Name") %>% 
      select(Location, ObstacleName, Season) %>% 
      rowwise() %>% 
      filter(ObstacleName == input$selectObstacle, Season >= input$slider[1], Season <= input$slider[2])
    plot <- ggplot(filtered, aes(x = Location, fill = Season)) +
      geom_bar() +
      scale_fill_continuous(low = "#132b43", high = "Red") +
      labs(
        title = "Locations per Season for Obstacle"
      )
    plot
  })
  # renders a text output that describes the bar graph
  output$text2 <- renderText({
    paste("This bar graph gives a visual representation of the number of localities 
           that appeared with each obstacle and range of season in the history of 
           American Ninja Warrior. The bar plot is scaled and is colored to reflect the seasons. 
           From this information, the user, and potential future ninja, is able to identify which Location,
           and Obstacle they should expect in their journey") 
  })
  
  # creates a table that produces a table which shows obstacles per specific round
  output$table <- renderTable({
    filtered <- df %>% filter(Location == input$location, Season == input$season, `Round/Stage` == input$round)
    out <- filtered %>% select(`Obstacle Name`, `Obstacle Order`)
    print(out)
  })
  
  # describes the table that was rendered
  output$text <- renderText({
    "Are you looking for specific information about how to train for American Ninja Warrior?
    You've come to the right place! Here is a detailed list about obstacles in the exact order 
    they come in for a specifc season,round, and location. This provides for excellent training
    opportunities to know exactly
    which obstacles come after one another so that you are able to train with perfect transitions
    after you have crushed the last obstacle."
  })
  
  # concludes the project 
  output$conclusionText <- renderText({
    paste("With the information we have have provided, you will become the next American Ninja Warrior! You are now well 
          aware of how to prepare and train, what obstacles you might expect to come across, and in what season it is most common.
          In the future will will provide you with more information that will help you proceed on your journey. Such as, finding new
          data sets that include severity of obstacles, to see how challenging each round is, and the average time needed to complete. 
          We will also expand our dataset to include latitude and longitude values that can prepare a map for a more interactive, 
          and easy to comprehend visual interface.")
  })
  
}