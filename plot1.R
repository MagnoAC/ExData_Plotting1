### Exploratory Data Analysis - Course Project 1 ###

##DATASET##

#Description: Measurements of electric power consumption in one 
#household with a one-minute sampling rate over a period of almost 4 years. 
#Different electrical quantities and some sub-metering values are available.

##CODE##

#Description: The following code plots an histogram of the Global Active Power
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


#Plot 1


#Setting to numeric
subtable$Global_active_power <- as.numeric(as.character(subtable$Global_active_power))

#histogram
png("plot1.png", height = 480, width = 480)
hist(subtable$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kiloWatts)", 
     main = "Global Active Power")

dev.off()