#lab step #3: two variables, chips is the number of bags of chips we have, guests is the number of guests
chips <- 5
guests <- 8

#lab step #5: create a new variable which store the average of bags of chips per guest
chips_per <- 0.4

#lab step #7: calculate the expected amount of leftover chips (include self)
leftover <- chips - ((guests + 1) * 0.4)

#lab step #8: ranktings for movies
Self <- c(7, 6, 5, 1, 2, 3, 4)
Penny <- c(5, 7, 6, 3, 1, 2, 4)
Jenny <- c(4, 3, 2, 7, 6, 5, 1)
Lenny <- c(1, 7, 3, 4, 6, 5, 2)
Stewie <- c(6, 7, 5, 4, 3, 1, 2)

#lab step #9: Penny???s ranking for Episode IV and Lenny???s rank of Episode IV
PennyIV <- Penny[4]
LennyIV <- Lenny[4]

#lab step #10: Concatenate all 5 sets of rankings
rankings <- cbind(Self, Penny, Jenny, Lenny, Stewie)

#lab step #11: inspect the structure of PennyIV, Penny, and rankings
#PennyIV is numeric, Penny 
#.....
str(PennyIV)
str(Penny)
str(rankings)

#lab step #12: make a ???data frame???
rankDF <- data.frame(Self, Penny, Jenny, Lenny, Stewie)
ranksDF <- as.data.frame(rankings)

#
dim(rankings)
dim(rankDF)

str(rankings)
str(rankDF)

rankings == rankDF

typeof(rankings)
typeof(rankDF)

#lab step #14: vector of the Episode names as Roman numerals
Episode <- c("I", "II", "III", "IV", "V", "VI", "VII")

#lab step #15: add names of the rows
row.names(ranksDF) <- Episode

#lab step #16: access the third row of the rankings
rankings[3,]

#lab step #17: access the fourth column of the ranksDF
ranksDF[,4]

#lab step #18: access self ranking for Episode V
ranksDF[5, 1]

#lab step #19: access Penny???s ranking for Episode II
ranksDF[2, 2]

#lab step #20: access everyone???s rankings for episodes IV ??? VI hh
