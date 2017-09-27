
##This is the function for the 4th plot of the assignment

plot4 <- function ()
{

## Extract data into a dataset from file, and choose to use only the subset of two days worth of data by greppin for the last appearance of Jan 31st [ which is the day before Feb 1st] - thsi way, the next 2880 lines will have minute by minute data
##for the first two days of Feb 2007 as the assignment suggests
##Column names are specified explicitly since they were skipped while reading in the file, since we wanted to read only 2 days worth of data and not the whole big file
eda <- read.table("household_power_consumption.txt",sep=";",skip=grep("31/1/2007;23:59:00;", readLines("household_power_consumption.txt")),nrows=2880, col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), na.strings ="?")

##Below, a character string of both date and time values are formed
eda$DateTime <- paste(eda$Date, eda$Time)

##Convert the character object to a datetime format to play against
eda$NewDate <- as.POSIXct(strptime(eda$DateTime, "%d/%m/%Y %H:%M:%S"))

##Open the graphic device for png
png(file = "plot4.png")

##Define 2 rows and 2 columns since we need a toltal of 4 graphs appearing together
par(mfrow = c(2, 2), mar = c(4, 4, 4, 1))

##Plot for Global Active Power against datetime for the 2 day minute-by-minute consumption
plot(eda$NewDate,eda$Global_active_power, type='l', ylab = "Global Active Power(Kilowatts)", xlab = "")

##Plot for Voltage data
plot(eda$NewDate,eda$Voltage, type='l', ylab = "Voltage", xlab = "datetime")

##Plot for the submetering data, and lines() function is used to layer on more sub_metering for hte y axis using Base plotting system
plot(eda$NewDate,eda$Sub_metering_1 , type='l', ylab="Energy Sub Metering", xlab="")
lines(eda$NewDate,eda$Sub_metering_2 , col="red")
lines(eda$NewDate,eda$Sub_metering_3 , col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)

##Plot for the Global reactive power
plot(eda$NewDate,eda$Global_reactive_power, type='l', ylab = "Global_reactive_power", xlab = "datetime")

##exit the graphic device
dev.off()
}

