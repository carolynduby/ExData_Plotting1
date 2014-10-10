plot4 <- function() {
    ## download and read the power consumption data
    ## see file: read_power_consumption.R
    power_consumption <- read_power_consumption()
    
    ## redirect the plot to plot4.png
    png(file="plot4.png", width=480, height=480)
    
    ## create tiled plots of 2 rows by 2 columns
    par(mfrow = c(2, 2))
    
    ## create four plots combined together into one bitmap
    ## plot all data within the specified time interval
    valid_daterange <- new_interval(ymd("2007-02-01"), ymd("2007-02-02"))
    with(subset(power_consumption, Date %within% valid_daterange), {
        
        ## create upper left plot
        ## line graph of global active power over time
        plot(x=Timestamp, y=Global_active_power, type="n", main = NULL, xlab = "", ylab = "Global Active Power")
        lines(x=Timestamp, y=Global_active_power, pch=NULL)
        
        ## create upper right plot
        ## line graph of voltage over time
        plot(x=Timestamp, y=Voltage, xlab = "datetime", type = "n")
        lines(x=Timestamp, y=Voltage, pch=NULL)
        
        ## create lower left plot
        ## sub metering 1, sub metering 2, and sub metering 3 over time
        plot(Timestamp, Sub_metering_1, main = NULL, xlab = "", ylab = "Energy sub metering", type = "n")
        lines(Timestamp, Sub_metering_1, col = "black")
        lines(Timestamp, Sub_metering_2, col = "red")
        lines(Timestamp, Sub_metering_3, col = "blue")
        legend("topright", box.lty = "n", bty = "n", lty=c(1,1,1), col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        ## create lower right plot
        ## global reactive power over time
        plot(x=Timestamp, y=Global_reactive_power, type="l", main = NULL, lwd = .1, xlab = "datetime")
        lines(Timestamp, Global_reactive_power, pch = NULL)
        
    })
    
    ## close the png file
    dev.off()
}