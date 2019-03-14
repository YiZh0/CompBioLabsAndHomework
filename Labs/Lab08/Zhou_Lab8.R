# Script for Lab #8 (= Assignment #7) 
# Yin Zhou
# May 08, 2019


#########

# logistic growth model 
# using for loop to predicts the abundance of the population at time t and store the abundance of the population each time step.

# Function definition:
# r(the intrinsic growth rate), K(the carrying capacity), t(the total number of generations) and p(the initial population size) must be given
logisticGrowth <- function(r, K, t, p) {
    n <- rep(-1, t) # Pre-allocation
    n[1] <- p # initial population
    for (i in 2:t) {
        n[i] <- n[i-1] + ( r * n[i-1] * (K - n[i-1])/K ) # calculate predicted population
        #print(n[i])
    }
    time <- seq(1, t)
    abundance <- n
    plot(time, abundance)
    
    # make a matrix of results:
    result_matrix <- cbind(time, abundance)
    return(result_matrix)
}

# Demonstration of usage:
#call function and get plot made AND results returned
result <- logisticGrowth(0.8, 10000, 12, 1500)
colnames(result) <- c("generations", "abundance")

getwd()
#set working directory
# setwd("")
write.csv(x = result, file = "myfile.csv", row.names = FALSE)
