# Script for Final_Project
# Yin Zhou
# April 20, 2019


#########
#install.packages("zoo")
#install.packages('ggmap')

library("dplyr")
library("ggplot2")
library(lubridate)
#library(ggmap)
#library(zoo)

getwd()

#set working directory
#setwd("./Final_Project/Assignment09/")

#function for calculate growth rate
growthRate <- function(individualData) {
    #index for max and min
    max_idx <- which.max(individualData[ ,2])
    min_idx <- which.min(individualData[ ,2])
    #make sure it is not integer(0)
    if (length(max_idx) == 0 | length(min_idx) == 0) {
        return(0)
    }
    #if max_idx = min_idx, then there is no difference, return 0 which is not used to calculate our growth rate; else, calculate the growth rate
    if (max_idx == min_idx) {
        return(0)
    } else {
        #amount of growth
        difference_n <- (individualData[max_idx,2]-individualData[min_idx,2])
        #duration of time
        days_num <- as.integer(difftime(individualData[max_idx,1], individualData[min_idx,1], units=c("days") ) )
        
        growth_rate <- (difference_n/days_num)
        
        # give back the growth rate as result
        return(growth_rate)
    }
    
}

#import data
hawksbillData <- read.csv("AnegadaGrowth_toDryad.csv", stringsAsFactors = F)

#
#Anegada
#require(maps)
#d = data.frame(map(database="italy", plot=F)[c("x", "y")])
#map <- get_map(location = 'Anegada', zoom = 7)



#rows with CCLnt, SCL and Weight is NA
naRows_3 <- which(is.na(hawksbillData$CCLnt) & is.na(hawksbillData$SCL) & is.na(hawksbillData$Weight))

#data without CCLnt, SCL and Weight is NA
hawksbillnewData <- hawksbillData[-naRows_3, ]

#count the times individual hawksbill sea turtle been recorded
hawksbillCount <- hawksbillnewData %>% count(ID)
#hawksbill sea turtle ID appear more than once
hawksbillID <- hawksbillCount[which(hawksbillCount$n > 1), ]
#hawksbill sea turtle who appear more than once data 
hawksbillData1 <- hawksbillnewData[which(hawksbillnewData$ID %in% hawksbillID$ID), ]

#convert date from character to "POSIXct" "POSIXt" 
hawksbillData_withDate <- hawksbillData1
hawksbillData_withDate$Date <- parse_date_time(hawksbillData1$Date, order = "dby")

#Pre-allocation
hawksbillID$CCLnt_GR <- 0
hawksbillID$SCL_GR <- 0
hawksbillID$Weight_GR <- 0

rownum <- nrow(hawksbillID)

#loop and calculate growth rate(/day)
for (i in 1:rownum) {
    #extract rows for certain ID
    selectpart <- hawksbillData_withDate[which(hawksbillData_withDate$ID == hawksbillID$ID[i]),]
    #calculate
    hawksbillID$CCLnt_GR[i] <- growthRate(selectpart[ , c(1,3)])
    hawksbillID$SCL_GR[i] <- growthRate(selectpart[ , c(1,4)])
    hawksbillID$Weight_GR[i] <- growthRate(selectpart[ , c(1,5)])
}

#growth rate (/year)
hawksbillID$CCLnt_GR <- (hawksbillID$CCLnt_GR * 365)
hawksbillID$SCL_GR <- (hawksbillID$SCL_GR * 365)
hawksbillID$Weight_GR <- (hawksbillID$Weight_GR * 365)

#boxplot for growth rates
b1 <- boxplot(hawksbillID$CCLnt_GR, ylab="CCL (n-t, cm)")

b2 <- boxplot(hawksbillID$SCL_GR, ylab="Growth Rate (SCL) (cm/yr)")
abline(h = 4.9, col="green", lwd=3, lty=2)
legend(1.2, 16, legend="Green Sea Turtles", lty=2, col="green",box.lty=0, cex=0.7)

b3 <- boxplot(hawksbillID$Weight_GR, ylab="Mass gain (kg/yr)")


#plot mass against carapace length(CCL)
Scatter1 <- ggplot(hawksbillData, aes(x=CCLnt, y=Weight)) + geom_point() + geom_smooth(lty="dotted", col="black") + xlab("CCL (n-t, cm)") + ylab("Mass (kg)")

#Mean CCL for each turtle
CCLmean <- summarise(group_by(hawksbillData, ID), MeanCCL = mean(CCLnt, na.rm=T))
#histogram
H1 <- ggplot(data=CCLmean, aes(MeanCCL)) + geom_histogram(bins = 20) + xlab("CCL (n-t, cm)") + ylab("frequency")
