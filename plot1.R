library(plyr)
library(lubridate)

plot1 <- function() {
    ## download and read the power consumption data
    ## see file: read_power_consumption.R
    power_consumption <- read_power_consumption()
    
    ## redirect the plot to a png file
    png(file= "plot1.png", width=480, height=480)
    
    ## create a histogram of global active power frequencies for the specified date range
    valid_daterange <- new_interval(ymd("2007-02-01"), ymd("2007-02-02"))
    with(subset(power_consumption, Date %within% valid_daterange), 
         hist(Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
    
    ## close the png file
    dev.off()
}

