library("tidyverse")
library("dplyr")
library("ggplot2")
library("httr")
library("readxl")
  
GET("https://query.data.world/s/ymhlkbigf63uimejlhgmmwbnucwbly", write_disk(tf <- tempfile(fileext = ".xlsx")))
df <- read_excel(tf)

# filters so that it gives a data frame that displays all the unique occurences of each Obstacle
getObstacle <- df %>% select("Obstacle Name")
uniqueObstacle <- unique(getObstacle)
uniqueList <- uniqueObstacle$`Obstacle Name`

# Calculates the minimum season and the maximum season in the dataframe 
seasonMin <- min(df$Season)
seasonMax <- max(df$Season)

# filters and gets unique locations
getLocation <- df %>% select("Location")
uniqueLocation <- unique(getLocation)
uniqueListLocation <- uniqueLocation$Location

# filters and gets unique round/stage
getRound <- df %>% select("Round/Stage")
uniqueRound <- unique(getRound)
uniqueListRound <- uniqueRound$'Round/Stage'

# filters and gets unique season
getSeason <- df %>% select("Season")
uniqueSeason <- unique(getSeason)
uniqueListSeason <- uniqueSeason$Season




  