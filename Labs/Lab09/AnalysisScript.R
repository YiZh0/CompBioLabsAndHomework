# building an analysis script
getwd()
# customize the next line as needed:
setwd("./Cusack_et_al/") # set for your clone of Sam's repo
camData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = F)

# the last column of the data is called "DateTime".
# Some hints about working with dates and times in R can be found at:
# https://www.stat.berkeley.edu/~s133/dates.html
# That is a lengthy page, but extremely useful!
# I found it by searching "working with dates in r" on DuckDuckGo.
# It was the first reasonable-looking non-advertisement link

# -------------- PROBLEM 1 ------------------ #
DateTime <- strptime(camData$DateTime, format='%d/%m/%Y %H:%M')



# -------------- PROBLEM 2 ------------------ #
#working
for (i in 1:length(tp)) {
    y <- as.numeric(format(tp[i],'%Y'))
    if (y < 19) {
        y <- y + 2000
    } else if (y > 19 & y < 1000) {
        y <- y + 1000
    }
    
}



# -------------- PROBLEM 3 ------------------ #




# -------------- PROBLEM 4 ------------------ #


