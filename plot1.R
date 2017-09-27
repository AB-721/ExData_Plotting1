
##This is the function for the 1st plot of the assignment

plot1 <- function ()
{


## Extract data into a dataset from file, and choose to use only the subset of two days worth of data by greppin for the last appearance of Jan 31st [ which is the day before Feb 1st] - thsi way, the next 2880 lines will have minute by minute data
##for the first two days of Feb 2007 as the assignment suggests
##Column names are specified explicitly since they were skipped while reading in the file, since we wanted to read only 2 days worth of data and not the whole big file

eda <- read.table("household_power_consumption.txt",sep=";",skip=grep("31/1/2007;23:59:00;", readLines("household_power_consumption.txt")),nrows=2880, col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), na.strings ="?")

png(file = "plot1.png")
hist(eda$Global_active_power, col = "red", xlab = "Global Active Power (Kilowatts)", main ="Global Active Power")
dev.off()
}

