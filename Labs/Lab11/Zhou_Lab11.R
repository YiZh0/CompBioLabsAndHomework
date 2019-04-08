# Script for Lab #11 (= Assignment #?) 
# Yin Zhou
# April 05, 2019


#########

library("dplyr")
library("ggplot2")

getwd()
#set working directory
# setwd("")

#import the data into RStudio
GlobalWoodDensityDatabase <- read.csv("GlobalWoodDensityDatabase.csv", stringsAsFactors = F)

naRow <- which(is.na(GlobalWoodDensityDatabase$Wood.density..g.cm.3...oven.dry.mass.fresh.volume))

GlobalWoodDensityDatabase <- GlobalWoodDensityDatabase[-naRow, ]

#base R
species <- unique(GlobalWoodDensityDatabase$Binomial)
species_num <- length(species)
family <- rep(NA, species_num)
density_l <- list()
GlobalWoodDensityDatabase_Row <- nrow(GlobalWoodDensityDatabase)

for (i in 1:GlobalWoodDensityDatabase_Row) {
    j <- match(GlobalWoodDensityDatabase$Binomial[i], species)
    if (is.na(family[j])) {
        family[j] <- GlobalWoodDensityDatabase$Family[i]
        density_l[[j]] <- GlobalWoodDensityDatabase$Wood.density..g.cm.3...oven.dry.mass.fresh.volume[i]
    } else {
        density_l[[j]] <- c(density_l[[j]], GlobalWoodDensityDatabase$Wood.density..g.cm.3...oven.dry.mass.fresh.volume[i])
    }
    
}

MeanDensity <- mean(density_l[[1]])
for (i in 2:length(density_l)) {
    MeanDensity <- c(MeanDensity, mean(density_l[[i]]))
}

newdf1 <- data.frame(family, species, MeanDensity)
f1 <- newdf1
f1 <- f1[order(f1$family),]
colnames(f1)[1] <- "Family"
colnames(f1)[2] <- "Binomial"

#the package dplyr
newdf2 <- summarise(group_by(GlobalWoodDensityDatabase, Family, Binomial), MeanDensity = mean(Wood.density..g.cm.3...oven.dry.mass.fresh.volume))

families_dense <- summarise(group_by(f1, Family), MeanDensity = mean(MeanDensity))
families_dense_sorted <- arrange(families_dense, desc(MeanDensity))

#6b
family_s <- as.data.frame(families_dense_sorted[,1])
h8 <- as.vector(t(head(family_s, 8)))
t8 <- as.vector(t(tail(family_s, 8)))

keepRows_h <- (newdf2$Family %in% h8)
keepRows_t <- (newdf2$Family %in% t8)
keep_head_family <- newdf2[keepRows_h,]
keep_tail_family <- newdf2[keepRows_t,]

b1 <- ggplot(keep_head_family) + geom_boxplot(aes(x = Family, y = MeanDensity))
b2 <- ggplot(keep_tail_family) + geom_boxplot(aes(x = Family, y = MeanDensity))

as.data.frame( df[,1], drop=false)



