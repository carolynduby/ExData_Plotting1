plot3 <- function() {
    ## download and read the power consumption data
    ## see file: read_power_consumption.R
    power_consumption <- read_power_consumption()
    
    ## redirect the plot to a png file
    png(file="plot3.png", width=480, height=480)
    
    ## plot sub metering 1, sub metering 2, and sub metering 3 over the specified time range
    ## all on the same graph
    valid_daterange <- new_interval(ymd("2007-02-01"), ymd("2007-02-02"))
    with(subset(power_consumption, Date %within% valid_daterange), {
        ## create the plot but don't show points
        plot(Timestamp, Sub_metering_1, main = NULL, xlab = "", ylab = "Energy sub metering", type = "n")
        
        ## add a black line for submetering 1
        lines(Timestamp, Sub_metering_1, col = "black")
        
        ## add a red line for submetering 2
        lines(Timestamp, Sub_metering_2, col = "red")
        
        ## add a blue line for submetering 3
        lines(Timestamp, Sub_metering_3, col = "blue")
        
        ## add the legend in the top right corner of the graph
        legend("topright", lty=c(1,1,1), col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    })
    
    ## close the png file
    dev.off()
}
