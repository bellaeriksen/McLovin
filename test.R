##if (!require("dplyr")) {
  install.packages("dplyr")
##}
##if (!require("ggplot2")) {
  install.packages("ggplot2")
##}
##if (!require("httr")) {
  install.packages("httr")
##}
##if (!require("readxl")) {
  install.packages("readxl")
##}
library("dplyr")
library("ggplot2")
library("httr")
library("readxl")
  
GET("https://query.data.world/s/ymhlkbigf63uimejlhgmmwbnucwbly", write_disk(tf <- tempfile(fileext = ".xlsx")))
df <- read_excel(tf)

getLocation <- df %>% select("Location")
uniqueLocation <- unique(getLocation)
uniqueList <- uniqueLocation$Location
uniqueList[1]



  