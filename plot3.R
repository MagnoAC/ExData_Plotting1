### Exploratory Data Analysis - Course Project 1 ###

##DATASET##

#Description: Measurements of electric power consumption in one 
#household with a one-minute sampling rate over a period of almost 4 years. 
#Different electrical quantities and some sub-metering values are available.

##CODE##

#Description: The following code plots the continuous Sub_metering 1, 2 and 3
#on the period of 2 days (01-02-2007 and 02-02-2007)

#import libraries
library(lubridate)

#setting work directory
if (getwd() !=  "./Exploratory Data Analysis - Coursera/") {
        setwd("./Exploratory Data Analysis - Coursera")
}

#Reading and Subsetting Data
table <- data.table::fread("C:/Users/arthu/Documents/Exploratory Data Analysis - Coursera/household_power_consumption.txt")
subtable <- subset(table, Date == "1/2/2007" | Date == "2/2/2007")


#Plot 3


#Setting to numeric
subtable$Global_active_power <- as.numeric(as.character(subtable$Global_active_power))
Sub_metering_1 <- as.numeric(subtable$Sub_metering_1)
Sub_metering_2 <- as.numeric(subtable$Sub_metering_2)
Sub_metering_3 <- as.numeric(subtable$Sub_metering_3)

#Creating a Time vector with weekdays included
DateTime <- strptime(paste(subtable$Date, subtable$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#plot
png("plot3.png", width=480, height=480)
with(subtable, plot(DateTime, Sub_metering_1, ylab="Energy sub metering", xlab = "", type = "n"))
with(subtable, points(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab = ""))
with(subtable, points(DateTime, Sub_metering_2, type="l", ylab="Energy sub metering", xlab = "", col = "red"))
with(subtable, points(DateTime, Sub_metering_3, type="l", ylab="Energy sub metering", xlab = "", col = "blue")) 
legend ("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lty=1, lwd=2.5)
dev.off()