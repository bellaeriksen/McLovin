library("dplyr")
library("ggplot2")
library("shiny")
library("shinythemes")

library("httr")
library("readxl")
GET("https://query.data.world/s/ymhlkbigf63uimejlhgmmwbnucwbly", write_disk(tf <- tempfile(fileext = ".xlsx")))
df <- read_excel(tf)

server <- function(input, output) {
  output$table <- renderTable({
    filtered <- df %>% filter(Location == input$location, Season == input$season, `Round/Stage` == input$round)
    out <- filtered %>% select(`Obstacle Name`, `Obstacle Order`)
    print(out)
  })
  
  output$text <- renderText({
    "Are you looking for specific information about how to train for American Ninja Warrior?
    You've come to the right place! Here is a detailed list about obstacles in the exact order 
    they come in for a specifc season,round, and location. This provides for excellent training
    opportunities to know exactly
    which obstacles come after one another so that you are able to train with perfect transitions
    after you have crushed the last obstacle."
  })
  
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
  
}