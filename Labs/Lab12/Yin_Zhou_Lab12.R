# Script for Lab #12 
# Yin Zhou
# April 12, 2019

library("dplyr")
library("ggplot2")

getwd()

#setwd("./Cusack_et_al/")
camData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = F)


speciesCount <- camData %>% count(Species)
colnames(speciesCount)[2] <- "count"
SCbarplot <- ggplot(data=speciesCount, aes(x=Species, y=count)) +
    geom_bar(stat="identity")
SCbarplot <- SCbarplot + theme(axis.text.x = element_text(angle = 90, hjust = 1))

countLog <- log(speciesCount$count)

SCbarplot_flip <- ggplot(data=speciesCount, aes(x=reorder(Species, -countLog), y=countLog)) + geom_bar(stat="identity") + coord_flip() + xlab("Species") + ylab("count")

#+ coord_flip()                  