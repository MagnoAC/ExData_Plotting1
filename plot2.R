### Exploratory Data Analysis - Course Project 1 ###

##DATASET##

#Description: Measurements of electric power consumption in one 
#household with a one-minute sampling rate over a period of almost 4 years. 
#Different electrical quantities and some sub-metering values are available.

##CODE##

#Description: The following code plots the continuous Global Active Power
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


#Plot 2


#Setting to numeric
subtable$Global_active_power <- as.numeric(as.character(subtable$Global_active_power))
#Creating a Time vector with weekdays included
DateTime <- strptime(paste(subtable$Date, subtable$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#plot
png("plot2.png", width=480, height=480)
plot(DateTime, subtable$Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab = "")
dev.off()

