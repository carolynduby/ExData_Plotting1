## Common code to read the power consumption data, used by all plot functions
## 
## Download the zipped household power consumption data if it is not there already.
## Extract the household power consumption text file.
## Read the houseold power consumption values into a data frame.
## Calculate timestamps for the time series plots
read_power_consumption <- function() {
    power_consumption_zip_file <- "household_power_consumption.zip"
    power_consumption_file <- "household_power_consumption.txt"
    
    ## if the file was not downloaded previously, download it and expand the zip
    if (!file.exists(power_consumption_file)) {
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = power_consumption_zip_file, mode="wb")
        unzip(power_consumption_zip_file, exdir = ".")
    }
    
    ## read the power consumption data using semicolon as the separator
    power_consumption <- read.csv(power_consumption_file, sep = ";", 
                                  colClasses=c('character', 'character', rep('numeric',7)), na.strings=("?"))
    
    ## Calculate a timestamp required for time series plots
    power_consumption <- mutate(power_consumption, Timestamp = dmy_hms(paste(Date, Time, sep=" ")))
    mutate(power_consumption, Date = dmy(Date), Time = hms(Time))
}

## Convenience function to create all four plots
create_plots <- function() {
    plot1()
    plot2()
    plot3()
    plot4()
}
