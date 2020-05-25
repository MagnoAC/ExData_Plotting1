### Exploratory Data Analysis - Course Project 1 ###

##DATASET##

#Description: Measurements of electric power consumption in one 
#household with a one-minute sampling rate over a period of almost 4 years. 
#Different electrical quantities and some sub-metering values are available.

##CODE##

#Description: The following code plots:
#1 - the continuous Global Active Power
#consumed on the period of 2 days (01-02-2007 and 02-02-2007)
#2 - the continuous Voltage on the period of 2 days (01-02-2007 and 02-02-2007)
#3 - the continuous Sub_metering 1, 2 and 3
#4 -  the continuous Global Reactive Power
#consumed on the period of 2 days (01-02-2007 and 02-02-2007) 


#import libraries
library(lubridate)

#setting work directory
if (getwd() !=  "./Exploratory Data Analysis - Coursera/") {
        setwd("./Exploratory Data Analysis - Coursera")
}

#Reading and Subsetting Data
table <- data.table::fread("C:/Users/arthu/Documents/Exploratory Data Analysis - Coursera/household_power_consumption.txt")
subtable <- subset(table, Date == "1/2/2007" | Date == "2/2/2007")


#Setting to numeric
subtable$Global_active_power <- as.numeric(as.character(subtable$Global_active_power))
Sub_metering_1 <- as.numeric(subtable$Sub_metering_1)
Sub_metering_2 <- as.numeric(subtable$Sub_metering_2)
Sub_metering_3 <- as.numeric(subtable$Sub_metering_3)
Voltage <- as.numeric(subtable$Voltage)
Global_Reactive_Power <- as.numeric(subtable$Global_reactive_power)
#Creating a Time vector with weekdays included
DateTime <- strptime(paste(subtable$Date, subtable$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


#Making it plot 4 graphics side by side
png("plot4.png", width=480, height=480)
par(mfrow =  c(2,2))

#plot 1

plot(DateTime, subtable$Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab = "")

#plot 2

plot(DateTime, Voltage, type="l",ylab="Voltage", xlab = "")


#plot 3

with(subtable, plot(DateTime, Sub_metering_1, ylab="Energy sub metering", xlab = "", type = "n"))
with(subtable, points(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab = ""))
with(subtable, points(DateTime, Sub_metering_2, type="l", ylab="Energy sub metering", xlab = "", col = "red"))
with(subtable, points(DateTime, Sub_metering_3, type="l", ylab="Energy sub metering", xlab = "", col = "blue")) 
legend ("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lty=1, lwd=2.5,bty="o")

#plot 4

plot(DateTime, Global_Reactive_Power, type="l",ylab="Global_reactive_power", xlab = "")

dev.off()