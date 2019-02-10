# 1. a “for loop” that prints the word “hi” to the console 10 times
for ( i in seq(1, 10) ) {
    print("hi")
}

# 2. a for loop that prints (to the console) Tim total amount of money each week for the next 8 weeks.
week <- 8
amount <- 10 # initial amount in piggy bank
allowance <- 5 # allowance per week
gum_cost <- 1.34 # the packs of gum cost $1.34 each
gum_num <- 2 # the number of packs of gum Tim buy per week
for (i in 1:week) {
    amount <- amount + allowance - (gum_cost * gum_num) # calculate amount every week
    print(amount) # print amount
}

# 3. a for loop that calculates expected population and prints each year’s size to the console.
population <- 2000 # current population size
rate <- (-0.05) # rate of the population change
year <- 7
for (i in 1:7) {
    population <- population * (1 + rate) # calculate expected population
    print(population)
}

# 4. a for loop that predicts the abundance of the population at time t and that also prints out the abundance of the population each time step.
t <- 12
n <- rep(-1, t) # Pre-allocation
n[1] <- 2500 # initial population
K <- 10000 # carrying capacity
r <- 0.8 # intrinsic growth
for (i in 2:t) {
    n[i] <- n[i-1] + ( r * n[i-1] * (K - n[i-1])/K ) # calculate predicted population
    print(n[i])
}

# 5a. Use the rep command to make a vector of 18 zeros
vector1 <- rep(0, 18)
print(vector1)

# 5b. make the loop store 3 times the ith value of the iterator variable (i) in the ith spot of the vector created in part a.
for ( i in seq(1,18)) {
    vector1[i] <- (i * 3)
}
print(vector1)

# 5c. make a new vector of 18 zeros, and make the first entry of that vector have a value of 1
vector2 <- rep(0, 18)
vector2[1] <- 1
print(vector2)

# 5d. a for loop so that starting with the second entry of the vector created in part c, the value stored in that position in the vector is equal to one plus twice the value of the previous entry
for ( i in 2:18) {
    vector2[i] <- (1 + (vector2[i-1] * 2))
}
print(vector2)

# 6. a vector of the first 20 Fibonacci numbers
F_num <- 20
Fibonacci <- rep(0, F_num) # Pre-allocation with twenty 0
Fibonacci[2] <- 1 # set the second number to 1 (we start with 0)
for (i in 3:F_num) {
    Fibonacci[i] <- Fibonacci[i-2] + Fibonacci[i-1]
}
print(Fibonacci)

# 7. Redo question 4 from part I above, but now store all the data. (which is already done)
time <- seq(1, 12)
abundance <- n
plot(time, abundance)

# 8a. Read the data into RStudio
getwd()
#setwd()

# 8b. 
# (i) import everything but the year as type numeric
CO2_data1 <- read.csv("CO2_data_cut_paste.csv", header=TRUE, colClasses = c(NA, rep("numeric",7)))

# (ii) use a for loop, iterating on the variables/columns of the data frame, to change each variable/column (except the year) one by one
CO2_data2 <- read.csv("CO2_data_cut_paste.csv", header=TRUE)
col_num <- ncol(CO2_data2)
row_num <- nrow(CO2_data2)
col_name <- colnames(CO2_data2)
for (j in col_name) {
    if (j != "Year") {
        CO2_data2[,j] <- as.numeric(CO2_data2[,j])
    }
}

# 8c. calculate the percent change from year i-1 to year i across all years
#CO2_data2<-na.omit(CO2_data2)
#1
# I am not sure what the "R's ability to do element-by-element operations on data" mean, could you show me an example in the feedback? Thank you.

#2
#involves nested for loops
# there are NaN and Inf in the data frame, I am not sure if I do it correctly
CO2_data_percent_change <- CO2_data2
for (x in 2:col_num) {
    for (y in 2:row_num) {
        b <- CO2_data2[y-1,x]
        a <- CO2_data2[y,x]
        CO2_data_percent_change[y,x] <- (a - b)/b * 100
    }
    CO2_data_percent_change[1,x] <- NA
}

#8d. save your new data frame to "YearlyPercentChangesInCO2.csv"
write.csv(CO2_data_percent_change, file="YearlyPercentChangesInCO2.csv", sep=",")

#8e. Revisit step 8c, but for each year, calculate the percent change from the first year for which there is non-zero data
CO2_data_percent_change_nonzero <- CO2_data1
for (x in 2:col_num) {
    for (i in 2:row_num) {
        a <- CO2_data1[i,x]
        if ((!is.na(a)) & a != 0) {
            start_point <- i
            break
        }
        else {
            CO2_data_percent_change_nonzero[i,x] <- NA
        }
    }
    for (y in start_point:row_num) {
        b <- CO2_data1[y-1,x]
        a <- CO2_data1[y,x]
        if ((!is.na(a)) & (!is.na(b))) {
            CO2_data_percent_change_nonzero[y,x] <- (a - b)/b * 100
        } else {
            CO2_data_percent_change_nonzero[y,x] <- NA
        }
        
    }
    CO2_data_percent_change_nonzero[1,x] <- NA
}
write.csv(CO2_data_percent_change_nonzero, file="YearlyPercentChangesInCO2_begin_with_nonzero_data.csv", sep=",")

# I don't know why, but it seems no difference between the outputs of 8c and 8e