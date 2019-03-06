# Script for Lab #7 (= Assignment #6) 
# Yin Zhou
# May 01, 2019


#########

# Problem 1.  Area of a triangle when given base and height

# Function definition:
triangleArea <- function(base, height) {
    # base and height of the triangle must be given
    # calculate triangle area
    area <- 0.5 * base * height
    # give back the triangle area as result
    return( area )
}

# Demonstration of usage:
# Suppose a triangle with base 10 and height 9; we expect the area to be 45
triangleArea(10, 9)


########

# Problem #2.  Our own absolute value function
# myAbs() will returns the absolute value of a number, or the absolute value of each number in a numeric vector. 
# Function definition:
myAbs <- function(ourNum) {
    # a number or a numeric vector must be given
    # change elements in ourNum to its opposite number if it is negative
    neg_idx <- which(ourNum < 0)
    ourNum[neg_idx] <- -ourNum[neg_idx]
    
    #for loop
    # for (i in 1:length(ourNum)) {
    #     if (is.na(ourNum[i])) {
    #         next
    #     } else if (ourNum[i] < 0) {
    #         ourNum[i] <- -ourNum[i]
    #     }
    # }
    # give back the absolute value of ourNum as result
    return( ourNum )
}

# Demonstrate that it works:
# 2a
myAbs(5)
myAbs(-2.3)
# 2b
myAbs(c(1.1, 2, 0, -4.3, 9, -12))


########

# Problem #3.  Fibonacci numbers generator
# returns a vector of the first n Fibonacci numbers
# Function definition:
Fibonacci <- function(n, startingNum) {
    # value of n and starting number of the vector of Fibonacci numbers must be given
    if (startingNum != 0 & startingNum != 1) {
        cat("unexpected startingNum")
        return()
    }
    if (is.na(n)) {
        cat("n cannot be NA")
        return()
    } else if (n <= 0 | n%%1!=0) {
        cat("n must be a positive integer")
        return()
    }
    # pre-allocation with 0
    Fibonacci_vec <- rep(0, n)
    # set the second number to startingNum
    Fibonacci_vec[1] <- startingNum
    if (n == 1) {
        return( Fibonacci_vec )
    }
    # set the second number to 1
    Fibonacci_vec[2] <- 1
    if (n == 2) {
        return( Fibonacci_vec )
    }
    for (i in 3:n) {
        Fibonacci_vec[i] <- Fibonacci_vec[i-2] + Fibonacci_vec[i-1]
    }
    
    # give back the vector of Fibonacci numbers as result
    return( Fibonacci_vec )
}


# Demonstration of usage:
# 
Fibonacci(1, 1)
Fibonacci(0, 1)
Fibonacci(7, 0)
Fibonacci(10.1, 1)


########

# Problem #4.  Function calculate and return the quantity (x - y) ^ 2.
# function takes two numbers as its arguments and returns the square of the difference between them. 
# Function definition:
sqr_of_diff <- function(x, y) {
    # x and y must be given
    # calculate (x - y) ^ 2
    result <- (x - y) ^ 2
    # give back the result as result
    return( result )
}

# Demonstration of usage:
# Call the function with the numbers 3 and 5. Function should return the number 4
sqr_of_diff(3, 5)
# Call the function with the first argument c(2, 4, 6) and the second argument 4. Function should return the vector 4 0 4. 
sqr_of_diff(c(2, 4, 6), 4)

#4b.
# Calculates the average of a vector of numbers. 
# Function definition:
vecAverage <- function(nums) {
    # a vector of numbers must be given
    # calculate the average
    numAverage <- sum(nums)/length(nums)
    # give back the average as result
    return( numAverage )
}

# Demonstration of usage:
# Suppose calling function with the vector c(5, 15, 10)
vecAverage(c(5, 15, 10))

#importing data
data <- read.csv("DataForLab07.csv", header=T)
data_vec <- data$x
#expect 108.9457
vecAverage(data_vec)

# 4c
# sum of squares function
# Function definition:
sum_of_sqr <- function(num_vec) {
    # a vector of numbers must be given must be given
    # calculate the average by calling vecAverage
    average <- vecAverage(num_vec)
    # for each data point, the mean is subtracted from the data point, and the resulting difference is squared
    # for (i in 1:length(num_vec)) {
    #     num_vec[i] <- sqr_of_diff(num_vec[i],average)
    # }
    num_vec <- sqr_of_diff(num_vec,average)
    # give back sum of squares of the vector of numbers as result
    return( sum(num_vec) )
}

# Demonstration of usage:
#expect 179442.4
sum_of_sqr(data_vec)
