# Part I.
# 1
x <- 5 # create a variable named x and assign 5 to it
# compare x with 5
if (x > 5) {
    paste("x is larger than 5")
} else if (x < 5) {
    paste("x is smaller than 5")
} else {
    paste("x is equal to 5")
}

# 2
getwd()
#setwd(~/Desktop)
# import CSV:
Vector1 <- read.csv("Vector1.csv", header=TRUE)
#head(Vector1)
# 2a. checks each value in the imported data and replaces every negative value with NA
for (i in 1:length(Vector1$x)) {
    if (Vector1$x[i] < 0) {
        Vector1$x[i] <- NA
    }
}
# 2b. using vectorized code (no loop) that makes use of "logical" indexing, replace all those NA values with NaN
Vector1[is.na(Vector1)] <- NaN
# 2c. ssing a which() statement and integer indexing, change all those NaN values with a zero
Vector1$x[which(is.nan(Vector1$x))] <- 0

# 2d. determine how many of the values from the imported data fall in the range between 50 and 100 
FiftytoHundred_num <- 0
for (i in Vector1$x) {
    if (i >= 50 & i <= 100) {
        FiftytoHundred_num <- FiftytoHundred_num + 1
    }
}
# 2e. create a new vector named "FiftyToOneHundred" of data that has all the values from the imported data that fall in the range between 50 and 100
FiftyToOneHundred <- rep(0, FiftytoHundred_num)
FiftytoHundred_idx <- which(Vector1$x >= 50 & Vector1$x <= 100)
for (i in 1:FiftytoHundred_num) {
    FiftyToOneHundred[i] <- Vector1$x[FiftytoHundred_idx[i]]
}

#try the following, why it doesn't throw me an error?
#FiftyToOneHundred <- rep(0, FiftytoHundred_num)
#FiftytoHundred_idx <- Vector1$x[which(Vector1$x >= 50 & Vector1$x <= 100)]
#for (i in 1:FiftytoHundred_num) {
#    FiftyToOneHundred[i] <- Vector1$x[FiftytoHundred_idx[i]]
#}


# 2f. Use write.csv() to save vector to a file named "FiftyToOneHundred.csv". 
#write.csv(data,file="FiftyToOneHundred.csv",sep=",",row.names=FALSE)
write.csv(x = FiftyToOneHundred, file = "FiftyToOneHundred.csv")


# 3. CO2 emissions
CO2_data <- read.csv("CO2_data_cut_paste.csv", header=TRUE)
# 3a. first year for "Gas" emissions were non-zero
gas_idx <- which(CO2_data$Gas != 0)
first_year_gas <- CO2_data$Year[gas_idx[1]]
# 3b. years that "Total" emissions between 200 and 300 million metric tons of carbon
total_idx_200to300 <- which(CO2_data$Total >= 200 & CO2_data$Total <= 300)
total_years_200to300 <- CO2_data$Year[total_idx_200to300]
###

# Part II. 
# calculates abundances of predators and prey over time according to the "Lotka-Volterra" predator-prey model. 
totalGenerations <- 1000
initPrey <- 100 	# initial prey abundance at time t = 1
initPred <- 10		# initial predator abundance at time t = 1
a <- 0.01 		# attack rate
r <- 0.2 		# growth rate of prey
m <- 0.05 		# mortality rate of predators
k <- 0.1 		# conversion constant of prey into predators

time <- seq(1, totalGenerations)
n <- rep(0, totalGenerations)
p <- rep(0, totalGenerations)
n[1] <- initPrey
p[1] <- initPred

# calculations and check for negative numbers each generation
for (t in 2:totalGenerations) {
    n[t] <- n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1])
    if (n[t] < 0) {
        n[t] <- 0
    }
    p[t] <- p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1])
    if (p[t] < 0) {
        p[t] <- 0
    }
}


# make a plot of the abundances of prey and predators over time
plot(NA,NA, xlim=c(0,totalGenerations), ylim=c(0,1000), xlab="Time", ylab="Population")
#plot(time, n, col="green")
lines(time, n, col="green")
#plot(time, p, col="red")
lines(time, p, col="red")
legend("topright", c("Prey", "Predators"), pch = rep(16,2), col = c("green", "red"))

# create a matrix of your results named "myResults" and write it to a csv
# 
myResults <- cbind(time, n, p)
colnames(myResults) <- c("TimeStep", "PreyAbundance", "PredatorAbundance")
write.csv(x = myResults, file = "PredPreyResults.csv", row.names = F)
