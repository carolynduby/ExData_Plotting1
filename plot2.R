
plot2 <- function() {
    ## download and read the power consumption data
    ## see file: read_power_consumption.R
    power_consumption <- read_power_consumption()
    
    ## redirect the plot to plot2.png
    png(file= "plot2.png", width=480, height=480)
    
    ## plot a line graph of Global active power over time for the specified dates
    valid_daterange <- new_interval(ymd("2007-02-01"), ymd("2007-02-02"))
    with(subset(power_consumption, Date %within% valid_daterange), {
         ## create the plot, but don't show the points yet
         plot(x=Timestamp, y=Global_active_power, type="n", main = NULL, xlab = "", ylab = "Global Active Power (kilowatts)")
         ## draw lines between the points
         lines(x=Timestamp, y=Global_active_power, pch=NULL)
    })
    
    ## close the png file
    dev.off()
}
